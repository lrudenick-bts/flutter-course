
import 'package:cinemapedia/domain/entities/movie.dart';
import 'package:cinemapedia/presentation/providers/movies/movies_repository_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final searchQueryProvider = StateProvider((ref) => '');

final searchedMoviesProvider = StateNotifierProvider<SearchedMoviesNotifier, List<Movie>>(
  (ref) {

    final searchMovies = ref.watch(moviesRepositoryProvider).searchMovies;
    return SearchedMoviesNotifier(searchMovies: searchMovies, ref: ref);
  }
);

typedef SearchMoviesCallback = Future<List<Movie>> Function(String query);

class SearchedMoviesNotifier extends StateNotifier<List<Movie>>{

  final SearchMoviesCallback searchMovies;
  final Ref ref;

  SearchedMoviesNotifier({required this.searchMovies, required this.ref})
      : super([]);

  Future<List<Movie>> searchMoviesByQuery(String query) async {
    ref.read(searchQueryProvider.notifier).update((state) => query);
    final movies = await searchMovies(query);
    state = movies;
    return movies;
  }

}