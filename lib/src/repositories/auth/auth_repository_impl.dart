import 'dart:developer';

import 'package:dio/dio.dart';

import '../../core/exceptions/repository_exception.dart';
import '../../core/exceptions/unauthorized_exception.dart';
import '../../core/rest_client/custom_dio.dart';
import '../../models/auth_model.dart';
import 'auth_repository.dart';

class AuthRespositoryImpl implements AuthRepository {
  final CustomDio _customDio;

  AuthRespositoryImpl(this._customDio);

  @override
  Future<AuthModel> login(String email, String password) async {
    try {
      final result = await _customDio.unauth().post(
        '/auth',
        data: {
          'email': email,
          'password': password,
          'admin': true,
        },
      );

      return AuthModel.fromMap(result.data);
    } on DioError catch (e, s) {
      if (e.response?.statusCode == 403) {
        log('Login ou senha inválidos', error: e, stackTrace: s);
        throw UnauthorizedException();
      }
      log('Erro ao realizar o login', error: e, stackTrace: s);
      throw RepositoryException(message: 'Erro ao realizar o login');
    }
  }
}
