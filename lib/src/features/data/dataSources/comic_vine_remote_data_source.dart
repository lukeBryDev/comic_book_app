import 'package:comic_book_app/src/config/error/failures.dart';
import 'package:comic_book_app/src/config/http/comic_vine_api_provider.dart';
import 'package:comic_book_app/src/features/data/DTOs/get_comics_dto.dart';
import 'package:comic_book_app/src/features/data/mappers/comics_mapper.dart';
import 'package:comic_book_app/src/features/data/models/comicVineAPI/issues_comic_vine_response.dart';
import 'package:comic_book_app/src/features/domain/dataSources/comics_remote_data_source.dart';
import 'package:comic_book_app/src/features/domain/entities/comics_entity.dart';
import 'package:dio/dio.dart';

class ComicVineRemoteDataSource extends ComicVineAPIProvider
    implements ComicsRemoteDataSource {
  @override
  Future<ComicsEntity> comics(GetComicsDTO params) async {
    try {
      const String path = '/issues';
      final res = await dio.get(path, queryParameters: params.toQueryParams());
      final issues = IssuesComicVineResponse.fromJson(res.data);
      return ComicsMapper.comicEntity(issues);
    } on DioException catch (e) {
      throw ServerFailure(error: e).extract;
    } on Error catch (error) {
      throw ErrorFailure(error: error).extract;
    } on Exception catch (error) {
      throw ExceptionFailure(error: error).extract;
    }
  }
}
