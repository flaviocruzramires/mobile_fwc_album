import 'package:flutter/Material.dart';
import 'package:flutter_getit/flutter_getit.dart';
import 'package:fwc_album_app/app/pages/splash/presenter/splash_presenter.dart';
import 'package:fwc_album_app/app/pages/splash/presenter/splash_presenter_impl.dart';
import 'package:fwc_album_app/app/pages/splash/splash_page.dart';

class SplashRoute extends FlutterGetItPageRoute {
  @override
  List<Bind<Object>> get bindings => [
        Bind.lazySingleton<SplashPresenter>((i) => SplashPresenterImpl()),
      ];

  @override
  WidgetBuilder get page => (context) => SplashPage(presenter: context.get());
}
