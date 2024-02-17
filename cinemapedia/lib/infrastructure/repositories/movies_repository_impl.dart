import 'package:cinemapedia/domain/datasources/movies_datasource.dart';
import 'package:cinemapedia/domain/entities/movie.dart';
import 'package:cinemapedia/domain/entities/video.dart';
import 'package:cinemapedia/domain/repositories/movies_repository.dart';

class MoviesRepositoryImpl extends MoviesRepository {

  final MoviesDatasource moviesDataSource;

  MoviesRepositoryImpl(this.moviesDataSource);

  @override
  Future<List<Movie>> getNowPlaying({int page = 1}) {
    
    return moviesDataSource.getNowPlaying(page: page);
  }
  
  @override
  Future<List<Movie>> getPopular({int page = 1}) {
    return moviesDataSource.getPopular(page: page);
  }
  
  @override
  Future<List<Movie>> getTopRated({int page = 1}) {
    return moviesDataSource.getTopRated(page: page);
  }
  
  @override
  Future<List<Movie>> getUpcomming({int page = 1}) {
    return moviesDataSource.getUpcoming(page: page);
  }
  
  @override
  Future<Movie> getMovieById(String id) {
    return moviesDataSource.getMovieById(id);
  }
  
  @override
  Future<List<Movie>> searchMovies(String query) {
    return moviesDataSource.searchMovies(query);
  }

  @override
  Future<List<Movie>> getSimilarMovies(int movieId) {
    return moviesDataSource.getSimilarMovies(movieId);
  }

  @override
  Future<List<Video>> getYoutubeVideosById(int movieId) {
    return moviesDataSource.getYoutubeVideosById(movieId);
  }

}