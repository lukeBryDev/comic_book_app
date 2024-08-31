part of 'theme_bloc.dart';

abstract class ThemeEvent {
  const ThemeEvent();
}

class ToggleDarkMode extends ThemeEvent {
  const ToggleDarkMode();
}

class SetSelectedColor extends ThemeEvent {
  final int colorIndex;

  SetSelectedColor(this.colorIndex);
}
