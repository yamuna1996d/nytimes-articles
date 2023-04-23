import 'dart:convert';
import 'package:flutter/cupertino.dart';
import '../Models/ProductModel.dart';
import '../api-interface/articles.dart';

class PopularArticlesProvider with ChangeNotifier {
  List<Results> popularArticles = [];

  Future<List<Results>?> fetch() async {
    popularArticles = await ArticleInterface.fetchArticle();
    notifyListeners();
    return popularArticles;
  }
}
