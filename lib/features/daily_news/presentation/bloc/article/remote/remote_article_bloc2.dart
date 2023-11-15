import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/features/daily_news/domain/usecases/get_article2.dart';
import 'package:news_app/features/daily_news/presentation/bloc/article/remote/remote_article_event2.dart';
import 'package:news_app/features/daily_news/presentation/bloc/article/remote/remote_articles_state2.dart';

import '../../../../../../core/resources/data_state.dart';

class RemoteArticlesBloc2 extends Bloc<RemoteArticlesEvent2,RemoteArticlesState2> {

  final GetArticleUseCase2 _getArticle2UseCase;

  RemoteArticlesBloc2(this._getArticle2UseCase) : super(const RemoteArticlesLoading()){
    on <GetArticles2> (onGetArticles2);
  }


  void onGetArticles2(GetArticles2 event, Emitter < RemoteArticlesState2 > emit) async {
    final dataState = await _getArticle2UseCase();

    if (dataState is DataSuccess && dataState.data!.isNotEmpty) {
      emit(
          RemoteArticlesDone(dataState.data!)
      );
    }

    if (dataState is DataFailed) {
      emit(
          RemoteArticlesError(dataState.error!)
      );
    }
  }

}