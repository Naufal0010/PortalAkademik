import 'package:flutter/material.dart';
import 'package:portal_akademik/util/color_pallete.dart';
import 'package:portal_akademik/util/linear_gradient_mask.dart';

class ButtonGrid extends StatelessWidget {
  final String buttonName;
  final IconData icon;
  final Function() onTap;

  const ButtonGrid({required this.buttonName, required this.icon, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(4.0),
      child: Material(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.0),
        elevation: 2,
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
                        style: TextStyle(
                          color: ColorPallete.primary,
                          fontSize: 12.0
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
