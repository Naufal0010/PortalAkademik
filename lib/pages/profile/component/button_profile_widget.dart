import 'package:flutter/material.dart';
import 'package:portal_akademik/util/color_pallete.dart';

class ButtonProfile extends StatelessWidget {
  final String buttonName;
  final IconData icon;
  final Function() onPressed;

  ButtonProfile(this.buttonName, this.icon, this.onPressed);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: OutlinedButton(
        style: ElevatedButton.styleFrom(
            side: BorderSide(color: ColorPallete.primary),
            padding: EdgeInsets.all(20),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15)),
            primary: Color(0xFFF5F6F9),
            onPrimary: ColorPallete.primary),
        onPressed: onPressed,
        child: Row(
          children: [
            Icon(icon, color: ColorPallete.primary),
            SizedBox(
              width: 20,
            ),
            Expanded(
              child: Text(
                buttonName,
                style: TextStyle(color: ColorPallete.primary, fontSize: 16),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
