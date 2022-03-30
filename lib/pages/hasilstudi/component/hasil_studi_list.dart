import 'package:flutter/material.dart';

import '../../../model/model_user_mahasiswa_khs.dart';
import '../../../util/color_pallete.dart';
import 'hasil_studi_table.dart';

class HasilStudiList extends StatelessWidget {
  final List<Kh>? khs;

  HasilStudiList({required this.khs});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        border: Border.all(width: 1, color: Colors.grey.shade300),
        // color: Colors.amber,
      ),
      child: Table(
        columnWidths: const <int, TableColumnWidth>{
          0: FlexColumnWidth(),
          1: FixedColumnWidth(60),
          2: FixedColumnWidth(60),
          3: FixedColumnWidth(60),
        },
        defaultVerticalAlignment: TableCellVerticalAlignment.middle,
        children: [
          TableRow(
            decoration: BoxDecoration(
                color: ColorPallete.primary,
                border:
                Border.all(width: 1, color: ColorPallete.primary),
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10.0),
                    topRight: Radius.circular(10.0))),
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Mata Kuliah',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'NA',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'NH',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Text(
                'Bobot',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          ...?khs?.map((e) => TableRowItem(e.mk, e.angka, e.huruf, e.bobot)).toList(),
        ],
      ),
    );
  }
}
