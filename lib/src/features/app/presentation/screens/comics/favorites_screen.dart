import 'package:comic_book_app/src/features/app/presentation/widgets/widgets.dart';
import 'package:comic_book_app/src/features/domain/entities/entities.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class FavoritesScreen extends StatelessWidget {
  static const name = '/favorites';

  const FavoritesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: _FavoritesView());
  }
}

class _FavoritesView extends StatefulWidget {
  const _FavoritesView({super.key});

  @override
  _FavoritesViewState createState() => _FavoritesViewState();
}

class _FavoritesViewState extends State<_FavoritesView> {
  bool isLoading = false;
  bool isLastPage = false;

  void loadNextPage() async {
    if (isLoading || isLastPage) return;
    isLoading = true;
    final movies = []; //TODO: get from controller
    // await ref.read(favoriteMoviesProvider.notifier).loadNextPage();
    isLoading = false;
    if (movies.isEmpty) {
      isLastPage = true;
    }
  }

  @override
  void initState() {
    loadNextPage();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final List<ComicEntity> favoriteMovies =
        <ComicEntity>[]; //TODO: get from controller
    // ref.watch(favoriteMoviesProvider).values.toList();

    if (favoriteMovies.isEmpty) {
      return const _NoContentView();
    }

    return SizedBox(
      child: ComicMasonry(
        comics: favoriteMovies,
        loadNextPage: loadNextPage,
      ),
    );
  }
}

class _NoContentView extends StatelessWidget {
  const _NoContentView();

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(Icons.favorite_outline_sharp, size: 60, color: colors.primary),
          Text(
            'Ohhh no!!',
            style: TextStyle(fontSize: 30, color: colors.primary),
          ),
          const Text(
            'No tienes películas favoritas',
            style: TextStyle(fontSize: 20, color: Colors.black45),
          ),
          const SizedBox(height: 20),
          FilledButton.tonal(
              onPressed: () => context.go('/'),
              child: const Text('Empieza a buscar')),
        ],
      ),
    );
  }
}
