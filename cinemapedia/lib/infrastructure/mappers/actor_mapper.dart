import 'package:cinemapedia/domain/entities/actor.dart';
import 'package:cinemapedia/infrastructure/models/models.dart';

class ActorMapper {

  static Actor castToEntity(Cast cast) {

    const imgNotFound = 'https://st3.depositphotos.com/4111759/13425/v/450/depositphotos_134255710-stock-illustration-avatar-vector-male-profile-gray.jpg';

    return Actor(
      id: cast.castId, 
      name: cast.name, 
      profilePath: cast.profilePath != null 
      ? 'https://image.tmdb.org/t/p/w500${cast.profilePath}'
      : imgNotFound, 
      character: cast.character
    );
  }
}
