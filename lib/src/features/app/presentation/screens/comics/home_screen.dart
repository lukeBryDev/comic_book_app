import 'package:comic_book_app/injection_container.dart';
import 'package:comic_book_app/src/features/app/presentation/blocs/comics/comics_bloc.dart';
import 'package:comic_book_app/src/features/app/presentation/widgets/widgets.dart';
import 'package:comic_book_app/src/features/domain/entities/entities.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends StatelessWidget {
  static const name = 'home-screen';

  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ComicsBloc>(
      create: (context) => ComicsBloc(getComicsUseCase: sl()),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('THE COMIC BOOK'),
          actions: [
            /// Theme
            IconButton(
                onPressed: () => context.push('/theme-changer'),
                icon: const Icon(Icons.color_lens_outlined)),

            /// Favorites
            /// TODO: implement favorites form local db
            /*IconButton(
                onPressed: () => context.push('/favorites'),
                icon: const Icon(Icons.favorite_outline))*/
          ],
        ),
        body: const _HomeView(),
      ),
    );
  }
}

class _HomeView extends StatefulWidget {
  const _HomeView();

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<_HomeView> {
  @override
  void initState() {
    final comicsBloc = BlocProvider.of<ComicsBloc>(context);
    comicsBloc.add(GetNextPage(context));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ComicsBloc, ComicsState>(
      builder: (context, state) {
        final initialLoading = state.firstLoading;
        if (initialLoading) return FullScreenLoader();
        final List<ComicEntity> comics = state.comics;
        return SizedBox(
          child: ComicMasonry(
            comics: comics,
            loadNextPage: () =>
                BlocProvider.of<ComicsBloc>(context).add(GetNextPage(context)),
          ),
        );
      },
    );
  }
}
