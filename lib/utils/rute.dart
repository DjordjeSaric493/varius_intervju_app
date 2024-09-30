import 'package:flutter/material.dart';
import 'package:varius_intervju_app/view/ekrani/login_ekran.dart';
import 'package:varius_intervju_app/view/ekrani/register_ekeran.dart';
import 'package:varius_intervju_app/view/ekrani/home_ekran.dart';
import 'package:varius_intervju_app/view/widgeti/SplashVarius.dart';

// Define route names
class AppRoutes {
  static const String splash = '/'; //prva ruta je uvek sa /
  static const String register = '/register';
  static const String login = '/login';
  static const String home = '/home';
}

// Navigation setup
class AppRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    //onaj switch case klasika
    switch (settings.name) {
      case AppRoutes.splash:
        return MaterialPageRoute(builder: (_) => SplashScreenVarius());
      case AppRoutes.register:
        return MaterialPageRoute(builder: (_) => Registr());
      case AppRoutes.login:
        return MaterialPageRoute(builder: (_) => LoginEkran());
      case AppRoutes.home:
        return MaterialPageRoute(builder: (_) => HomeEkran());
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text('nedefinisana putanja ${settings.name}'),
            ),
          ),
        );
    }
  }
}
