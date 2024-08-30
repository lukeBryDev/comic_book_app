import 'package:comic_book_app/src/features/data/mappers/comic_mapper.dart';
import 'package:comic_book_app/src/features/data/models/comicVineAPI/issues_comic_vine_response.dart';
import 'package:comic_book_app/src/features/domain/entities/entities.dart';

class ComicsMapper {
  static ComicsEntity comicEntity(
          IssuesComicVineResponse issues) =>
      ComicsEntity(
          offset: issues.offset,
          comics:
              issues.results.map((e) => ComicMapper.comicEntity(e)).toList());
}
