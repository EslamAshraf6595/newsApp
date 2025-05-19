import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:news_app/api/api_EndPoints.dart';
import 'package:news_app/api/api_constants.dart';
import 'package:news_app/model/news_response.dart';
import 'package:news_app/model/sourceResponse.dart';
class ApiManager {

    static Future<SourceResponse?> getSources(String categoryID,String language,String search,int page)async{
      Uri url = Uri.https(
        ApiConstants.baseUrl,
        EndPoints.sourceApi,
        {
          'apiKey' : ApiConstants.apiKey ,
          'category':categoryID,
          'language':language,
          'q':search,
          'page':page.toString(),
        }
      );
      try{
        var response = await http.get(url);
        var bodyString = response.body ;
        var json = jsonDecode(bodyString);
        return SourceResponse.fromJson(json);
      }catch(e){
          throw e ;
      }
    
    }

    static Future<NewsResponse>  getNewsBySourceId(String sourceId,String language,String search,int page)async{
        Uri url = Uri.https(ApiConstants.baseUrl,
        EndPoints.newsApi,{
         'apiKey' : ApiConstants.apiKey,
         'sources' : sourceId,
          'language':language,
          'q':search,
          'page':page.toString(),
        }
        );
        try{
          var response = await http.get(url);
          var reponseBody = response.body ;
          var json = jsonDecode(reponseBody);
          return NewsResponse.fromJson(json);
        }catch(e){
          throw e ;
        }
    }

    //https://newsapi.org/v2/everything?q=bitcoin&apiKey=66766e02796e4e819df22a5c1473f605
}