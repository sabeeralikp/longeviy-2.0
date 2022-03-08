import 'package:flutter/material.dart';

class IntroductionText extends StatelessWidget {
  const IntroductionText({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        children: [
          TextSpan(
              text: 'I am ', style: Theme.of(context).textTheme.titleMedium),
          TextSpan(
              text: 'Longevity', style: Theme.of(context).textTheme.titleLarge),
        ],
      ),
    );
  }
}
