import 'package:comic_book_app/src/config/env/env.dart';
import 'package:comic_book_app/src/config/http/app_interceptors.dart';
import 'package:dio/dio.dart';

class ComicVineAPIProvider {
  final String _baseApiUrl = Env.api;

  late Dio dio;

  ComicVineAPIProvider() {
    dio = Dio(BaseOptions(baseUrl: _baseApiUrl));
    dio.interceptors.add(AppInterceptors());
  }
}
