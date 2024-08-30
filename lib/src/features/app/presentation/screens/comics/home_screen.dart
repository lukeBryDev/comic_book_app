import 'package:comic_book_app/src/features/app/presentation/views/views.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends StatelessWidget {
  static const name = 'home-screen';

  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('THE COMIC BOOK'),
        actions: [
          /// Theme
          IconButton(
              onPressed: () => context.push('/theme-changer'),
              icon: const Icon(Icons.color_lens_outlined)),

          /// Favorites
          IconButton(
              onPressed: () => context.push('/favorites'),
              icon: const Icon(Icons.favorite_outline))
        ],
      ),
      body: const HomeView(),
    );
  }
}
