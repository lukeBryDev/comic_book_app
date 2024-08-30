import 'package:comic_book_app/src/config/error/failures.dart';
import 'package:comic_book_app/src/features/data/DTOs/dtos.dart';
import 'package:comic_book_app/src/features/domain/entities/entities.dart';
import 'package:dartz/dartz.dart';

abstract class ComicsRepository {
  Future<Either<Failure, ComicsEntity>> getComics(GetComicsDTO params);
}
