part of 'comics_bloc.dart';

abstract class ComicsEvent {
  final BuildContext context;

  ComicsEvent(this.context);
}

class GetNextPage extends ComicsEvent {
  GetNextPage(super.context);
}
