import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/material.dart';
import 'package:longeviy/config/themes/colors.dart';
import 'package:longeviy/config/themes/icon_theme.dart';

class GlowingLogoAvatar extends StatelessWidget {
  const GlowingLogoAvatar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AvatarGlow(
      endRadius: 80,
      duration: const Duration(seconds: 2),
      glowColor: primaryColor,
      showTwoGlows: false,
      child: CircleAvatar(
        backgroundColor: primaryColor.withOpacity(0.925),
        radius: 60,
        backgroundImage: logoAsset,
      ),
    );
  }
}
