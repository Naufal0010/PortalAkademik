import 'package:flutter/material.dart';
import 'package:portal_akademik/util/color_pallete.dart';

class ButtonGrid extends StatelessWidget {
  final String buttonName;
  final IconData icon;

  const ButtonGrid({required this.buttonName, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(4.0),
      child: Material(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.0),
        elevation: 4,
        child: InkWell(
          onTap: () {},
          child: Ink(
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(color: ColorPallete.primary),
                borderRadius: BorderRadius.circular(10.0),
              ),
              width: 100,
              height: 100,
              padding: EdgeInsets.all(10.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    child: LinearGradientMask(
                      child: Icon(
                        icon,
                        size: 48,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Container(
                    child: Text(buttonName,
                        textAlign: TextAlign.center,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                        style: TextStyle(
                          color: ColorPallete.primary
                        )),
                    height: 30,
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

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
