import 'package:comic_book_app/src/config/error/failures.dart';
import 'package:comic_book_app/src/config/http/comic_vine_api_provider.dart';
import 'package:comic_book_app/src/features/data/DTOs/get_comic_detail_dto.dart';
import 'package:comic_book_app/src/features/data/DTOs/get_comics_dto.dart';
import 'package:comic_book_app/src/features/data/mappers/mappers.dart';
import 'package:comic_book_app/src/features/data/models/models.dart';
import 'package:comic_book_app/src/features/domain/dataSources/comics_remote_data_source.dart';
import 'package:comic_book_app/src/features/domain/entities/comic_detail_entity.dart';
import 'package:comic_book_app/src/features/domain/entities/comics_entity.dart';
import 'package:dio/dio.dart';

class ComicVineRemoteDataSource extends ComicVineAPIProvider
    implements ComicsRemoteDataSource {
  @override
  Future<ComicsEntity> comics(GetComicsDTO params) async {
    try {
      const String path = '/issues';
      final res = await dio.get(path,
          queryParameters: queryParams
              .copyWith(params: params.toQueryParams())
              .queryParams());
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

  @override
  Future<ComicDetailEntity> comicDetail(GetComicDetailDTO params) async {
    try {
      final String path = '/issue/4000-${params.id}';
      final res =
          await dio.get(path, queryParameters: queryParams.queryParams());
      final issue = IssueDetailComicVine.fromJson(res.data['results']);
      return ComicDetailMapper.comicDetailEntity(issue);
    } on DioException catch (e) {
      throw ServerFailure(error: e).extract;
    } on Error catch (error) {
      throw ErrorFailure(error: error).extract;
    } on Exception catch (error) {
      throw ExceptionFailure(error: error).extract;
    }
  }
}
