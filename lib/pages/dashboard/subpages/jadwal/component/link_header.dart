import 'package:flutter/material.dart';
import 'package:portal_akademik/util/color_pallete.dart';

class LinkHeader extends StatelessWidget {
  final String nameLink;
  final bool link;

  LinkHeader(this.nameLink, this.link);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      margin: EdgeInsets.only(right: 10),
      // decoration: BoxDecoration(
      //   color: link ? Colors.blue.shade500 : Colors.grey.shade300,
      //   borderRadius: BorderRadius.circular(50),
      // ),
      child: Column(
        children: [
          Text(
            nameLink,
            style: TextStyle(
              color: link ? ColorPallete.primary : Colors.grey.shade300,
              fontWeight: FontWeight.bold,
            ),
          ),
          if (link)
            Icon(
              Icons.radio_button_on,
              size: 12,
              color: link ? ColorPallete.primary : Colors.grey.shade300,
            ),
        ],
      ),
    );
  }
}