import 'package:flutter/material.dart';
import 'package:flutter_getit/flutter_getit.dart';
import 'package:fwc_album_app/app/core/rest/custom_dio.dart';
import 'package:fwc_album_app/app/core/theme/theme_config.dart';
import 'package:fwc_album_app/app/pages/auth/login/login_page.dart';
import 'package:fwc_album_app/app/pages/auth/register/register_page.dart';
import 'package:fwc_album_app/app/pages/home/home_page.dart';
import 'package:fwc_album_app/app/pages/splash/view/splash_route.dart';
import 'package:fwc_album_app/app/repository/auth/auth_repository_impl.dart';

class FwcAlbumApp extends StatelessWidget {
  const FwcAlbumApp({super.key});

  @override
  Widget build(BuildContext context) {
    return FlutterGetItApplicationBinding(
      bindingsBuilder: () => [
        Bind.lazySingleton((i) => CustomDio()),
        Bind.lazySingleton((i) => AuthRepositoryImpl(dio: i())),
      ],
      child: MaterialApp(
        title: 'Fifa World Cup Qatar',
        debugShowCheckedModeBanner: false,
        theme: ThemeConfig.theme,
        routes: {
          '/': (_) => SplashRoute(),
          '/auth/login': (_) => const LoginPage(),
          '/auth/register': (_) => const RegisterPage(),
          '/home': (_) => const HomePage(),
        },
      ),
    );
  }
}
