import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class NewsWebViewScreen extends StatelessWidget {
  final String url;
  const NewsWebViewScreen({super.key, required this.url});

  @override
  Widget build(BuildContext context) {
    final controller = WebViewController()
      ..loadRequest(Uri.parse(url))
      ..setJavaScriptMode(JavaScriptMode.unrestricted);

    return Scaffold(
      appBar: AppBar(title: Text("News Details")),
      body: WebViewWidget(controller: controller),
    );
  }
}
