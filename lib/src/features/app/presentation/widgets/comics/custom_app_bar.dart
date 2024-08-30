import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final titleStyle = Theme.of(context).textTheme.titleMedium;
    return SafeArea(
      bottom: false,
      child: SizedBox(
        width: double.infinity,
        child: Row(
          children: [
            Icon(Icons.movie_outlined, color: colors.primary),
            //TODO: integrate API logo
            const SizedBox(width: 5),
            Text('COMIC BOOK', style: titleStyle),
            const Spacer(),
            IconButton(
                tooltip: 'Favoritos',
                onPressed: () => context.go('/favorites'),
                icon: const Icon(Icons.favorite_outline)),
          ],
        ),
      ),
    );
  }
}
