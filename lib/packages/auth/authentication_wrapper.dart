import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:longeviy/config/error_screen.dart';
import 'package:longeviy/config/loading_screen.dart';
import 'package:longeviy/providers/routes/routes.dart';

class Authenticationwrapper extends StatefulWidget {
  const Authenticationwrapper({Key? key}) : super(key: key);

  @override
  _AuthenticationwrapperState createState() => _AuthenticationwrapperState();
}

class _AuthenticationwrapperState extends State<Authenticationwrapper> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const LoadingScreen();
        } else if (snapshot.hasData) {
          return const HomePage();
        } else if (snapshot.hasError) {
          Navigator.popAndPushNamed(context, '/error');
          return const ErrorScreen();
        } else {
          return const SignInPage();
        }
      },
    );
  }
}
