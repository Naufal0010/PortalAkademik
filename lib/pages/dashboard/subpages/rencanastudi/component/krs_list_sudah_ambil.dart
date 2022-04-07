import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:horizontal_data_table/horizontal_data_table.dart';
import 'package:portal_akademik/util/service/logger.dart';

import '../../../../../model/model_user_mahasiswa_krs.dart';
import '../../../../../util/color_pallete.dart';

class KrsListSudahAmbil extends StatelessWidget {
  final List<KrsListMk>? list;

  KrsListSudahAmbil({required this.list});

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
        )
    );
  }

  List<Widget> _getTitleWidget() {
    return [
      SizedBox(
        width: 200,
        child: Container(
          child: Text('Detail',
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
        width: 200,
        child: Container(
          child: Text('Dosen',
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
        width: 200,
        child: Container(
          child: Text('Jadwal',
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
          child: Text('SKS',
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
    UtilLogger.log('test', list);
    return Container(
      width: 200,
      height: 60,
      padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
      alignment: Alignment.centerLeft,
      child: Column(
        children: [
          Text(
            'test',
            style: TextStyle(fontSize: 12.0),
            overflow: TextOverflow.ellipsis,
            maxLines: 2,
          ),
          Text(
            'test',
            style: TextStyle(fontSize: 12.0),
            overflow: TextOverflow.ellipsis,
            maxLines: 2,
          ),
          Text(
            'test',
            style: TextStyle(fontSize: 12.0),
            overflow: TextOverflow.ellipsis,
            maxLines: 2,
          ),
          Text(
            'test',
            style: TextStyle(fontSize: 12.0),
            overflow: TextOverflow.ellipsis,
            maxLines: 2,
          ),

        ],
      )
    );
  }

  Widget _generateRightHandSideColumnRow(BuildContext context, int index) {
    return Row(
      children: <Widget>[
        Container(
          width: 200,
          height: 40,
          padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
          alignment: Alignment.center,
          child: Text("", style: TextStyle(fontSize: 12.0))
        ),

        Container(
          width: 200,
          height: 40,
          padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
          alignment: Alignment.center,
          child: Html(
            data: """
        
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
          child: Text('test'),
          width: 40,
          height: 40,
          padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
          alignment: Alignment.center,
        ),
      ],
    );
  }
}
