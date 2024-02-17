import 'package:cinemapedia/presentation/providers/providers.dart';
import 'package:cinemapedia/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class FavoritesView extends ConsumerStatefulWidget {
  const FavoritesView({super.key});

  @override
  FavoritesViewState createState() => FavoritesViewState();
}

class FavoritesViewState extends ConsumerState<FavoritesView> with AutomaticKeepAliveClientMixin {

  bool isLastPage = false;
  bool isLoading = false;

  @override
  void initState() {
    super.initState();

    loadNextPage();
  }

  void loadNextPage() async {
    if(isLoading || isLastPage) return;

    isLoading = true;
    final movies = await ref.read(favoriteMoviesProvider.notifier).loadNextPage();
    isLoading = false;

    if(movies.isEmpty) {
      isLastPage = true;
    }

  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    final favoritesMovies = ref.watch(favoriteMoviesProvider).values.toList();

    if(favoritesMovies.isEmpty) {
      final colors = Theme.of(context).colorScheme;
      final textTheme = Theme.of(context).textTheme;
      return Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.favorite_border_sharp, size: 60, color: colors.primary),
            Text('Ohh no!', style: textTheme.titleLarge?.copyWith(color: colors.primary)),
            Text("You don't have favorites movies", style: textTheme.bodyLarge),

            const SizedBox(height: 20),
            FilledButton.tonal(
              onPressed: () => context.go('/home/0'), 
              child: const Text('Start now')
            )
          ],
        ),
      );
    }
    
    return Scaffold(
      body: MovieMasonry(
        movies: favoritesMovies,
        loadNextPage: loadNextPage,
      )
    );
  }
  
  @override
  bool get wantKeepAlive => true;

}
