import 'package:comic_book_app/src/features/app/presentation/widgets/widgets.dart';
import 'package:comic_book_app/src/features/domain/entities/entities.dart';
import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  HomeViewState createState() => HomeViewState();
}

class HomeViewState extends State<HomeView> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final initialLoading = false; //TODO integrate
    if (initialLoading) return FullScreenLoader();

    final List<ComicEntity> comics =
        <ComicEntity>[]; //TODO: get from controller
    // ref.watch(favoriteMoviesProvider).values.toList();

    return SizedBox(
      child: ComicMasonry(
        comics: _comicsMock, //TODO: replace with comics real list
        loadNextPage: () {}, //TODO integrate
      ),
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
