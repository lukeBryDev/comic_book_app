import 'package:comic_book_app/src/features/domain/entities/entities.dart';
import 'package:equatable/equatable.dart';

class ComicsEntity extends Equatable {
  final int offset;
  final List<ComicEntity> comics;

  const ComicsEntity({required this.offset, required this.comics});

  @override
  List<Object?> get props => [offset, comics];
}
