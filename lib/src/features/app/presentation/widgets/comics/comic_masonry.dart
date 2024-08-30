import 'package:comic_book_app/src/features/app/presentation/widgets/widgets.dart';
import 'package:comic_book_app/src/features/domain/entities/entities.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class ComicMasonry extends StatefulWidget {
  final List<ComicEntity> comics;
  final VoidCallback? loadNextPage;

  const ComicMasonry({super.key, required this.comics, this.loadNextPage});

  @override
  State<ComicMasonry> createState() => _ComicMasonryState();
}

class _ComicMasonryState extends State<ComicMasonry> {
  final scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    scrollController.addListener(() {
      if (widget.loadNextPage == null) return;
      if ((scrollController.position.pixels + 200) >=
          (scrollController.position.maxScrollExtent)) {
        widget.loadNextPage!();
      }
    });
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: MasonryGridView.count(
        controller: scrollController,
        crossAxisCount: 3,
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
        itemCount: widget.comics.length,
        itemBuilder: (context, index) {
          if (index == 1) {
            return Column(
              children: [
                const SizedBox(height: 40),
                ComicPosterLink(comic: widget.comics[index]),
              ],
            );
          }
          return ComicPosterLink(comic: widget.comics[index]);
        },
      ),
    );
  }
}
