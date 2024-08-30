import 'package:animate_do/animate_do.dart';
import 'package:comic_book_app/src/features/domain/entities/entities.dart';
import 'package:flutter/material.dart';

class ComicScreen extends StatefulWidget {
  static const name = 'comic-screen';

  final int comicId;

  const ComicScreen({super.key, required this.comicId});

  @override
  State<ComicScreen> createState() => _MovieScreenState();
}

class _MovieScreenState extends State<ComicScreen> {
  @override
  void initState() {
    super.initState();
    // ref.read(movieInfoProvider.notifier).loadMovie(widget.movieId);
    // ref.read(actorsByMovieProvider.notifier).loadActors(widget.movieId);
  }

  @override
  Widget build(BuildContext context) {
    final ComicDetailEntity? comic =
        comicMock; //TODO: change to comic real value
    // final Movie? movie = ref.watch(movieInfoProvider)[widget.movieId];

    if (comic == null) {
      return const Scaffold(
        body: Center(
          child: CircularProgressIndicator(strokeWidth: 2),
        ),
      );
    }
    return Scaffold(
      body: CustomScrollView(
        physics: const ClampingScrollPhysics(),
        slivers: [
          _CustomSliverAppBar(comic: comic),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) => _ComicDetails(comic: comic),
              childCount: 1,
            ),
          )
        ],
      ),
    );
  }
}

final ComicDetailEntity? comicMock = const ComicDetailEntity(
  image:
      "https:\/\/comicvine.gamespot.com\/a\/uploads\/original\/11182\/111829875\/9399221-img_5439.jpeg",
  title: "The Lost Race",
  number: "13",
  description:
      "<p><i>New ongoing series starring fan-favorite teen heroes! Moon Girl &amp; Devil Dinosaur – Red Goblin – Bloodline, Daughter of Blade – Captain America of the Railways – Kid Juggernaut – Escapade of the X-Men! You saw the team come together in Marvel’s Voices’ “Unlike Any Other” – now school’s in session. And already under attack!!!<\/i><\/p>",
  creators: [
    ComicDetailItemEntity(
        image:
            'https://ih1.redbubble.net/image.4609683629.0454/st,small,845x845-pad,1000x1000,f8f8f8.jpg',
        name: 'Brayan',
        role: 'ceator'),
  ],
  characters: [
    ComicDetailItemEntity(
        image:
            'https://ih1.redbubble.net/image.4609683629.0454/st,small,845x845-pad,1000x1000,f8f8f8.jpg',
        name: 'Brayan',
        role: 'ceator'),
    ComicDetailItemEntity(
        image:
            'https://ih1.redbubble.net/image.4609683629.0454/st,small,845x845-pad,1000x1000,f8f8f8.jpg',
        name: 'Brayan',
        role: 'ceator'),
    ComicDetailItemEntity(
        image:
            'https://ih1.redbubble.net/image.4609683629.0454/st,small,845x845-pad,1000x1000,f8f8f8.jpg',
        name: 'Brayan',
        role: 'ceator'),
  ],
  teams: [
    ComicDetailItemEntity(
        image:
            'https://ih1.redbubble.net/image.4609683629.0454/st,small,845x845-pad,1000x1000,f8f8f8.jpg',
        name: 'Brayan',
        role: 'ceator'),
    ComicDetailItemEntity(
        image:
            'https://ih1.redbubble.net/image.4609683629.0454/st,small,845x845-pad,1000x1000,f8f8f8.jpg',
        name: 'Brayan',
        role: 'ceator'),
    ComicDetailItemEntity(
        image:
            'https://ih1.redbubble.net/image.4609683629.0454/st,small,845x845-pad,1000x1000,f8f8f8.jpg',
        name: 'Brayan',
        role: 'ceator'),
    ComicDetailItemEntity(
        image:
            'https://ih1.redbubble.net/image.4609683629.0454/st,small,845x845-pad,1000x1000,f8f8f8.jpg',
        name: 'Brayan',
        role: 'ceator'),
  ],
  concepts: [
    ComicDetailItemEntity(
        image:
            'https://ih1.redbubble.net/image.4609683629.0454/st,small,845x845-pad,1000x1000,f8f8f8.jpg',
        name: 'Brayan',
        role: 'ceator'),
    ComicDetailItemEntity(
        image:
            'https://ih1.redbubble.net/image.4609683629.0454/st,small,845x845-pad,1000x1000,f8f8f8.jpg',
        name: 'Brayan',
        role: 'ceator'),
    ComicDetailItemEntity(
        image:
            'https://ih1.redbubble.net/image.4609683629.0454/st,small,845x845-pad,1000x1000,f8f8f8.jpg',
        name: 'Brayan',
        role: 'ceator'),
    ComicDetailItemEntity(
        image:
            'https://ih1.redbubble.net/image.4609683629.0454/st,small,845x845-pad,1000x1000,f8f8f8.jpg',
        name: 'Brayan',
        role: 'ceator'),
    ComicDetailItemEntity(
        image:
            'https://ih1.redbubble.net/image.4609683629.0454/st,small,845x845-pad,1000x1000,f8f8f8.jpg',
        name: 'Brayan',
        role: 'ceator'),
    ComicDetailItemEntity(
        image:
            'https://ih1.redbubble.net/image.4609683629.0454/st,small,845x845-pad,1000x1000,f8f8f8.jpg',
        name: 'Brayan',
        role: 'ceator'),
  ],
);

