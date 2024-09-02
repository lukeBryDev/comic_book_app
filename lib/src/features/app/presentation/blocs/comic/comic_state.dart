part of 'comic_bloc.dart';

final class ComicState {
  final ComicDetailEntity? comic;
  final bool loading;

  ComicState({this.comic, this.loading = false});

  ComicState copyWith({ComicDetailEntity? comic, bool? loading}) =>
      ComicState(comic: comic ?? this.comic, loading: loading ?? this.loading);
}
