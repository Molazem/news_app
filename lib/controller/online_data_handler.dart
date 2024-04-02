import 'package:news_app/controller/constants.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;
import '../model/news_article_model.dart';

class OhMyData{
  final String _theApi = TheAPI().theApi;
  final List<ArticleModel> _theNewsList = [];


  Future<List<ArticleModel>> theData() async{
    var request = await http.get(Uri.parse(_theApi));
    var response = convert.jsonDecode(request.body)['articles'] as List<dynamic>;
    if(request.statusCode == 200){
      for(var data in response){
        _theNewsList.add(ArticleModel.fromJson(data));
      }
    }else{
      throw(Exception('data Error'));
    }
    return _theNewsList;
  }
}