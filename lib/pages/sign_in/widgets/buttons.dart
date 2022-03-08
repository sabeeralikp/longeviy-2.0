import 'package:flutter/material.dart';
import 'package:longeviy/packages/ui_packages/delayed_animation.dart';
import 'package:longeviy/providers/google_sign_in_provider.dart';
import 'package:provider/provider.dart';

class ContinueWithGoogleButton extends StatefulWidget {
  final Function loadinStateSetter;
  const ContinueWithGoogleButton({Key? key, required this.loadinStateSetter})
      : super(key: key);

  @override
  State<ContinueWithGoogleButton> createState() =>
      _ContinueWithGoogleButtonState();
}

class _ContinueWithGoogleButtonState extends State<ContinueWithGoogleButton> {
  @override
  Widget build(BuildContext context) {
    return DelayedAnimation(
      delay: 3000,
      child: ElevatedButton(
        child: const Text('Continue with Google'),
        onPressed: () {
          final provider =
              Provider.of<GoogleSignInProvider>(context, listen: false);
          widget.loadinStateSetter();
          provider.googleLogin();
        },
      ),
    );
  }
}
