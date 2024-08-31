part of 'comics_bloc.dart';

final class ComicsState {
  final List<ComicEntity> comics;
  final int page;
  final bool firstLoading;
  final bool loadingNextPage;

  ComicsState(
      {this.comics = const <ComicEntity>[],
      this.loadingNextPage = false,
      this.firstLoading = false,
      this.page = 0});

  ComicsState copyWith(
          {List<ComicEntity>? comics,
          int? page,
          bool? loadingNextPage,
          bool? firstLoading}) =>
      ComicsState(
          comics: comics ?? this.comics,
          page: page ?? this.page,
          loadingNextPage: loadingNextPage ?? this.loadingNextPage,
          firstLoading: firstLoading ?? this.firstLoading);
}
