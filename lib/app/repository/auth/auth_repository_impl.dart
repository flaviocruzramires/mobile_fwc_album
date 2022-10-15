import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:fwc_album_app/app/core/exceptions/repository_exceptions.dart';
import 'package:fwc_album_app/app/core/exceptions/unauthorized_exceptions.dart';
import 'package:fwc_album_app/app/core/rest/custom_dio.dart';
import 'package:fwc_album_app/app/models/register_user_model.dart';

import './auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final CustomDio dio;

  const AuthRepositoryImpl({required this.dio});

  @override
  Future<String> login({
    required String email,
    required String password,
  }) async {
    try {
      final result = await dio.post(
        '/api/auth',
        data: {
          'email': email,
          'password': password,
        },
      );
      final accessToken = result.data['access_token'];
      if (accessToken == null) {
        throw UnauthorizedExceptions();
      }
      return accessToken;
    } on DioError catch (e, s) {
      log('Erro ao fazer login', error: e, stackTrace: s);
      print(e);
      print(s);
      if (e.response?.statusCode == 401) {
        throw UnauthorizedExceptions();
      }
      throw RepositoryExceptions(message: 'Erro ao fazer login');
    }
  }

  @override
  Future<void> logout() {
    throw UnimplementedError();
  }

  @override
  Future<void> register(RegisterUserModel registerModel) async {
    try {
      await dio.unAuth().post('/api/register', data: registerModel.toMap());
    } on DioError catch (e, s) {
      log('Erro ao registrar usuário ', error: e, stackTrace: s);
      throw RepositoryExceptions(message: 'Erro ao registrar usuário');
    }
  }
}