/*final isFavoriteMovieProvider =
    FutureProvider.family.autoDispose((ref, int movieId) {
  final localStorageRepository = ref.watch(localStorageRepositoryProvider);

  return localStorageRepository.isMovieFavorite(movieId);
});*/

class _CustomSliverAppBar extends StatelessWidget {
  final ComicDetailEntity comic;

  const _CustomSliverAppBar({required this.comic});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    final dynamic isFavoriteFuture;
    // = ref.watch(isFavoriteMovieProvider(comic.id));

    return SliverAppBar(
      backgroundColor: Colors.black,
      expandedHeight: size.height * 0.7,
      foregroundColor: Colors.white,
      actions: [
        IconButton(
          onPressed: () async {
            //TODO: integrate
            // await ref.read(favoriteMoviesProvider.notifier).toggleFavorite(comic);
            // ref.invalidate(isFavoriteMovieProvider(comic.id));
          },
          icon: const Icon(Icons.favorite_border),
          /*isFavoriteFuture.when(
            data: (isFavorite) => isFavorite ? const Icon(Icons.favorite_rounded, color: Colors.red) : const Icon(Icons.favorite_border),
            error: (_, __) => throw UnimplementedError(),
            loading: () => const CircularProgressIndicator(strokeWidth: 2),
          ),*/
        ),
      ],
      flexibleSpace: FlexibleSpaceBar(
        titlePadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        /*title: Text(
          movie.title,
          style: const TextStyle(fontSize: 20),
          textAlign: TextAlign.start,
        ),*/
        background: Stack(
          children: [
            SizedBox.expand(
              child: Image.network(
                comic.image,
                fit: BoxFit.cover,
                loadingBuilder: (context, child, loadingProgress) {
                  if (loadingProgress != null) return const SizedBox();
                  return FadeIn(child: child);
                },
              ),
            ),
            const _CustomGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              stops: [0.7, 1.0],
              colors: [Colors.transparent, Colors.black87],
            ),
            const _CustomGradient(
              begin: Alignment.topLeft,
              stops: [0.0, 0.3],
              colors: [Colors.black87, Colors.transparent],
            ),
            const _CustomGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              stops: [0.0, 0.2],
              colors: [Colors.black54, Colors.transparent],
            ),
          ],
        ),
      ),
    );
  }
}

class _CustomGradient extends StatelessWidget {
  final AlignmentGeometry begin;
  final AlignmentGeometry end;
  final List<double>? stops;
  final List<Color> colors;

  const _CustomGradient(
      {this.begin = Alignment.centerLeft,
      this.end = Alignment.centerRight,
      this.stops,
      required this.colors});

  @override
  Widget build(BuildContext context) {
    return SizedBox.expand(
      child: DecoratedBox(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: begin,
            end: end,
            stops: stops,
            colors: colors,
          ),
        ),
      ),
    );
  }
}

class _ComicDetails extends StatelessWidget {
  final ComicDetailEntity comic;

  const _ComicDetails({required this.comic});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final textStyles = Theme.of(context).textTheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        /*Padding(
          padding: const EdgeInsets.all(8),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //  image
              ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.network(
                  comic.image,
                  width: size.width * 0.3,
                ),
              ),
              const SizedBox(width: 10),
              // description
              SizedBox(
                width: (size.width - 40) * 0.7,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(comic.title, style: textStyles.titleLarge),
                    Text(comic.overview),
                  ],
                ),
              ),
            ],
          ),
        ),
        // genders
        Padding(
          padding: const EdgeInsets.all(8),
          child: Wrap(
            children: comic.genreIds
                .map((genre) => Container(
                      margin: const EdgeInsets.only(right: 10),
                      child: Chip(
                        label: Text(genre),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)),
                      ),
                    ))
                .toList(),
          ),
        ),
        // _ActorsByMovie(movieId: comic.id.toString()),
        const SizedBox(height: 50),*/
      ],
    );
  }
}

/*class _ActorsByMovie extends StatelessWidget {
  final String movieId;

  const _ActorsByMovie({required this.movieId});

  @override
  Widget build(BuildContext context) {
    // final actorsByMovie = ref.watch(actorsByMovieProvider);
    // final actors = actorsByMovie[movieId];

    if (actors == null) {
      return const CircularProgressIndicator(strokeWidth: 2);
    }
    return SizedBox(
      height: 300,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: actors.length,
          itemBuilder: (context, index) {
            final actor = actors[index];
            return Container(
              padding: const EdgeInsets.all(8),
              width: 135,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Actor photo
                  FadeInRight(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Image.network(
                        actor.profilePath,
                        height: 180,
                        width: 135,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  // Actor name
                  const SizedBox(height: 5),
                  Text(actor.name, maxLines: 2),
                  Text(
                    actor.character ?? '',
                    maxLines: 2,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            );
          }),
    );
  }
}*/
