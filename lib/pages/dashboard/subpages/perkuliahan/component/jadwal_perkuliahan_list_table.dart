import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:horizontal_data_table/horizontal_data_table.dart';

import '../../../../../states/state.dart';
import '../../../../../states/state_user_mahasiswa_jadwal_matakuliah.dart';
import '../../../../../util/color_pallete.dart';

class JadwalPerkuliahanListTable extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    UserMahasiswaJadwalMataKuliahState userJadwal =
    Provider.of<UserMahasiswaJadwalMataKuliahState>(context, listen: true);

    return Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          border: Border.all(width: 1, color: ColorPallete.primary),
          // color: Colors.amber,
        ),
        child: SizedBox(
          width: double.infinity,
          child: HorizontalDataTable(
            leftHandSideColumnWidth: 150,
            rightHandSideColumnWidth: 460,
            isFixedHeader: true,
            headerWidgets: _getTitleWidget(),
            leftSideItemBuilder: _generateFirstColumnRow,
            rightSideItemBuilder: _generateRightHandSideColumnRow,
            itemCount: userJadwal.data!.data!.length,
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
    );
  }

  List<Widget> _getTitleWidget() {
    return [
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
          alignment: Alignment.centerLeft,
        ),
      ),
      SizedBox(
        width: 300,
        child: Container(
          child: Text('Dosen Ampu',
              style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white)),
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
          child: Text('Jadwal Kuliah',
              style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white)),
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

    UserMahasiswaJadwalMataKuliahState userJadwal =
    Provider.of<UserMahasiswaJadwalMataKuliahState>(context, listen: true);

    return SizedBox(
      width: 200,
      child: Container(
        child: Text(userJadwal.data!.data![index].mk,
            style: TextStyle(fontSize: 12.0)),
        height: 100,
        padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
        alignment: Alignment.centerLeft,
      ),
    );
  }

  Widget _generateRightHandSideColumnRow(BuildContext context, int index) {

    UserMahasiswaJadwalMataKuliahState userJadwal =
    Provider.of<UserMahasiswaJadwalMataKuliahState>(context, listen: true);

    return Row(
      children: <Widget>[

        SizedBox(
          width: 300,
          child: Container(
            child: Html(
              data: """
                    ${userJadwal.data!.data![index].dosen}
                    """,
              style: {
                "body": Style(
                  textOverflow: TextOverflow.ellipsis,
                  margin: EdgeInsets.symmetric(horizontal: -10),
                  fontFamily: 'Poppins',
                  fontSize: FontSize(12.0),
                  height: 100,
                ),
              },
            ),
          ),
        ),
        SizedBox(
          width: 150,
          child: Column(
            children: [
              Container(
                child: Text(userJadwal.data!.data![index].hariKuliah.toString(),
                    style: TextStyle(fontSize: 12.0)),
                padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
                alignment: Alignment.centerLeft,
              ),
              Container(
                child: Text(userJadwal.data!.data![index].jamKuliah.toString(),
                    style: TextStyle(fontSize: 12.0)),
                padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
                alignment: Alignment.centerLeft,
              ),
              Container(
                child: Text(userJadwal.data!.data![index].ruangKuliah.toString(),
                    style: TextStyle(fontSize: 12.0)),
                padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
                alignment: Alignment.centerLeft,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
