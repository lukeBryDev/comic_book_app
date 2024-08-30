import 'package:animate_do/animate_do.dart';
import 'package:comic_book_app/src/features/domain/entities/entities.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ComicPosterLink extends StatelessWidget {
  final ComicEntity comic;

  const ComicPosterLink({super.key, required this.comic});

  @override
  Widget build(BuildContext context) {
    return FadeInUp(
      child: GestureDetector(
        onTap: () => context.push('/comic/${comic.id}'),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Image.network(
            comic.image,
          ),
        ),
      ),
    );
  }
}
