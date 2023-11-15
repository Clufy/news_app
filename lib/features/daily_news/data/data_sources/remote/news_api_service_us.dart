import 'package:retrofit/retrofit.dart';
import '../../../../../core/constants/constants.dart';
import 'package:dio/dio.dart';
import '../../models/article.dart';
import '../../models/article2.dart';

part 'news_api_service_us.g.dart';

@RestApi(baseUrl:newsAPIBaseURL)
abstract class NewsApiService2 {
  factory NewsApiService2(Dio dio) = _NewsApiService2;

  @GET('/top-headlines')
  Future<HttpResponse<List<ArticleModel2>>> getNewsArticles2({
    @Query("apiKey") String ? apiKey,
    @Query("country2") String ? country,
    @Query("category2") String ? category,
  });
}