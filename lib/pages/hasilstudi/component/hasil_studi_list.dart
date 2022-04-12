import 'package:flutter/material.dart';
import 'package:horizontal_data_table/horizontal_data_table.dart';

import '../../../model/khs/model_user_mahasiswa_khs.dart';
import '../../../util/color_pallete.dart';

class HasilStudiList extends StatelessWidget {
  final List<Kh>? khs;

  HasilStudiList({required this.khs});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        height: 300,
        decoration: BoxDecoration(
          border: Border.all(width: 1, color: ColorPallete.primary),
          // color: Colors.amber,
        ),
        child: HorizontalDataTable(
          leftHandSideColumnWidth: 130,
          rightHandSideColumnWidth: 560,
          isFixedHeader: true,
          headerWidgets: _getTitleWidget(),
          leftSideItemBuilder: _generateFirstColumnRow,
          rightSideItemBuilder: _generateRightHandSideColumnRow,
          itemCount: khs!.length,
          rowSeparatorWidget: const Divider(
            color: Colors.orange,
            height: 1.0,
            thickness: 0.0,
          ),
          leftHandSideColBackgroundColor: Color(0xFFFFFFFF),
          rightHandSideColBackgroundColor: Color(0xFFFFFFFF),
          horizontalScrollbarStyle: const ScrollbarStyle(
              thumbColor: Colors.orange,
              isAlwaysShown: true,
              thickness: 2.0,
              radius: Radius.circular(5.0)),
          verticalScrollbarStyle: const ScrollbarStyle(
              thumbColor: Colors.orange,
              isAlwaysShown: true,
              thickness: 2.0,
              radius: Radius.circular(5.0)),
        )
        // Table(
        //   columnWidths: const <int, TableColumnWidth>{
        //     0: FlexColumnWidth(),
        //     1: FixedColumnWidth(60),
        //     2: FixedColumnWidth(60),
        //     3: FixedColumnWidth(60),
        //   },
        //   defaultVerticalAlignment: TableCellVerticalAlignment.middle,
        //   children: [
        //     TableRow(
        //       decoration: BoxDecoration(
        //           color: ColorPallete.primary,
        //           border:
        //           Border.all(width: 1, color: ColorPallete.primary),
        //           borderRadius: BorderRadius.only(
        //               topLeft: Radius.circular(4.0),
        //               topRight: Radius.circular(4.0))),
        //       children: <Widget>[
        //         Padding(
        //           padding: const EdgeInsets.all(8.0),
        //           child: Text(
        //             'Mata Kuliah',
        //             style: TextStyle(
        //               color: Colors.white,
        //               fontSize: 14,
        //               fontWeight: FontWeight.bold,
        //             ),
        //           ),
        //         ),
        //         Padding(
        //           padding: const EdgeInsets.all(8.0),
        //           child: Text(
        //             'NA',
        //             style: TextStyle(
        //               color: Colors.white,
        //               fontSize: 14,
        //               fontWeight: FontWeight.bold,
        //             ),
        //           ),
        //         ),
        //         Padding(
        //           padding: const EdgeInsets.all(8.0),
        //           child: Text(
        //             'NH',
        //             style: TextStyle(
        //               color: Colors.white,
        //               fontSize: 14,
        //               fontWeight: FontWeight.bold,
        //             ),
        //           ),
        //         ),
        //         Text(
        //           'Bobot',
        //           style: TextStyle(
        //             color: Colors.white,
        //             fontSize: 14,
        //             fontWeight: FontWeight.bold,
        //           ),
        //         ),
        //       ],
        //     ),
        //     ...?khs?.map((e) => TableRowItem(e.mk, e.angka, e.huruf, e.bobot)).toList(),
        //   ],
        // ),
        );
  }

  List<Widget> _getTitleWidget() {
    return [
      _getTitleItemWidget('Mata Kuliah', 130),
      _getTitleItemWidget('NA', 80),
      _getTitleItemWidget('NH', 80),
      _getTitleItemWidget('Bobot', 80),
      _getTitleItemWidget('Tugas', 80),
      _getTitleItemWidget('UTS', 80),
      _getTitleItemWidget('UAS', 80),
      _getTitleItemWidget('Prak', 80),
    ];
  }

  Widget _getTitleItemWidget(String label, double width) {
    return Container(
      child: Text(label,
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white)),
      width: width,
      height: 40,
      decoration: BoxDecoration(
        color: ColorPallete.primary,
      ),
      padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
      alignment: Alignment.center,
    );
  }

  Widget _generateFirstColumnRow(BuildContext context, int index) {
    return Container(
      child: Text(
        khs![index].mk,
        style: TextStyle(fontSize: 12.0),
        overflow: TextOverflow.ellipsis,
        maxLines: 2,
      ),
      width: 600,
      height: 40,
      padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
      alignment: Alignment.centerLeft,
    );
  }

  Widget _generateRightHandSideColumnRow(BuildContext context, int index) {
    return Row(
      children: <Widget>[
        Container(
          child: Text(khs![index].angka.toString(), style: TextStyle(fontSize: 12.0)),
          width: 80,
          height: 40,
          padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
          alignment: Alignment.center,
        ),
        Container(
          child: Text(khs![index].huruf.toString(), style: TextStyle(fontSize: 12.0)),
          width: 80,
          height: 40,
          padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
          alignment: Alignment.center,
        ),
        Container(
          child: Text(khs![index].bobot.toString(), style: TextStyle(fontSize: 12.0)),
          width: 80,
          height: 40,
          padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
          alignment: Alignment.center,
        ),
        Container(
          child: Text(khs![index].tugas.toString(), style: TextStyle(fontSize: 12.0)),
          width: 80,
          height: 40,
          padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
          alignment: Alignment.center,
        ),
        Container(
          child: Text(khs![index].uts.toString(), style: TextStyle(fontSize: 12.0)),
          width: 80,
          height: 40,
          padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
          alignment: Alignment.center,
        ),
        Container(
          child: Text(khs![index].uas.toString(), style: TextStyle(fontSize: 12.0)),
          width: 80,
          height: 40,
          padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
          alignment: Alignment.center,
        ),
        Container(
          child: Text(khs![index].prak.toString(),
              style: TextStyle(fontSize: 12.0)),
          width: 80,
          height: 40,
          padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
          alignment: Alignment.center,
        ),
      ],
    );
  }
}
