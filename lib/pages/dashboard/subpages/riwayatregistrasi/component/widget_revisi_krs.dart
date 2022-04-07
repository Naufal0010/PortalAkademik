import 'package:flutter/material.dart';

import '../../../../../util/color_pallete.dart';

Widget wRevisiKrs(String isRevisiKrs) {
  if (isRevisiKrs == "1") {
    return Container(
      height: 20,
      padding: EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
          color: ColorPallete.primary,
          borderRadius: BorderRadius.circular(4.0)),
      child: Text(
        'Ya',
        style: TextStyle(color: Colors.white),
      ),
    );
  } else {
    return Container(
      height: 20,
      padding: EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
          color: Colors.red, borderRadius: BorderRadius.circular(4.0)),
      child: Text(
        'Tidak',
        style: TextStyle(color: Colors.white),
      ),
    );
  }
}
