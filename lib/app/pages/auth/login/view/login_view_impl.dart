import 'dart:developer';

import 'package:flutter/widgets.dart';
import 'package:fwc_album_app/app/core/ui/helpers/loader.dart';
import 'package:fwc_album_app/app/core/ui/helpers/messages.dart';
import 'package:fwc_album_app/app/pages/auth/login/login_page.dart';

import './login_view.dart';

abstract class LoginViewImpl extends State<LoginPage>
    with Messages<LoginPage>, Loader<LoginPage>
    implements LoginView {
  @override
  void initState() {
    widget.presenter.view = this;
    super.initState();
  }

  @override
  void error(String message) {
    hideloader();
    showError(message);
  }

  @override
  void sucess() {
    hideloader();
    Navigator.of(context).pushNamedAndRemoveUntil('/home', (route) => false);
  }
}
