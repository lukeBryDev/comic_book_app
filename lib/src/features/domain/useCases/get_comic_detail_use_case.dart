import 'package:comic_book_app/src/config/error/failures.dart';
import 'package:comic_book_app/src/config/usecases/usecase.dart';
import 'package:comic_book_app/src/features/data/DTOs/dtos.dart';
import 'package:comic_book_app/src/features/domain/entities/entities.dart';
import 'package:comic_book_app/src/features/domain/repositories/comics_repository.dart';
import 'package:dartz/dartz.dart';

class GetComicsUseCase
    implements UseCase<ComicDetailEntity, GetComicDetailDTO> {
  final ComicsRepository repository;

  GetComicsUseCase(this.repository);

  @override
  Future<Either<Failure, ComicDetailEntity>> call(
      GetComicDetailDTO params) async {
    return await repository.getComicDetail(params);
  }
}
