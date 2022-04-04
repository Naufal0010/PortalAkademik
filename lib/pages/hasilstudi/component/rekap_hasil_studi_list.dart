import 'package:flutter/material.dart';
import 'package:portal_akademik/pages/hasilstudi/component/rekap_hasil_studi_table.dart';
import '../../../model/model_user_mahasiswa_rekap_hasil_studi.dart';
import '../../../util/color_pallete.dart';

class RekapHasilStudiList extends StatelessWidget {
  final List<Transkrip>? transkrip;

  RekapHasilStudiList({required this.transkrip});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6.0),
        border: Border.all(width: 1, color: ColorPallete.primary),
        // color: Colors.amber,
      ),
      child: Table(
        columnWidths: const <int, TableColumnWidth>{
          0: FixedColumnWidth(40),
          1: FlexColumnWidth(),
          2: FixedColumnWidth(40),
          3: FixedColumnWidth(40),
          4: FixedColumnWidth(50)
        },
        defaultVerticalAlignment: TableCellVerticalAlignment.middle,
        children: [
          TableRow(
            decoration: BoxDecoration(
                color: ColorPallete.primary,
                border:
                Border.all(width: 1, color: ColorPallete.primary),
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(4.0),
                    topRight: Radius.circular(4.0))),
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'No',
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
                  'K',
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
                  'N',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Text(
                'KxN',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          ...?transkrip?.map((e) => TableRowItem(e.no, e.namaMk, e.sks, e.nilai, e.sksbobot)).toList(),
        ],
      ),
    );
  }
}