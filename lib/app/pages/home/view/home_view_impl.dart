import 'package:flutter/cupertino.dart';
import 'package:fwc_album_app/app/core/ui/helpers/loader.dart';
import 'package:fwc_album_app/app/core/ui/helpers/messages.dart';
import 'package:fwc_album_app/app/models/user_model.dart';
import 'package:fwc_album_app/app/pages/home/home_page.dart';

import './home_view.dart';

abstract class HomeViewImpl extends State<HomePage>
    with Loader<HomePage>, Messages<HomePage>
    implements HomeView {
  UserModel? user;

  @override
  void initState() {
    widget.presenter.view = this;
    WidgetsBinding.instance.addPostFrameCallback(
      (timeStamp) {
        widget.presenter.getUserData();
      },
    );
    super.initState();
  }

  @override
  void error(String message) {
    hideloader();
    showError(message);
  }

  @override
  void logoutSuccess() {}

  @override
  void updateUser(UserModel user) {
    hideloader();
    setState(() {
      this.user = user;
    });
  }
}
