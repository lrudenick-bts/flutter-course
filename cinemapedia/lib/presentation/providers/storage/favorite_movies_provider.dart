import 'package:cinemapedia/domain/entities/movie.dart';
import 'package:cinemapedia/domain/repositories/local_storage_repository.dart';
import 'package:cinemapedia/presentation/providers/providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final favoriteMoviesProvider =
    StateNotifierProvider<StorageMoviesNotifier, Map<int, Movie>>((ref) {
  final repository = ref.watch(localStorageRepositoryProvider);
  return StorageMoviesNotifier(
      repository: repository);
});

class StorageMoviesNotifier extends StateNotifier<Map<int, Movie>> {

  int page = 0;
  final LocalStorageRepository repository;
  
  StorageMoviesNotifier({required this.repository}) : super({});

  Future<List<Movie>> loadNextPage() async {

    final movies = await repository.loadMovies(offset: page * 10, limit: 20);
    page++;

    final moviesMap = <int, Movie>{};

    for (final movie in movies) {
      moviesMap[movie.id] = movie;
    }

    state = {...state, ...moviesMap};
    return movies;
  }

  Future<void> toggleFavorite(Movie movie) async {
    await repository.toggleFavorite(movie);
    final isMovieInFavorites = state[movie.id] != null;
    
    if(isMovieInFavorites) {
      state.remove(movie.id);
      state = {...state};
    } else {
      state = {...state, movie.id: movie};
    }
  }

}