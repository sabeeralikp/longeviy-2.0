import 'package:flutter/material.dart';
import 'package:longeviy/config/themes/margin_padding_gap.dart';
import 'package:longeviy/packages/ui_packages/delayed_animation.dart';
import 'glowing_circular_avatar.dart';

import 'texts.dart';

class HeaderWidget extends StatelessWidget {
  const HeaderWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const DelayedAnimation(
          delay: 500,
          child: GlowingLogoAvatar(),
        ),
        gapYLarge,
        const DelayedAnimation(delay: 1000, child: Text('Hey,')),
        gapYMedium,
        const DelayedAnimation(
          delay: 1500,
          child: IntroductionText(),
        ),
        gapYSmall,
        DelayedAnimation(
          delay: 2000,
          child: Text('Your health care companion',
              style: Theme.of(context).textTheme.labelSmall),
        ),
      ],
    );
  }
}
