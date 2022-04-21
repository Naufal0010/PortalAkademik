import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:horizontal_data_table/horizontal_data_table.dart';

import '../../../../../model/krs/model_user_mahasiswa_krs.dart';
import '../../../../../util/color_pallete.dart';

class KrsListSudahAmbil extends StatelessWidget {
  final List<KrsListMk>? list;

  KrsListSudahAmbil({required this.list});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        height: 400,
        decoration: BoxDecoration(
          border: Border.all(width: 1, color: ColorPallete.primary),
          // color: Colors.amber,
        ),
        child: HorizontalDataTable(
          leftHandSideColumnWidth: 40,
          rightHandSideColumnWidth: 770,
          isFixedHeader: true,
          headerWidgets: _getTitleWidget(),
          leftSideItemBuilder: _generateFirstColumnRow,
          rightSideItemBuilder: _generateRightHandSideColumnRow,
          itemCount: list!.length,
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
        ));
  }

  List<Widget> _getTitleWidget() {
    return [
      SizedBox(
        width: 40,
        child: Container(
          child: Text('',
              style:
                  TextStyle(fontWeight: FontWeight.bold, color: Colors.white)),
          height: 40,
          decoration: BoxDecoration(
            color: ColorPallete.primary,
          ),
          padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
          alignment: Alignment.center,
        ),
      ),
      SizedBox(
        width: 240,
        child: Container(
          child: Text('Detail',
              style:
                  TextStyle(fontWeight: FontWeight.bold, color: Colors.white)),
          height: 40,
          decoration: BoxDecoration(
            color: ColorPallete.primary,
          ),
          padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
          alignment: Alignment.centerLeft,
        ),
      ),
      SizedBox(
        width: 280,
        child: Container(
          child: Text('Dosen',
              style:
                  TextStyle(fontWeight: FontWeight.bold, color: Colors.white)),
          height: 40,
          decoration: BoxDecoration(
            color: ColorPallete.primary,
          ),
          padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
          alignment: Alignment.centerLeft,
        ),
      ),
      SizedBox(
        width: 200,
        child: Container(
          child: Text('Jadwal',
              style:
                  TextStyle(fontWeight: FontWeight.bold, color: Colors.white)),
          height: 40,
          decoration: BoxDecoration(
            color: ColorPallete.primary,
          ),
          padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
          alignment: Alignment.centerLeft,
        ),
      ),
      SizedBox(
        width: 60,
        child: Container(
          child: Text('SKS',
              style:
                  TextStyle(fontWeight: FontWeight.bold, color: Colors.white)),
          height: 40,
          decoration: BoxDecoration(
            color: ColorPallete.primary,
          ),
          padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
          alignment: Alignment.centerLeft,
        ),
      ),
    ];
  }

  Widget _generateFirstColumnRow(BuildContext context, int index) {
    return Container(
        width: 220,
        height: 120,
        padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
        alignment: Alignment.centerLeft,
        child: Text(''));
  }

  Widget _generateRightHandSideColumnRow(BuildContext context, int index) {
    return Row(
      children: <Widget>[
        Container(
            width: 240,
            height: 120,
            padding: EdgeInsets.fromLTRB(10, 10, 0, 0),
            alignment: Alignment.centerLeft,
            child: Column(
              children: [
                SizedBox(
                  width: 220,
                  child: Container(
                    child: Text(
                      list![index].mkKode.toString(),
                      style: TextStyle(
                          fontSize: 12.0, fontWeight: FontWeight.bold),
                    ),
                    padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                    alignment: Alignment.centerLeft,
                  ),
                ),
                SizedBox(
                  width: 220,
                  child: Container(
                    child: Text(list![index].mkNama.toString(),
                        style: TextStyle(fontSize: 12.0)),
                    padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                    alignment: Alignment.centerLeft,
                  ),
                ),
                SizedBox(
                  width: 220,
                  child: Container(
                    child: Text(list![index].kurNama.toString(),
                        style: TextStyle(fontSize: 12.0)),
                    padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                    alignment: Alignment.centerLeft,
                  ),
                ),
                SizedBox(
                  width: 220,
                  child: Container(
                    child: Text(
                        'Semester ${list![index].klsSemester.toString()}',
                        style: TextStyle(fontSize: 12.0)),
                    padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                    alignment: Alignment.centerLeft,
                  ),
                ),
              ],
            )),
        Container(
            width: 280,
            height: 120,
            padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
            alignment: Alignment.centerLeft,
            child: Text(list![index].detail!.getDosenAmpu(),
                style: TextStyle(fontSize: 12.0))),
        Container(
          width: 200,
          height: 120,
          padding: EdgeInsets.fromLTRB(5, 0, 5, 0),
          alignment: Alignment.centerLeft,
          child: Html(
            data: """
                ${list![index].jadwal.toString()}
                """,
            style: {
              "body": Style(
                textOverflow: TextOverflow.ellipsis,
                margin: EdgeInsets.symmetric(horizontal: -10),
                fontFamily: 'Poppins',
                fontSize: FontSize(12.0),
              ),
            },
          ),
        ),
        Container(
          child: Text(list![index].mkSksTotal),
          width: 50,
          height: 50,
          padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
          alignment: Alignment.centerLeft,
        ),
      ],
    );
  }
}
