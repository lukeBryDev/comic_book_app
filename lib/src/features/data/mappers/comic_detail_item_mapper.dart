import 'package:comic_book_app/src/features/data/models/comicVineAPI/issue_detail_volume.dart';
import 'package:comic_book_app/src/features/domain/entities/entities.dart';

class ComicDetailItemMapper {
  static ComicDetailItemEntity comicDetailEntity(IssueDetailVolume volume) =>
      ComicDetailItemEntity(
          image:
              'https://ih1.redbubble.net/image.4609683629.0454/st,small,845x845-pad,1000x1000,f8f8f8.jpg',
          name: volume.name,
          role: volume.role);
}
