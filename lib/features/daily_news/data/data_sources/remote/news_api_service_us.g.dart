// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'news_api_service_us.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

class _NewsApiService2 implements NewsApiService2 {
  _NewsApiService2(
    this._dio, {
    this.baseUrl,
  }) {
    baseUrl ??= 'https://newsapi.org/v2';
  }

  final Dio _dio;

  String? baseUrl;

  @override
  Future<HttpResponse<List<ArticleModel2>>> getNewsArticles2({
    String? apiKey,
    String? country,
    String? category,
  }) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{
      r'apiKey': apiKey,
      r'country2': country,
      r'category2': category,
    };
    queryParameters.removeWhere((k, v) => v == null);
    final _headers = <String, dynamic>{};
    final _data =<String,dynamic> {};
    final _result = await _dio.fetch<Map<String,dynamic>>(
        _setStreamType<HttpResponse<List<ArticleModel2>>>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              '/top-headlines',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(
                baseUrl: _combineBaseUrls(
              _dio.options.baseUrl,
              baseUrl,
            ))));
    List<ArticleModel2> value = _result.data!['articles']
        .map<ArticleModel2>((dynamic i) => ArticleModel2.fromJson(i as Map<String, dynamic>))
        .toList();
    final httpResponse = HttpResponse(value, _result);
    return httpResponse;
  }

  RequestOptions _setStreamType<T>(RequestOptions requestOptions) {
    if (T != dynamic &&
        !(requestOptions.responseType == ResponseType.bytes ||
            requestOptions.responseType == ResponseType.stream)) {
      if (T == String) {
        requestOptions.responseType = ResponseType.plain;
      } else {
        requestOptions.responseType = ResponseType.json;
      }
    }
    return requestOptions;
  }

  String _combineBaseUrls(
    String dioBaseUrl,
    String? baseUrl,
  ) {
    if (baseUrl == null || baseUrl.trim().isEmpty) {
      return dioBaseUrl;
    }

    final url = Uri.parse(baseUrl);

    if (url.isAbsolute) {
      return url.toString();
    }

    return Uri.parse(dioBaseUrl).resolveUri(url).toString();
  }
}
