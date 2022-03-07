import 'package:flutter/material.dart';
import 'package:longeviy/config/loading_screen.dart';
import 'package:longeviy/packages/ui_packages/delayed_animation.dart';
import 'package:longeviy/providers/google_sign_in_provider.dart';
import 'package:provider/provider.dart';
import '../widges/header_widget.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  bool isLoading = false;
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
                  DelayedAnimation(
                    delay: 3000,
                    child: ElevatedButton(
                      child: const Text('Continue with Google'),
                      onPressed: () {
                        final provider = Provider.of<GoogleSignInProvider>(
                            context,
                            listen: false);
                        setState(() {
                          isLoading = true;
                        });
                        provider.googleLogin();
                      },
                    ),
                  ),
                ],
              ),
            ),
    );
  }
}
