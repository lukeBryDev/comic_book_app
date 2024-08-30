import 'package:comic_book_app/src/features/data/mappers/comic_detail_item_mapper.dart';
import 'package:comic_book_app/src/features/data/models/comicVineAPI/issue_detail_comic_vine.dart';
import 'package:comic_book_app/src/features/domain/entities/entities.dart';

class ComicDetailMapper {
  static ComicDetailEntity comicDetailEntity(IssueDetailComicVine comic) =>
      ComicDetailEntity(
        title: comic.name,
        number: comic.issueNumber,
        image: comic.image.originalUrl,
        description: comic.description,
        creators: comic.personCredits
            .map((e) => ComicDetailItemMapper.comicDetailEntity(e))
            .toList(),
        characters: comic.characterCredits
            .map((e) => ComicDetailItemMapper.comicDetailEntity(e))
            .toList(),
        teams: comic.teamCredits
            .map((e) => ComicDetailItemMapper.comicDetailEntity(e))
            .toList(),
        concepts: comic.conceptCredits
            .map((e) => ComicDetailItemMapper.comicDetailEntity(e))
            .toList(),
        locations: comic.locationCredits
            .map((e) => ComicDetailItemMapper.comicDetailEntity(e))
            .toList(),
      );
}
