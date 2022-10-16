import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_getit/flutter_getit.dart';
import 'package:fwc_album_app/app/core/rest/custom_dio.dart';
import 'package:fwc_album_app/app/core/theme/theme_config.dart';
import 'package:fwc_album_app/app/core/ui/global/global_context.dart';
import 'package:fwc_album_app/app/core/ui/global/global_context_impl.dart';
import 'package:fwc_album_app/app/pages/auth/login/login_page.dart';
import 'package:fwc_album_app/app/pages/auth/login/login_route.dart';
import 'package:fwc_album_app/app/pages/auth/register/register_page.dart';
import 'package:fwc_album_app/app/pages/auth/register/view/register_route.dart';
import 'package:fwc_album_app/app/pages/home/home_page.dart';
import 'package:fwc_album_app/app/pages/splash/view/splash_route.dart';
import 'package:fwc_album_app/app/repository/auth/auth_repository.dart';
import 'package:fwc_album_app/app/repository/auth/auth_repository_impl.dart';

class FwcAlbumApp extends StatelessWidget {
  final navigatorKey = GlobalKey<NavigatorState>();

  FwcAlbumApp({super.key});

  @override
  Widget build(BuildContext context) {
    return FlutterGetItApplicationBinding(
      bindingsBuilder: () => [
        Bind.lazySingleton<CustomDio>(
          (i) => CustomDio(),
        ),
        Bind.lazySingleton<AuthRepository>(
          (i) => AuthRepositoryImpl(dio: i()),
        ),
        Bind.lazySingleton<GlobalContext>(
          (i) => GlobalContextImpl(
            navigatorKey: navigatorKey,
            authRepository: i(),
          ),
        )
      ],
      child: MaterialApp(
        title: 'Fifa World Cup Qatar',
        navigatorKey: navigatorKey,
        debugShowCheckedModeBanner: false,
        theme: ThemeConfig.theme,
        routes: {
          '/': (_) => SplashRoute(),
          '/auth/login': (_) => const LoginRoute(),
          '/auth/register': (_) => const RegisterRoute(),
          '/home': (_) => const HomePage(),
        },
      ),
    );
  }
}
