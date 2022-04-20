import 'package:flutter/material.dart';
import 'package:horizontal_data_table/horizontal_data_table.dart';
import 'package:portal_akademik/states/jadwal/state_user_mahasiswa_jadwal_uas.dart';
import 'package:portal_akademik/states/state.dart';
import 'package:portal_akademik/util/color_pallete.dart';

class UjianAkhirListTable extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    UserMahasiswaJadwalUasState userUas =
        Provider.of<UserMahasiswaJadwalUasState>(context, listen: true);
    return Container(
        width: MediaQuery.of(context).size.width,
        height: 650,
        decoration: BoxDecoration(
          border: Border.all(width: 1, color: ColorPallete.primary),
          // color: Colors.amber,
        ),
        child: SizedBox(
          width: double.infinity,
          child: HorizontalDataTable(
            leftHandSideColumnWidth: 180,
            rightHandSideColumnWidth: 200,
            isFixedHeader: true,
            headerWidgets: _getTitleWidget(),
            leftSideItemBuilder: _generateFirstColumnRow,
            rightSideItemBuilder: _generateRightHandSideColumnRow,
            itemCount: userUas.data!.data!.length,
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
        ));
  }

  List<Widget> _getTitleWidget() {
    return [
      SizedBox(
        width: 180,
        child: Container(
          child: Text('Mata Kuliah',
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
        width: 200,
        child: Container(
          child: Text('Jadwal UAS',
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
    ];
  }

  Widget _generateFirstColumnRow(BuildContext context, int index) {
    UserMahasiswaJadwalUasState userUas =
        Provider.of<UserMahasiswaJadwalUasState>(context, listen: true);

    return SizedBox(
      width: 180,
      child: Container(
        child: Text(userUas.data!.data![index].mk,
            style: TextStyle(fontSize: 12.0)),
        height: 100,
        padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
        alignment: Alignment.centerLeft,
      ),
    );
  }

  Widget _generateRightHandSideColumnRow(BuildContext context, int index) {
    UserMahasiswaJadwalUasState userUas =
        Provider.of<UserMahasiswaJadwalUasState>(context, listen: true);

    return Row(
      children: <Widget>[
        SizedBox(
          width: 200,
          height: 100,
          child: Column(
            children: [
              Container(
                child: Text(userUas.data!.data![index].hariUas.toString(),
                    style: TextStyle(fontSize: 12.0)),
                padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
                alignment: Alignment.centerLeft,
              ),
              Container(
                child: Text(userUas.data!.data![index].jamUas.toString(),
                    style: TextStyle(fontSize: 12.0)),
                padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
                alignment: Alignment.centerLeft,
              ),
              Container(
                child: Text(userUas.data!.data![index].ruangUas.toString(),
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
