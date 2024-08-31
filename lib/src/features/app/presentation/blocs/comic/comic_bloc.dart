import 'package:comic_book_app/src/features/app/presentation/blocs/comics/comics_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'comic_event.dart';

part 'comic_state.dart';

class ComicBloc extends Bloc<ComicEvent, ComicState> {
  ComicBloc() : super(ComicState()) {
    on<ComicEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
