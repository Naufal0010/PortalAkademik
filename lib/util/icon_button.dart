import 'package:flutter/material.dart';
import 'package:portal_akademik/util/color_pallete.dart';

class IconButtonCustom extends StatelessWidget {
  final String nameLabel;
  final IconData iconLabel;

  IconButtonCustom(this.nameLabel, this.iconLabel);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 5),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Material(
            borderRadius: const BorderRadius.all(
              Radius.circular(15),
            ),
            color: Colors.transparent,
            child: InkWell(
              borderRadius: const BorderRadius.all(
                Radius.circular(15),
              ),
              onTap: () {},
              child: Container(
                // margin: EdgeInsets.all(5),
                height: 60,
                width: 60,
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: ColorPallete.primary),
                  borderRadius: const BorderRadius.all(
                    Radius.circular(15),
                  ),
                ),
                child: Center(
                  child: Stack(
                    children: [
                      LinearGradientMask(
                        child: Icon(
                          iconLabel,
                          color: Colors.white,
                          size: 40,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 5, bottom: 5),
            child: Text(
              nameLabel,
              style: const TextStyle(fontSize: 12),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          )
        ],
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