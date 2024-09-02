import 'package:comic_book_app/src/features/app/presentation/widgets/widgets.dart';
import 'package:comic_book_app/src/features/data/DTOs/dtos.dart';
import 'package:comic_book_app/src/features/domain/entities/entities.dart';
import 'package:comic_book_app/src/features/domain/useCases/use_cases.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'comic_event.dart';

part 'comic_state.dart';

class ComicBloc extends Bloc<ComicEvent, ComicState> {
  final GetComicDetailUseCase _getComicDetailUseCase;

  ComicBloc({required GetComicDetailUseCase getComicDetailUseCase})
      : _getComicDetailUseCase = getComicDetailUseCase,
        super(ComicState()) {
    on<ComicEvent>((event, emit) {});
    on<GetComicDetail>(_getDetail);
  }

  Future<void> _getDetail(
      GetComicDetail event, Emitter<ComicState> emit) async {
    emit(state.copyWith(loading: true));
    final params = GetComicDetailDTO(id: event.id);
    final res = await _getComicDetailUseCase.call(params);
    emit(state.copyWith(loading: false));
    res.fold((l) => Show.eitherError(l, event.context), (r) {
      emit(state.copyWith(comic: r));
    });
  }

  Future<void> getDetail(
      {required BuildContext context, required int id}) async {
    add(GetComicDetail(context: context, id: id));
  }
}
