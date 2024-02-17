class WronCredentials implements Exception {}
class InvalidToken implements Exception {}
class ConnectionTimeout implements Exception{}
class UnknownError implements Exception{}

class CustomError implements Exception {
  final String message;

  CustomError([this.message = 'Unknown error']);
}