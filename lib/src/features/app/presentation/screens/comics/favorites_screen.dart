import 'package:comic_book_app/src/features/app/presentation/views/views.dart';
import 'package:flutter/material.dart';

class FavoritesScreen extends StatelessWidget {
  static const name = '/favorites';

  const FavoritesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: FavoritesView());
  }
}
