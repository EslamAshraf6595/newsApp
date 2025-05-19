import 'package:flutter/material.dart';
import 'package:news_app/api/api_manager.dart';
import 'package:news_app/model/news_response.dart';
import 'package:news_app/model/sourceResponse.dart';
import 'package:news_app/ui/home/news/news_item.dart';
import 'package:news_app/ui/home/news/show_moda_lbottom_sheet_for_current_news.dart';
import 'package:news_app/utils/appColors.dart';
import 'package:news_app/utils/app_styles.dart';

class NewsWidget extends StatefulWidget {
  NewsWidget({
    super.key,
    required this.source,
    required this.query,
  });

  final Source source;
  final String query;

  @override
  State<NewsWidget> createState() => _NewsWidgetState();
}

class _NewsWidgetState extends State<NewsWidget> {
  List<News> allArticles = [];
  int currentPage = 1;
  bool isLoading = false;
  bool hasMore = true;
  bool isError = false;

  final ScrollController scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    fetchNews(reset: true);

    scrollController.addListener(() {
      if (scrollController.position.pixels >=
              scrollController.position.maxScrollExtent - 200 &&
          !isLoading &&
          hasMore) {
        fetchNews();
      }
    });
  }

  @override
  void didUpdateWidget(covariant NewsWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.source.id != widget.source.id || oldWidget.query != widget.query) {
      // Reset and fetch new news when source or query changes
      fetchNews(reset: true);
    }
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  Future<void> fetchNews({bool reset = false}) async {
    if (isLoading) return;

    if (reset) {
      currentPage = 1;
      hasMore = true;
      allArticles.clear();
      isError = false;
      setState(() {});
    }

    setState(() {
      isLoading = true;
      isError = false;
    });

    try {
      final response = await ApiManager.getNewsBySourceId(
        widget.source.id ?? '',
        widget.source.language ?? 'en',
        widget.query,
        currentPage,
      );

      if (!mounted) return;

      if (response?.status != 'ok') {
        setState(() {
          isError = true;
          isLoading = false;
          hasMore = false;
        });
        return;
      }

      final fetchedArticles = response?.articles ?? [];

      // Filter articles by query (case insensitive)
      final queryLower = widget.query.toLowerCase();
      final filteredFetched = fetchedArticles.where((article) {
        final title = article.title?.toLowerCase() ?? '';
        final description = article.description?.toLowerCase() ?? '';
        return title.contains(queryLower) || description.contains(queryLower);
      }).toList();

      setState(() {
        isLoading = false;
        if (reset) {
          allArticles = filteredFetched;
        } else {
          allArticles.addAll(filteredFetched);
        }
        if (filteredFetched.isEmpty) {
          hasMore = false;
        } else {
          currentPage++;
        }
      });
    } catch (e) {
      if (!mounted) return;
      setState(() {
        isLoading = false;
        isError = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    if (isLoading && allArticles.isEmpty) {
      // Initial loading indicator
      return const Center(
        child: CircularProgressIndicator(color: Appcolors.greyColor),
      );
    }

    if (isError && allArticles.isEmpty) {
      // Initial error UI with retry
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Something went wrong', style: AppStyles.medium20Black),
          ElevatedButton(
            onPressed: () => fetchNews(reset: true),
            child: Text('Try Again', style: AppStyles.medium20Black),
          ),
        ],
      );
    }

    if (allArticles.isEmpty) {
      // No articles found message
      return Center(
        child: Text(
          'No articles found for "${widget.query}"',
          style: AppStyles.medium20Black,
        ),
      );
    }

    return ListView.builder(
      controller: scrollController,
      itemCount: allArticles.length + (hasMore ? 1 : 0),
      itemBuilder: (context, index) {
        if (index == allArticles.length) {
          // Loading indicator at the bottom
          if (isError) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 16),
              child: Center(
                child: Column(
                  children: [
                    Text('Failed to load more', style: AppStyles.medium20Black),
                    ElevatedButton(
                      onPressed: () => fetchNews(),
                      child: Text('Try Again', style: AppStyles.medium20Black),
                    ),
                  ],
                ),
              ),
            );
          } else {
            return const Padding(
              padding: EdgeInsets.symmetric(vertical: 16),
              child: Center(child: CircularProgressIndicator(color: Appcolors.greyColor)),
            );
          }
        }

        return GestureDetector(
          onTap: () {
            showModalBottomSheetForCurrentNews(allArticles[index]);
          },
          child: NewsItem(news: allArticles[index]),
        );
      },
    );
  }

  void showModalBottomSheetForCurrentNews(News currentNewsItem) {
    showModalBottomSheet(
      context: context,
      builder: (context) => ShowModaLbottomSheetForCurrentNews(
        currentNewsItme: currentNewsItem,
      ),
    );
  }
}
