import 'package:cinemapedia/domain/entities/movie.dart';
import 'package:cinemapedia/infrastructure/models/models.dart';

class MovieMapper {

  static Movie movieDBToEntity(MovieMovieDB movieMovieDB) {

    const imgNotFound = 'https://www.reelviews.net/resources/img/default_poster.jpg';

    return Movie(
      adult: movieMovieDB.adult, 
      backdropPath: movieMovieDB.backdropPath != '' 
      ? 'https://image.tmdb.org/t/p/w500${movieMovieDB.backdropPath}' 
      : imgNotFound, 
      genreIds: movieMovieDB.genreIds.map((e) => e.toString()).toList(), 
      id: movieMovieDB.id, 
      originalLanguage: movieMovieDB.originalLanguage, 
      originalTitle: movieMovieDB.originalTitle, 
      overview: movieMovieDB.overview, 
      popularity: movieMovieDB.popularity, 
      posterPath: movieMovieDB.posterPath != '' 
      ? 'https://image.tmdb.org/t/p/w500${movieMovieDB.posterPath}' 
      : imgNotFound, 
      releaseDate: movieMovieDB.releaseDate, 
      title: movieMovieDB.title, 
      video: movieMovieDB.video, 
      voteAverage: movieMovieDB.voteAverage, 
      voteCount: movieMovieDB.voteCount

    );
  }

  static Movie movieDetailsToEntity(MovieDetails movieDetails) {

    const imgNotFound = 'https://www.reelviews.net/resources/img/default_poster.jpg';

    return Movie(
      adult: movieDetails.adult, 
      backdropPath: movieDetails.backdropPath != '' 
      ? 'https://image.tmdb.org/t/p/w500${movieDetails.backdropPath}' 
      : imgNotFound, 
      genreIds: movieDetails.genres.map((e) => e.name).toList(), 
      id: movieDetails.id, 
      originalLanguage: movieDetails.originalLanguage, 
      originalTitle: movieDetails.originalTitle, 
      overview: movieDetails.overview, 
      popularity: movieDetails.popularity, 
      posterPath: movieDetails.posterPath != '' 
      ? 'https://image.tmdb.org/t/p/w500${movieDetails.posterPath}' 
      : imgNotFound, 
      releaseDate: movieDetails.releaseDate, 
      title: movieDetails.title, 
      video: movieDetails.video, 
      voteAverage: movieDetails.voteAverage, 
      voteCount: movieDetails.voteCount
    );
  }
}