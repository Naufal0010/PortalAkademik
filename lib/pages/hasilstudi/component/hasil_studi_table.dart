import 'package:flutter/material.dart';

TableRow TableRowItem(
    String name, String nilai, String nilaiHuruf, String bobot) {
  return TableRow(
    children: [
      Padding(
        padding: const EdgeInsets.fromLTRB(8.0, 2.0, 8.0, 2.0),
        child: Text(name),
      ),
      Padding(
        padding: const EdgeInsets.fromLTRB(8.0, 2.0, 8.0, 2.0),
        child: Text(nilai),
      ),
      Padding(
        padding: const EdgeInsets.fromLTRB(8.0, 2.0, 8.0, 2.0),
        child: Text(nilaiHuruf),
      ),
      Padding(
        padding: const EdgeInsets.fromLTRB(8.0, 2.0, 8.0, 2.0),
        child: Text(bobot),
      ),
    ],
  );
}