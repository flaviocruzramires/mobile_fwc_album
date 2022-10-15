import 'dart:developer';
import 'dart:math';

import 'package:fwc_album_app/app/core/exceptions/unauthorized_exceptions.dart';
import 'package:fwc_album_app/app/pages/auth/login/view/login_view.dart';
import 'package:fwc_album_app/app/services/login/login_service.dart';

import './login_presenter.dart';

class LoginPresenterImpl implements LoginPresenter {
  final LoginService loginService;

  late final LoginView _view;
  LoginPresenterImpl({
    required this.loginService,
  });

  @override
  Future<void> login(String email, String password) async {
    try {
      await loginService.execute(
        email: email,
        password: password,
      );

      _view.sucess();
    } on UnauthorizedExceptions {
      _view.error('Usuário ou senha inválido');
    } catch (e, s) {
      // log('Erro ao executar o login', error: e, stackTrace: s);
      _view.error('Erro ao efetuar o login');
    }
  }

  @override
  set view(LoginView view) => _view = view;
}
