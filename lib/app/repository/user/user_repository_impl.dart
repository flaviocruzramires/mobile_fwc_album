import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:fwc_album_app/app/core/exceptions/repository_exceptions.dart';
import 'package:fwc_album_app/app/core/rest/custom_dio.dart';
import 'package:fwc_album_app/app/models/user_model.dart';
import 'package:fwc_album_app/app/repository/auth/auth_repository_impl.dart';

import './user_repository.dart';

class UserRepositoryImpl implements UserRepository {
  final CustomDio customDio;
  UserRepositoryImpl({
    required this.customDio,
  });

  @override
  Future<UserModel> getMe() async {
    final result = await customDio.auth().get('/api/me');
    try {
      return UserModel.fromMap(result.data);
    } on DioError catch (e, s) {
      log('Erro ao buscar dados do Usuario', error: e, stackTrace: s);
      throw RepositoryExceptions(message: 'Erro ao buscar dados do Usuario');
    }
  }
}
