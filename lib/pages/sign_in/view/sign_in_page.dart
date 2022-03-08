import 'package:flutter/material.dart';
import 'package:longeviy/config/loading_screen.dart';
import '../widgets/buttons.dart';
import '../widgets/header_widget.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  bool isLoading = false;
  loadingStateSetter() {
    setState(() {
      isLoading = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: isLoading
          ? const LoadingScreen()
          : Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const HeaderWidget(),
                  ContinueWithGoogleButton(
                      loadinStateSetter: loadingStateSetter),
                ],
              ),
            ),
    );
  }
}
