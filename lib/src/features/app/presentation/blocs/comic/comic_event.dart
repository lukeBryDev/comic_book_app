part of 'comic_bloc.dart';

abstract class ComicEvent {}

class GetComicDetail extends ComicEvent {
  final int id;

  GetComicDetail(this.id);
}

void _getNextPage(GetNextPage event, Emitter<ComicsState> emit) {}