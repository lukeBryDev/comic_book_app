import 'package:comic_book_app/src/features/data/models/comicVineAPI/issue_comic_vine.dart';
import 'package:comic_book_app/src/features/domain/entities/comic_entity.dart';

class ComicMapper {
  static ComicEntity comicEntity(IssueComicVine issue) => ComicEntity(
      id: issue.id,
      image: issue.image.mediumUrl,
      firstStoresSoldDate: issue.storeDate,
      name: issue.name,
      number: issue.issueNumber);
}
