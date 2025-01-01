import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:news_application/config/constants.dart';
import 'package:news_application/models/articles_model.dart';
import '../../models/sources_model.dart';
class ApiManager{
  static Future<List<Source>>fetchSourcesList(String categoryID) async{
    var url = Uri.https(
      Constant.domain,
      "/v2/top-headlines/sources",
      {
        "apiKey": Constant.apiKey,
        "category": categoryID
      }


    );
    final response = await http.get(url);
    if(response.statusCode == 200){
      Map<String,dynamic> data =jsonDecode(response.body);

      SourceModel sourceModel = SourceModel.fromJson(data);

      return sourceModel.sources;

    }
    else
      {
        throw Exception("Failed To Get Sources");
      }


  }
  static Future<List<Article>>fetchArticlesList(String sourcesId) async{
    var url = Uri.https(
        Constant.domain,
        "/v2/top-headlines",
        {
          "apiKey": Constant.apiKey,
          "sources": sourcesId
        }


    );
    final response = await http.get(url);
    if(response.statusCode == 200){
      Map<String,dynamic> data =jsonDecode(response.body);

      ArticlesModel articlesModel = ArticlesModel.fromJson(data);

      return articlesModel.atricles;

    }
    else
    {
      throw Exception("Failed To Get Sources");
    }


  }


}