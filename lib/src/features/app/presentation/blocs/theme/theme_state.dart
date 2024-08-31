part of 'theme_bloc.dart';

class ThemeState extends Equatable {
  final int colorIndex;
  final bool isDarkMode;

  ThemeState({this.colorIndex = 0, this.isDarkMode = false})
      : assert(colorIndex >= 0, 'selectedColor color must be greater than 0'),
        assert(colorIndex < colorList.length,
            'selectedColor must be less or equal than ${colorList.length - 1}');

  ThemeState copyWith({int? colorIndex, bool? isDarkMode}) => ThemeState(
      colorIndex: colorIndex ?? this.colorIndex,
      isDarkMode: isDarkMode ?? this.isDarkMode);

  ThemeData getTheme() => ThemeData(
        useMaterial3: true,
        brightness: isDarkMode ? Brightness.dark : Brightness.light,
        colorSchemeSeed: colorList[colorIndex],
        appBarTheme: const AppBarTheme(centerTitle: false),
      );

  @override
  List<Object?> get props => [colorIndex, isDarkMode];
}
