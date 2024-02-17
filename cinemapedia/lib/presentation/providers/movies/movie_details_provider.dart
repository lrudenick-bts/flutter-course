import 'package:cinemapedia/domain/entities/movie.dart';
import 'package:cinemapedia/presentation/providers/movies/movies_repository_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


final movieDetailsProvider =
    StateNotifierProvider<MovieMapNotifier, Map<String, Movie>>(
  (ref) {

    final getMovieById = ref.watch(moviesRepositoryProvider).getMovieById;

    return MovieMapNotifier(getMovieDetails: getMovieById);
  },
);

typedef GetMovieDetailsCallback = Future<Movie> Function(String movieId);

class MovieMapNotifier extends StateNotifier<Map<String, Movie>> {

  final GetMovieDetailsCallback getMovieDetails;

  MovieMapNotifier({
    required this.getMovieDetails
  }) : super({});

  Future<void> loadMovie(String movieId) async {

    if(state[movieId] != null) return;

    final movie = await getMovieDetails(movieId);
    state = {...state, movieId: movie};
  }

}