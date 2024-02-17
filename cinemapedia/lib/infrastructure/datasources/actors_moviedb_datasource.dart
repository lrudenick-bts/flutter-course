import 'package:cinemapedia/config/constants/environment.dart';
import 'package:cinemapedia/domain/datasources/actors_datasource.dart';
import 'package:cinemapedia/domain/entities/actor.dart';
import 'package:cinemapedia/infrastructure/mappers/actor_mapper.dart';
import 'package:cinemapedia/infrastructure/models/models.dart';
import 'package:dio/dio.dart';

class ActorsMovieDBDatasource extends ActorsDatasource {

  final dio = Dio(BaseOptions(
    baseUrl: 'https://api.themoviedb.org/3',
    queryParameters: {
      'api_key': Environment.tmdbKey,
      'language': 'en-US'
    }
  ));

  @override
  Future<List<Actor>> getActorsByMovie(String movieId) async {
    final response = await dio.get('/movie/$movieId/credits');

    if (response.statusCode != 200) {
      throw Exception('Cast for movie with id: $movieId not found');
    }
    
    final creditsResponse = CreditsResponse.fromJson(response.data);
    
    final List<Actor> actors = creditsResponse.cast
        .map((cast) => ActorMapper.castToEntity(cast))
        .toList();
    
    return actors;
  }

}