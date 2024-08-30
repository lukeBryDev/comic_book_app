import 'package:comic_book_app/src/features/app/presentation/screens/comics/favorites_screen.dart';
import 'package:comic_book_app/src/features/app/presentation/screens/screens.dart';
import 'package:comic_book_app/src/features/app/presentation/screens/theme/theme_changer_screen.dart';
import 'package:go_router/go_router.dart';

final appRouter = GoRouter(routes: [
  GoRoute(
    path: '/',
    name: HomeScreen.name,
    builder: (context, state) => const HomeScreen(),
  ),
  GoRoute(
    path: '/splash',
    name: SplashScreen.name,
    builder: (context, state) => const SplashScreen(),
  ),
  GoRoute(
    path: '/comic/:id',
    name: ComicScreen.name,
    builder: (context, state) {
      final int id = int.tryParse('${state.pathParameters['id']}') ?? 0;
      return ComicScreen(comicId: id);
    },
  ),
  GoRoute(
    path: '/favorites',
    name: FavoritesScreen.name,
    builder: (context, state) => const FavoritesScreen(),
  ),
  GoRoute(
    path: '/theme-changer',
    name: ThemeChangerScreen.name,
    builder: (context, state) => const ThemeChangerScreen(),
  ),
], initialLocation: '/splash');
