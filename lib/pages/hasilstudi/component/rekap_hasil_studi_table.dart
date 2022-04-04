import 'package:flutter/material.dart';

import '../../../util/color_pallete.dart';

TableRow TableRowItem(
    int no, String mataKuliah, String sks, String nilaiHuruf, String bobot) {
  return TableRow(
    decoration: BoxDecoration(
      border: Border(bottom: BorderSide(color: ColorPallete.primary, width: 1.0)),
    ),
    children: [
      Padding(
        padding: const EdgeInsets.fromLTRB(8.0, 2.0, 8.0, 8.0),
        child: Text(no.toString(), style: TextStyle(fontSize: 12),),
      ),
      Padding(
        padding: const EdgeInsets.fromLTRB(8.0, 2.0, 8.0, 8.0),
        child: Text(mataKuliah, style: TextStyle(fontSize: 12),),
      ),
      Padding(
        padding: const EdgeInsets.fromLTRB(8.0, 2.0, 8.0, 8.0),
        child: Text(sks, style: TextStyle(fontSize: 12),),
      ),
      Padding(
        padding: const EdgeInsets.fromLTRB(8.0, 2.0, 8.0, 8.0),
        child: Text(nilaiHuruf, style: TextStyle(fontSize: 12),),
      ),
      Padding(
        padding: const EdgeInsets.fromLTRB(8.0, 2.0, 8.0, 8.0),
        child: Text(bobot, style: TextStyle(fontSize: 12),),
      ),
    ],
  );
}
