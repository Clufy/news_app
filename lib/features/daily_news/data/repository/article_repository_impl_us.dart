import 'dart:io';

import 'package:dio/dio.dart';

import '../../../../core/constants/constants.dart';
import '../../../../core/resources/data_state.dart';
import '../../domain/entities/article.dart';
import '../../domain/repository/article_repository.dart';
import '../data_sources/local/app_database.dart';
import '../data_sources/remote/news_api_service_us.dart';
import '../models/article.dart';

class ArticleRepositoryImpl2 implements ArticleRepository2 {
final NewsApiService2 _newsApiService;
final AppDatabase _appDatabase;
ArticleRepositoryImpl2(this._newsApiService,this._appDatabase);

@override
Future<DataState<List<ArticleModel>>> getNewsArticles2() async {
  try {
    final httpResponse = await _newsApiService.getNewsArticles2(
      apiKey:newsAPIKey,
      country:country2Query,
      category:category2Query,
    );

    if (httpResponse.response.statusCode == HttpStatus.ok) {
      return DataSuccess(httpResponse.data);
    } else {
      return DataFailed(
          DioException(
              error: httpResponse.response.statusMessage,
              response: httpResponse.response,
              type: DioExceptionType.badResponse,
              requestOptions: httpResponse.response.requestOptions
          )
      );
    }
  } on DioException catch(e){
    return DataFailed(e);
  }
}

@override
Future<List<ArticleModel>> getSavedArticles() async {
  return _appDatabase.articleDAO.getArticles();
}

@override
Future<void> removeArticle(ArticleEntity article) {
  return _appDatabase.articleDAO.deleteArticle(ArticleModel.fromEntity(article));
}

@override
Future<void> saveArticle(ArticleEntity article) {
  return _appDatabase.articleDAO.insertArticle(ArticleModel.fromEntity(article));
}
}