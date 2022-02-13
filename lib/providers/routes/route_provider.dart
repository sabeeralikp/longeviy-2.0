import 'package:flutter/material.dart';
import 'package:longeviy/packages/auth/authentication_wrapper.dart';

import 'package:longeviy/pages/home/home.dart';
import 'package:longeviy/pages/sign_in/sign_in.dart';

class RouteProvider {
  static const String authWrapperRoute = '/';
  static const String homeRoute = '/home';
  static const String signInRoute = '/sign_in';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    // final args = settings.arguments;

    switch (settings.name) {
      case authWrapperRoute:
        return MaterialPageRoute(builder: (_) => const Authenticationwrapper());
      case homeRoute:
        return MaterialPageRoute(builder: (_) => const HomePage());
      case signInRoute:
        return MaterialPageRoute(builder: (_) => const SignInPage());

      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Error'),
          backgroundColor: Colors.red,
        ),
        body: const Center(
          child: Text('ERROR'),
        ),
      );
    });
  }
}
