import 'package:news_app/features/daily_news/domain/repository/article_repository.dart';

import '../../../../core/resources/data_state.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/article.dart';

class GetArticleUseCase2 implements UseCase<DataState<List<ArticleEntity>>,void> {

  final ArticleRepository2 _articleRepository;

  GetArticleUseCase2(this._articleRepository);

  @override
  Future<DataState<List<ArticleEntity>>> call({void params}) {
    return _articleRepository.getNewsArticles2();
  }
}