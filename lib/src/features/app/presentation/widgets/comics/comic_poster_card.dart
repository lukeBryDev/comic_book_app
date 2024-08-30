import 'package:animate_do/animate_do.dart';
import 'package:comic_book_app/src/config/helpers/human_formats.dart';
import 'package:comic_book_app/src/config/settings/app_assets.dart';
import 'package:comic_book_app/src/features/domain/entities/entities.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ComicPosterCard extends StatelessWidget {
  final ComicEntity comic;

  const ComicPosterCard({super.key, required this.comic});

  @override
  Widget build(BuildContext context) {
    return FadeInUp(
      child: GestureDetector(
        onTap: () => context.push('/comic/${comic.id}'),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: FadeInImage(
                height: 180,
                fit: BoxFit.cover,
                placeholder: const AssetImage(AppAssets.bottleLoaderGif),
                image: NetworkImage(comic.image),
              ),
            ),
            const SizedBox(height: 5),
            Text(
              comic.name ?? '',
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            Text(
              HumanFormats.date(
                  date: comic.firstStoresSoldDate, format: 'MMMM dd, yyyy'),
              style: const TextStyle(fontWeight: FontWeight.w300),
            ),
          ],
        ),
      ),
    );
  }
}
