import 'package:comic_book_app/src/features/domain/entities/entities.dart';
import 'package:equatable/equatable.dart';

class ComicDetailEntity extends Equatable {
  final String? title;
  final String? number;
  final String image;
  final String? description;
  final List<ComicDetailItemEntity> creators;
  final List<ComicDetailItemEntity> characters;
  final List<ComicDetailItemEntity> teams;
  final List<ComicDetailItemEntity> locations;
  final List<ComicDetailItemEntity> concepts;

  const ComicDetailEntity(
      {required this.title,
      required this.number,
      required this.image,
      required this.description,
      required this.creators,
      required this.characters,
      required this.teams,
      required this.locations,
      required this.concepts});

  @override
  List<Object?> get props => [
        title,
        number,
        image,
        description,
        creators,
        characters,
        teams,
        locations,
        concepts
      ];
}
