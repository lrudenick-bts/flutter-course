import 'package:cinemapedia/domain/entities/actor.dart';
import 'package:cinemapedia/presentation/providers/providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


final actorsByMovieProvider =
    StateNotifierProvider<ActorsByMovieNotifier, Map<String, List<Actor>>>(
  (ref) {

    final getActorsByMovie = ref.watch(actorsRepositoryProvider).getActorsByMovie;

    return ActorsByMovieNotifier(getActorsByMovie: getActorsByMovie);
  },
);

typedef GetActorsCallback = Future<List<Actor>> Function(String movieId);

class ActorsByMovieNotifier extends StateNotifier<Map<String, List<Actor>>> {

  final GetActorsCallback getActorsByMovie;

  ActorsByMovieNotifier({
    required this.getActorsByMovie
  }) : super({});

  Future<void> loadActorsByMovie(String movieId) async {

    if(state[movieId] != null) return;

    final actors = await getActorsByMovie(movieId);
    state = {...state, movieId: actors};
  }

}