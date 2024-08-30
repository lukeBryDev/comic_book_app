import 'package:comic_book_app/src/config/error/failures.dart';
import 'package:comic_book_app/src/features/domain/dataSources/comics_remote_data_source.dart';
import 'package:comic_book_app/src/features/domain/entities/entities.dart';
import 'package:comic_book_app/src/features/data/DTOs/dtos.dart';
import 'package:comic_book_app/src/features/domain/repositories/comics_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class ComicsRepositoryImpl implements ComicsRepository {
  final ComicsRemoteDataSource remoteDataSource;

  ComicsRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Either<Failure, ComicsEntity>> getComics(GetComicsDTO params) async {
    try {
      final res = await remoteDataSource.comics(params);
      return Right(res);
    } on ServerFailure catch (server) {
      return Left(server);
    } on DioException catch (e) {
      throw ServerFailure(error: e).extract;
    } on Error catch (e) {
      throw ErrorFailure(error: e);
    } on Exception catch (error) {
      throw ExceptionFailure(error: error).extract;
    }
  }

  @override
  Future<Either<Failure, ComicDetailEntity>> getComicDetail(
      GetComicDetailDTO params) async {
    try {
      final res = await remoteDataSource.comicDetail(params);
      return Right(res);
    } on ServerFailure catch (server) {
      return Left(server);
    } on DioException catch (e) {
      throw ServerFailure(error: e).extract;
    } on Error catch (e) {
      throw ErrorFailure(error: e);
    } on Exception catch (error) {
      throw ExceptionFailure(error: error).extract;
    }
  }
}
