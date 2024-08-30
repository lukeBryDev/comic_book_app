import 'package:comic_book_app/src/features/data/DTOs/dtos.dart';
import 'package:comic_book_app/src/features/domain/entities/entities.dart';

abstract class ComicsRemoteDataSource {
  Future<ComicsEntity> comics(GetComicsDTO params);
}
