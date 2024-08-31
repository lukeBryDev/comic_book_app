import 'package:comic_book_app/src/config/theme/app_theme_colors.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'theme_event.dart';

part 'theme_state.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  ThemeBloc() : super(ThemeState()) {
    // constructor body

    /// Handler o manejador de un CounterEvent
    on<ToggleDarkMode>(_toggleDarkMode);
    on<SetSelectedColor>(_setSelectedColor);

    on<ThemeEvent>((event, emit) {});
  }

  void _toggleDarkMode(ToggleDarkMode event, Emitter<ThemeState> emit) {
    emit(state.copyWith(isDarkMode: !state.isDarkMode));
  }

  void toggleDarkMode() {
    add(const ToggleDarkMode());
  }

  void _setSelectedColor(SetSelectedColor event, Emitter<ThemeState> emit) {
    emit(state.copyWith(colorIndex: event.colorIndex));
  }

  void setSelectedColor(int value) {
    add(SetSelectedColor(value));
  }
}
