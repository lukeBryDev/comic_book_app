import 'package:comic_book_app/src/config/env/env.dart';
import 'package:comic_book_app/src/config/http/app_interceptors.dart';
import 'package:dio/dio.dart';

class ComicVineAPIProvider {
  final String _baseApiUrl = Env.api;

  late Dio dio;

  late ComicVineQueryParams queryParams;

  ComicVineAPIProvider() {
    queryParams = ComicVineQueryParams(apiKey: Env.comicVineApiKey);
    dio = Dio(
        BaseOptions(baseUrl: _baseApiUrl, queryParameters: queryParams.params));
    dio.interceptors.add(AppInterceptors());
  }
}

class ComicVineQueryParams {
  final String apiKey;
  final Map<String, dynamic>? params;

  ComicVineQueryParams({required this.apiKey, this.params});

  ComicVineQueryParams copyWith(
          {String? apiKey, Map<String, dynamic>? params}) =>
      ComicVineQueryParams(
          apiKey: apiKey ?? this.apiKey, params: params ?? this.params);

  Map<String, dynamic> queryParams() {
    final base = {
      'format': 'json',
      'api_key': apiKey,
    };
    Map<String, dynamic> queryParams = {
      ...base,
      ...?params,
    };

    return queryParams;
  }
}
