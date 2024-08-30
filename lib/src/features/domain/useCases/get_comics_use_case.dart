import 'package:comic_book_app/src/config/error/failures.dart';
import 'package:comic_book_app/src/config/usecases/usecase.dart';
import 'package:comic_book_app/src/features/data/DTOs/dtos.dart';
import 'package:comic_book_app/src/features/domain/entities/comics_entity.dart';
import 'package:comic_book_app/src/features/domain/repositories/comics_repository.dart';
import 'package:dartz/dartz.dart';

class GetComicsUseCase implements UseCase<ComicsEntity, GetComicsDTO> {
  final ComicsRepository repository;

  GetComicsUseCase(this.repository);

  @override
  Future<Either<Failure, ComicsEntity>> call(GetComicsDTO params) async {
    return await repository.getComics(params);
  }
}
