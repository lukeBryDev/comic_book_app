import 'package:comic_book_app/src/config/theme/app_theme_colors.dart';
import 'package:comic_book_app/src/features/app/presentation/blocs/theme/theme_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ThemeChangerScreen extends StatelessWidget {
  static const name = 'theme_changer_screen';

  const ThemeChangerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Color> colors = colorList;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Theme Changer'),
        actions: [
          context.select((ThemeBloc themeBloc) {
            return IconButton(
              icon: Icon(themeBloc.state.isDarkMode
                  ? Icons.dark_mode_outlined
                  : Icons.light_mode_outlined),
              onPressed: () => context.read<ThemeBloc>().toggleDarkMode(),
            );
          }),
        ],
      ),
      body: context.select((ThemeBloc themeBloc) {
        return ListView.builder(
            itemCount: colors.length,
            itemBuilder: (context, index) {
              final color = colors[index];
              return RadioListTile(
                title: Text(
                  'Este color',
                  style: TextStyle(color: color),
                ),
                subtitle: Text('${color.value}'),
                activeColor: color,
                value: index,
                groupValue: themeBloc.state.colorIndex,
                onChanged: (value) =>
                    context.read<ThemeBloc>().setSelectedColor(value!),
              );
            });
      }),
    );
  }
}
