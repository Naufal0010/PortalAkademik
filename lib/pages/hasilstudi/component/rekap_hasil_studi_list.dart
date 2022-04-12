import 'package:flutter/material.dart';
import 'package:horizontal_data_table/horizontal_data_table.dart';

import '../../../model/khs/model_user_mahasiswa_rekap_hasil_studi.dart';
import '../../../util/color_pallete.dart';

class RekapHasilStudiList extends StatelessWidget {
  final List<Transkrip>? transkrip;

  RekapHasilStudiList({required this.transkrip});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: MediaQuery.of(context).size.width,
        height: 300,
        decoration: BoxDecoration(
          border: Border.all(width: 1, color: ColorPallete.primary),
          // color: Colors.amber,
        ),
        child: SizedBox(
          width: double.infinity,
          child: HorizontalDataTable(
            leftHandSideColumnWidth: 40,
            rightHandSideColumnWidth: 350,
            isFixedHeader: true,
            headerWidgets: _getTitleWidget(),
            leftSideItemBuilder: _generateFirstColumnRow,
            rightSideItemBuilder: _generateRightHandSideColumnRow,
            itemCount: transkrip!.length,
            rowSeparatorWidget: const Divider(
              color: Colors.orange,
              height: 1.0,
              thickness: 0.0,
            ),
            leftHandSideColBackgroundColor: Color(0xFFFFFFFF),
            rightHandSideColBackgroundColor: Color(0xFFFFFFFF),
            horizontalScrollbarStyle: const ScrollbarStyle(
                thumbColor: Colors.orange,
                thickness: 2.0,
                radius: Radius.circular(5.0)),
            verticalScrollbarStyle: const ScrollbarStyle(
                thumbColor: Colors.orange,
                isAlwaysShown: true,
                thickness: 2.0,
                radius: Radius.circular(5.0)),
          ),
        )
        // Table(
        //   columnWidths: const <int, TableColumnWidth>{
        //     0: FixedColumnWidth(40),
        //     1: FlexColumnWidth(),
        //     2: FixedColumnWidth(40),
        //     3: FixedColumnWidth(40),
        //     4: FixedColumnWidth(50)
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
        //             'No',
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
        //             'K',
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
        //             'N',
        //             style: TextStyle(
        //               color: Colors.white,
        //               fontSize: 14,
        //               fontWeight: FontWeight.bold,
        //             ),
        //           ),
        //         ),
        //         Text(
        //           'KxN',
        //           style: TextStyle(
        //             color: Colors.white,
        //             fontSize: 14,
        //             fontWeight: FontWeight.bold,
        //           ),
        //         ),
        //       ],
        //     ),
        //     ...?transkrip?.map((e) => TableRowItem(e.no, e.namaMk, e.sks, e.nilai, e.sksbobot)).toList(),
        //   ],
        // ),
        );
  }

  List<Widget> _getTitleWidget() {
    return [
      _getTitleItemWidget('No', 40),
      SizedBox(
        width: 200,
        child: Container(
          child: Text('Mata Kuliah',
              style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white)),
          height: 40,
          decoration: BoxDecoration(
            color: ColorPallete.primary,
          ),
          padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
          alignment: Alignment.center,
        ),
      ),
      SizedBox(
        width: 50,
        child: Container(
          child: Text('K',
              style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white)),
          height: 40,
          decoration: BoxDecoration(
            color: ColorPallete.primary,
          ),
          padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
          alignment: Alignment.center,
        ),
      ),
      SizedBox(
        width: 50,
        child: Container(
          child: Text('N',
              style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white)),
          height: 40,
          decoration: BoxDecoration(
            color: ColorPallete.primary,
          ),
          padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
          alignment: Alignment.center,
        ),
      ),
      SizedBox(
        width: 50,
        child: Container(
          child: Text('KxN',
              style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white)),
          height: 40,
          decoration: BoxDecoration(
            color: ColorPallete.primary,
          ),
          padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
          alignment: Alignment.center,
        ),
      ),
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
        transkrip![index].no.toString(),
        style: TextStyle(fontSize: 12.0),
        overflow: TextOverflow.ellipsis,
        maxLines: 2,
      ),
      width: 600,
      height: 40,
      padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
      alignment: Alignment.center,
    );
  }

  Widget _generateRightHandSideColumnRow(BuildContext context, int index) {
    return Row(
      children: <Widget>[
        SizedBox(
          width: 200,
          child: Container(
            child: Text(transkrip![index].namaMk.toString(),
                style: TextStyle(fontSize: 12.0)),
            height: 40,
            padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
            alignment: Alignment.centerLeft,
          ),
        ),
        SizedBox(
          width: 50,
          child: Container(
            child: Text(transkrip![index].sks.toString(),
                style: TextStyle(fontSize: 12.0)),
            height: 40,
            padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
            alignment: Alignment.center,
          ),
        ),
        SizedBox(
          width: 50,
          child: Container(
            child: Text(transkrip![index].nilai.toString(),
                style: TextStyle(fontSize: 12.0)),
            height: 40,
            padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
            alignment: Alignment.center,
          ),
        ),
        SizedBox(
          width: 50,
          child: Container(
            child: Text(transkrip![index].sksbobot.toString(),
                style: TextStyle(fontSize: 12.0)),
            height: 40,
            padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
            alignment: Alignment.center,
          ),
        ),
      ],
    );
  }
}