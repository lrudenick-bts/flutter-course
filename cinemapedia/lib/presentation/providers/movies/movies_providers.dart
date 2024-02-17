import 'package:cinemapedia/domain/entities/movie.dart';
import 'package:cinemapedia/presentation/providers/movies/movies_repository_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final nowPlayingMoviesProvider =
    StateNotifierProvider<MoviesNotifier, List<Movie>>(
  (ref) {

    final fetchMoreMovies = ref.watch(moviesRepositoryProvider).getNowPlaying;

    return MoviesNotifier(fetchMoreMovies: fetchMoreMovies);
  },
);

final popularMoviesProvider =
    StateNotifierProvider<MoviesNotifier, List<Movie>>(
  (ref) {

    final fetchMoreMovies = ref.watch(moviesRepositoryProvider).getPopular;

    return MoviesNotifier(fetchMoreMovies: fetchMoreMovies);
  },
);

final upcommingMoviesProvider =
    StateNotifierProvider<MoviesNotifier, List<Movie>>(
  (ref) {

    final fetchMoreMovies = ref.watch(moviesRepositoryProvider).getUpcomming;

    return MoviesNotifier(fetchMoreMovies: fetchMoreMovies);
  },
);

final topRatedMoviesProvider =
    StateNotifierProvider<MoviesNotifier, List<Movie>>(
  (ref) {

    final fetchMoreMovies = ref.watch(moviesRepositoryProvider).getTopRated;

    return MoviesNotifier(fetchMoreMovies: fetchMoreMovies);
  },
);


typedef MovieCallback = Future<List<Movie>> Function({int page});

class MoviesNotifier extends StateNotifier<List<Movie>> {

  int currentPage = 0;
  MovieCallback fetchMoreMovies;

  MoviesNotifier({required this.fetchMoreMovies}) : super([]);

  bool isLoading = false;

  Future<void> loadNextPage() async {
    if(isLoading) return;

    isLoading = true;
    currentPage++;

    final List<Movie> movies = await fetchMoreMovies(page: currentPage);
    state = [...state, ...movies];

    await Future.delayed(const Duration(milliseconds: 300));
    isLoading = false;
  }
}