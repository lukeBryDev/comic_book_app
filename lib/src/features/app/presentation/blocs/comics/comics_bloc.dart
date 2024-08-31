import 'package:comic_book_app/src/features/app/presentation/widgets/widgets.dart';
import 'package:comic_book_app/src/features/data/DTOs/dtos.dart';
import 'package:comic_book_app/src/features/domain/entities/entities.dart';
import 'package:comic_book_app/src/features/domain/useCases/get_comics_use_case.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'comics_event.dart';

part 'comics_state.dart';

class ComicsBloc extends Bloc<ComicsEvent, ComicsState> {
  final GetComicsUseCase _getComicsUseCase;

  ComicsBloc({required GetComicsUseCase getComicsUseCase})
      : _getComicsUseCase = getComicsUseCase,
        super(ComicsState()) {
    on<ComicsEvent>((event, emit) {});
    on<GetNextPage>(_getNextPage);
  }

  Future<void> _getNextPage(
      GetNextPage event, Emitter<ComicsState> emit) async {
    if (state.page == 0) {
      emit(state.copyWith(firstLoading: true));
    } else {
      emit(state.copyWith(loadingNextPage: true));
    }
    final params = GetComicsDTO(limit: 50, offset: state.page * 50);
    final res = await _getComicsUseCase.call(params);
    if (state.page == 0) {
      emit(state.copyWith(firstLoading: false));
    } else {
      emit(state.copyWith(loadingNextPage: false));
    }
    res.fold(Show.eitherError, (r) {
      emit(state.copyWith(comics: r.comics, page: state.page + 1));
    });
  }

  void getNextPage() {
    add(GetNextPage());
  }
}
