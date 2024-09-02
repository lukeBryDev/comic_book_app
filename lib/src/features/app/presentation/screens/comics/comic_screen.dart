import 'package:animate_do/animate_do.dart';
import 'package:comic_book_app/injection_container.dart';
import 'package:comic_book_app/src/features/app/presentation/blocs/comic/comic_bloc.dart';
import 'package:comic_book_app/src/features/domain/entities/entities.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ComicScreen extends StatelessWidget {
  static const name = 'comic-screen';

  final int comicId;

  const ComicScreen({super.key, required this.comicId});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ComicBloc>(
      create: (context) => ComicBloc(getComicDetailUseCase: sl()),
      child: _ComicView(comicId),
    );
  }
}

class _ComicView extends StatefulWidget {
  final int comicId;

  const _ComicView(this.comicId);

  @override
  State<_ComicView> createState() => _ComicViewState();
}

class _ComicViewState extends State<_ComicView> {
  @override
  void initState() {
    final comicBloc = BlocProvider.of<ComicBloc>(context);
    comicBloc.add(GetComicDetail(context: context, id: widget.comicId));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ComicBloc, ComicState>(
      builder: (context, state) {
        final colors = Theme.of(context).colorScheme;
        final ComicDetailEntity? comic = state.comic;

        if (state.loading == true) {
          return Scaffold(
            body: Center(
              child: CircularProgressIndicator(
                  color: colors.primary, strokeWidth: 2),
            ),
          );
        }
        if (comic == null) {
          return Scaffold(
            appBar: AppBar(),
            body: const Center(
              child: Text('Error loading comic data'),
            ),
          );
        }
        return Scaffold(
          body: RefreshIndicator(
            color: colors.primary,
            onRefresh: () async => BlocProvider.of<ComicBloc>(context)
                .add(GetComicDetail(context: context, id: widget.comicId)),
            child: CustomScrollView(
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
          ),
        );
      },
    );
  }
}

/// TODO: implement favorites form local db
/*final isFavoriteMovieProvider =
    FutureProvider.family.autoDispose((ref, int movieId) {
  final localStorageRepository = ref.watch(localStorageRepositoryProvider);

  return localStorageRepository.isMovieFavorite(movieId);
});*/

class _ComicDetails extends StatelessWidget {
  final ComicDetailEntity comic;

  const _ComicDetails({required this.comic});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 10),
          Text(comic.description ?? 'Sin descripción'),
          const SizedBox(height: 20),
          _CreditsListView(
            title: 'Creators',
            items: comic.creators,
          ),
          const SizedBox(height: 10),
          _CreditsListView(
            title: 'Characters',
            items: comic.characters,
          ),
          const SizedBox(height: 10),
          _CreditsListView(
            title: 'Teams',
            items: comic.teams,
          ),
          const SizedBox(height: 10),
          _CreditsListView(
            title: 'Locations',
            items: comic.locations,
          ),
          const SizedBox(height: 10),
          _CreditsListView(
            title: 'Concepts',
            items: comic.concepts,
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}

class _CreditsListView extends StatelessWidget {
  final String title;
  final List<ComicDetailItemEntity> items;

  const _CreditsListView({required this.title, required this.items});

  @override
  Widget build(BuildContext context) {
    final textStyles = Theme.of(context).textTheme;
    if (items.isEmpty) {
      return const CircularProgressIndicator(strokeWidth: 2);
    }
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: textStyles.titleLarge),
        const Divider(),
        SizedBox(
          height: 120,
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: items.length,
              itemBuilder: (context, index) {
                final item = items[index];
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
                            item.image,
                            height: 50,
                            width: 50,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      // Actor name
                      const SizedBox(height: 5),
                      Text(item.name, maxLines: 2),
                      Text(
                        item.role ?? '',
                        style: const TextStyle(color: Colors.grey),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                );
              }),
        ),
      ],
    );
  }
}

class _CustomSliverAppBar extends StatelessWidget {
  final ComicDetailEntity comic;

  const _CustomSliverAppBar({required this.comic});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return SliverAppBar(
      backgroundColor: Colors.black,
      expandedHeight: size.height * 0.7,
      foregroundColor: Colors.white,
      actions: const [
        /// TODO: implement favorites form local db
        /*IconButton(
          onPressed: () async {
            //TODO: integrate
            // await ref.read(favoriteMoviesProvider.notifier).toggleFavorite(comic);
            // ref.invalidate(isFavoriteMovieProvider(comic.id));
          },
          icon: const Icon(Icons.favorite_border),
          */ /*isFavoriteFuture.when(
            data: (isFavorite) => isFavorite ? const Icon(Icons.favorite_rounded, color: Colors.red) : const Icon(Icons.favorite_border),
            error: (_, __) => throw UnimplementedError(),
            loading: () => const CircularProgressIndicator(strokeWidth: 2),
          ),*/ /*
        ),*/
      ],
      flexibleSpace: FlexibleSpaceBar(
        titlePadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
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
