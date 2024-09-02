part of 'comic_bloc.dart';

abstract class ComicEvent {}

class GetComicDetail extends ComicEvent {
  final BuildContext context;
  final int id;

  GetComicDetail({required this.context, required this.id});
}
