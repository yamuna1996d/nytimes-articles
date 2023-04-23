import 'dart:convert';
import '../Models/ProductModel.dart';
import '../constraints/api/api_methods.dart';
import '../constraints/api/api_request.dart';
import '../constraints/constraints.dart';

class ArticleInterface{
  static Future<List<Results>> fetchArticle() async {
    try {
      final response = await ApiRequest.send(
        method: ApiMethod.GET,
        route: 'mostviewed/all-sections/7.json?api-key=$NY_API_KEY',
      );
        return (response['results']as List).map((e) => Results.fromJson(e)).toList();

    } catch (err) {
      print("fetching article error: $err");
      return [];
    }
  }
}