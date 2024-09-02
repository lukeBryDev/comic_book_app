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
            IconButton(
                onPressed: () => context.push('/favorites'),
                icon: const Icon(Icons.favorite_outline))
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

final List<ComicEntity> _comicsMock = <ComicEntity>[
  ComicEntity(
    id: 6,
    image:
        "https:\/\/comicvine.gamespot.com\/a\/uploads\/original\/5\/58993\/2645776-chamber_of_chills__13_cgc_8.5.jpg",
    firstStoresSoldDate: DateTime.tryParse("2008-06-06 11:10:16"),
    name: "The Lost Race",
    number: "13",
  ),
  ComicEntity(
    id: 7,
    image:
        "https:\/\/comicvine.gamespot.com\/a\/uploads\/original\/0\/4\/8-1488-7-1-fighting-fronts-.jpg",
    firstStoresSoldDate: DateTime.tryParse("1952-10-01"),
    name: null,
    number: "3",
  ),
  ComicEntity(
    id: 8,
    image:
        "https:\/\/comicvine.gamespot.com\/a\/uploads\/original\/0\/4\/9-1489-8-1-tomb-of-terror.jpg",
    firstStoresSoldDate: DateTime.tryParse("2008-06-06 11:10:16"),
    name: null,
    number: "5",
  ),
  ComicEntity(
    id: 9,
    image:
        "https:\/\/comicvine.gamespot.com\/a\/uploads\/original\/0\/4\/10-1418-9-1-witches-tales.jpg",
    firstStoresSoldDate: DateTime.tryParse("1952-10-01"),
    name: null,
    number: "15",
  ),
  ComicEntity(
    id: 6,
    image:
        "https:\/\/comicvine.gamespot.com\/a\/uploads\/original\/5\/58993\/2645776-chamber_of_chills__13_cgc_8.5.jpg",
    firstStoresSoldDate: DateTime.tryParse("2008-06-06 11:10:16"),
    name: "The Lost Race",
    number: "13",
  ),
  ComicEntity(
    id: 7,
    image:
        "https:\/\/comicvine.gamespot.com\/a\/uploads\/original\/0\/4\/8-1488-7-1-fighting-fronts-.jpg",
    firstStoresSoldDate: DateTime.tryParse("1952-10-01"),
    name: null,
    number: "3",
  ),
  ComicEntity(
    id: 8,
    image:
        "https:\/\/comicvine.gamespot.com\/a\/uploads\/original\/0\/4\/9-1489-8-1-tomb-of-terror.jpg",
    firstStoresSoldDate: DateTime.tryParse("2008-06-06 11:10:16"),
    name: null,
    number: "5",
  ),
  ComicEntity(
    id: 9,
    image:
        "https:\/\/comicvine.gamespot.com\/a\/uploads\/original\/0\/4\/10-1418-9-1-witches-tales.jpg",
    firstStoresSoldDate: DateTime.tryParse("1952-10-01"),
    name: null,
    number: "15",
  ),
  ComicEntity(
    id: 6,
    image:
        "https:\/\/comicvine.gamespot.com\/a\/uploads\/original\/5\/58993\/2645776-chamber_of_chills__13_cgc_8.5.jpg",
    firstStoresSoldDate: DateTime.tryParse("2008-06-06 11:10:16"),
    name: "The Lost Race",
    number: "13",
  ),
  ComicEntity(
    id: 7,
    image:
        "https:\/\/comicvine.gamespot.com\/a\/uploads\/original\/0\/4\/8-1488-7-1-fighting-fronts-.jpg",
    firstStoresSoldDate: DateTime.tryParse("1952-10-01"),
    name: null,
    number: "3",
  ),
  ComicEntity(
    id: 8,
    image:
        "https:\/\/comicvine.gamespot.com\/a\/uploads\/original\/0\/4\/9-1489-8-1-tomb-of-terror.jpg",
    firstStoresSoldDate: DateTime.tryParse("2008-06-06 11:10:16"),
    name: null,
    number: "5",
  ),
  ComicEntity(
    id: 9,
    image:
        "https:\/\/comicvine.gamespot.com\/a\/uploads\/original\/0\/4\/10-1418-9-1-witches-tales.jpg",
    firstStoresSoldDate: DateTime.tryParse("1952-10-01"),
    name: null,
    number: "15",
  ),
  ComicEntity(
    id: 6,
    image:
        "https:\/\/comicvine.gamespot.com\/a\/uploads\/original\/5\/58993\/2645776-chamber_of_chills__13_cgc_8.5.jpg",
    firstStoresSoldDate: DateTime.tryParse("2008-06-06 11:10:16"),
    name: "The Lost Race",
    number: "13",
  ),
  ComicEntity(
    id: 7,
    image:
        "https:\/\/comicvine.gamespot.com\/a\/uploads\/original\/0\/4\/8-1488-7-1-fighting-fronts-.jpg",
    firstStoresSoldDate: DateTime.tryParse("1952-10-01"),
    name: null,
    number: "3",
  ),
  ComicEntity(
    id: 8,
    image:
        "https:\/\/comicvine.gamespot.com\/a\/uploads\/original\/0\/4\/9-1489-8-1-tomb-of-terror.jpg",
    firstStoresSoldDate: DateTime.tryParse("2008-06-06 11:10:16"),
    name: null,
    number: "5",
  ),
  ComicEntity(
    id: 9,
    image:
        "https:\/\/comicvine.gamespot.com\/a\/uploads\/original\/0\/4\/10-1418-9-1-witches-tales.jpg",
    firstStoresSoldDate: DateTime.tryParse("1952-10-01"),
    name: null,
    number: "15",
  ),
];
