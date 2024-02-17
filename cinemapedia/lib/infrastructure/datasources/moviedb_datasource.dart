import 'package:cinemapedia/config/constants/environment.dart';
import 'package:cinemapedia/domain/datasources/movies_datasource.dart';
import 'package:cinemapedia/domain/entities/entities.dart';
import 'package:cinemapedia/infrastructure/mappers/mappers.dart';
import 'package:cinemapedia/infrastructure/models/models.dart';
import 'package:dio/dio.dart';

class MoviedbDataSource extends MoviesDatasource {

  final dio = Dio(BaseOptions(
    baseUrl: 'https://api.themoviedb.org/3',
    queryParameters: {
      'api_key': Environment.tmdbKey,
      'language': 'en-US'
    }
  ));

  @override
  Future<List<Movie>> getNowPlaying({int page = 1}) {
    return getMovies('/movie/now_playing', page);
  }
  
  @override
  Future<List<Movie>> getPopular({int page = 1}) {
    return getMovies('/movie/popular', page);
  }

  @override
  Future<List<Movie>> getTopRated({int page = 1}) {
    return getMovies('/movie/top_rated', page);
  }
  
  @override
  Future<List<Movie>> getUpcoming({int page = 1}) {
    return getMovies('/movie/upcoming', page);
  }

  @override
  Future<List<Movie>> searchMovies(String query) async {
    if(query.isEmpty) return [];
    return getMoviesWithParameters('/search/movie', {'query': query});
  }

  Future<List<Movie>> getMoviesWithParameters(
    String path, 
    Map<String, dynamic> queryParameters
  ) async {
    final response = await dio.get(
      path, 
      queryParameters: queryParameters
    );
    
    final movieDbResponse = MovieDbResponse.fromJson(response.data);
    
    final List<Movie> movies = movieDbResponse.results
    .where((movieMovieDB) => movieMovieDB.posterPath != '')
    .map(
      (movieMovieDB) => MovieMapper.movieDBToEntity(movieMovieDB)
    ).toList();
    
    return movies;
  }

  Future<List<Movie>> getMovies(String path, int page) async {
    return getMoviesWithParameters(path, {'page': page});
  }
  
  @override
  Future<Movie> getMovieById(String id) async {
    final response = await dio.get('/movie/$id');

    if (response.statusCode != 200) {
      throw Exception('Movie with id: $id not found');
    }
    
    final movieDetails = MovieDetails.fromJson(response.data);
  
    
    return MovieMapper.movieDetailsToEntity(movieDetails);
  }

  @override
  Future<List<Movie>> getSimilarMovies(int movieId) {
    return getMovies('/movie/$movieId/similar', 1);
  }

  @override
  Future<List<Video>> getYoutubeVideosById(int movieId) async {
    final response = await dio.get('/movie/$movieId/videos');
    final moviedbVideosReponse = MoviedbVideosResponse.fromJson(response.data);
    final videos = <Video>[];

    for (final moviedbVideo in moviedbVideosReponse.results) {
      if ( moviedbVideo.site == 'YouTube' ) {
        final video = VideoMapper.moviedbVideoToEntity(moviedbVideo);
        videos.add(video);
      }
    }

    return videos;
  }

}