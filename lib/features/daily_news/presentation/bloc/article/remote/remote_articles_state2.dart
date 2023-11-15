import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';

import '../../../../domain/entities/article.dart';

abstract class RemoteArticlesState2 extends Equatable {
  final List<ArticleEntity> ? articles;
  final DioException ? error;

  const RemoteArticlesState2({this.articles,this.error});

  @override
  List<Object> get props => [articles!, error!];
}

class RemoteArticlesLoading extends RemoteArticlesState2 {
  const RemoteArticlesLoading();
}

class RemoteArticlesDone extends RemoteArticlesState2 {
  const RemoteArticlesDone(List<ArticleEntity> article) : super(articles: article);
}

class RemoteArticlesError extends RemoteArticlesState2 {
  const RemoteArticlesError(DioException error) : super(error: error);
}