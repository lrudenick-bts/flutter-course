import 'package:dio/dio.dart';
import 'package:teslo_shop/config/config.dart';
import 'package:teslo_shop/features/auth/domain/domain.dart';
import 'package:teslo_shop/features/auth/infrastructure/infrastructure.dart';

class AuthDatasourceImpl extends AuthDatasource {

  final dio = Dio(
    BaseOptions(baseUrl: Environment.apiUrl)
  );

  @override
  Future<User> checkAuthStatus(String token) async {
    try {
      final response = await dio.get(
        '/auth/check-status',
        options: Options(
          headers: {
            'Authorization': 'Bearer $token'
          }
        )
      );
      return UserMapper.userJsonToEntity(response.data);
    } on DioException catch(e) {
      if(e.response?.statusCode == 401){ 
        throw CustomError(e.response?.data['message'] ?? 'Invalid token');
      }
      if(e.type == DioExceptionType.connectionTimeout) {
        throw CustomError(e.response?.statusMessage?? 'Check your internet connection');
      }
      throw CustomError(e.response?.statusMessage?? 'Unknown error');
    } catch(e) {
      throw CustomError();
    }
  }

  @override
  Future<User> login(String email, String password) async {
    try {
      final response = await dio.post(
        '/auth/login',
        data: {
          'email': email,
          'password': password
        }
      );

      return UserMapper.userJsonToEntity(response.data);
    } on DioException catch(e) {
      if(e.response?.statusCode == 401){ 
        throw CustomError(e.response?.data['message'] ?? 'Invalid credentials');
      }
      if(e.type == DioExceptionType.connectionTimeout) {
        throw CustomError(e.response?.statusMessage?? 'Check your internet connection');
      }
      throw CustomError(e.response?.statusMessage?? 'Unknown error');
    } catch(e) {
      throw CustomError();
    }
  }

  @override
  Future<User> register(String email, String password, String fullname) {
    // TODO: implement register
    throw UnimplementedError();
  }

}