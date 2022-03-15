import 'package:flutter/material.dart';
import 'package:portal_akademik/util/color_pallete.dart';

class LinearGradientMask extends StatelessWidget {
  LinearGradientMask({required this.child});
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      shaderCallback: (bounds) {
        return RadialGradient(
          center: Alignment.topLeft,
          radius: 1,
          colors: [ColorPallete.primary, ColorPallete.secondPrimary],
          tileMode: TileMode.mirror,
        ).createShader(bounds);
      },
      child: child,
    );
  }
}