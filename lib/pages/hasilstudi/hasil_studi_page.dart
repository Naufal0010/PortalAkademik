import 'package:flutter/material.dart';
import 'package:portal_akademik/states/state.dart';
import 'package:portal_akademik/states/state_user_mahasiswa_khs_semester.dart';
import 'package:portal_akademik/util/color_pallete.dart';
import 'package:portal_akademik/widget/label_sub_header_widget.dart';
import 'package:portal_akademik/widget/line_chart_widget.dart';

class HasilStudiPage extends StatefulWidget {
  @override
  _HasilStudiPageState createState() => _HasilStudiPageState();
}

class _HasilStudiPageState extends State<HasilStudiPage> {
  String _valSemester = '20201';

  // List _listSemester = [
  //   {
  //     "semId": "20201",
  //     "semTahun": "2020",
  //     "semNama": "Ganjil 2020/2021",
  //     "semAktif": null
  //   },
  //   {
  //     "semId": "20192",
  //     "semTahun": "2019",
  //     "semNama": "Genap 2019/2020 (Sedang berlangsung)",
  //     "semAktif": "20192"
  //   },
  //   {
  //     "semId": "20191",
  //     "semTahun": "2019",
  //     "semNama": "Ganjil 2019/2020",
  //     "semAktif": null
  //   }
  // ];

  @override
  Widget build(BuildContext context) {
    UserMahasiswaKhsSemesterState user =
        Provider.of<UserMahasiswaKhsSemesterState>(context, listen: true);

    return SafeArea(
      child: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            LabelSubHeader('Statistik Indeks Prestasi', 20),
            SizedBox(
              height: 6,
            ),
            Container(
              child: Container(
                height: 150,
                width: MediaQuery.of(context).size.width,
                // color: Colors.amber,
                child: LineChartWidget(),
              ),
            ),
            SizedBox(height: 70),
            Container(
              margin: EdgeInsets.only(bottom: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Nilai Semester',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Color(0xff020202),
                    ),
                  ),
                  SizedBox(
                    width: 210,
                    child: ButtonTheme(
                      alignedDropdown: true,
                      child: DropdownButton(
                        isExpanded: true,
                        hint: Text("Pilih Semester", ),
                        icon: Icon(Icons.keyboard_arrow_down),
                        iconSize: 28,
                        value: _valSemester,
                        items: user.data?.data?.map((value) {
                          return DropdownMenuItem(
                            child: Text(value.semNama!, overflow: TextOverflow.ellipsis,),
                            value: value.semId,
                          );
                        }).toList(),
                        onChanged: (value) {
                          setState(() {
                            _valSemester = value.toString();
                          });
                        },
                      ),
                    ),
                  )
                ],
              ),
            ),
            Container(
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
                  TableRowItem('Data Mining', '79.90', 'A-', '15'),
                  TableRowItem('Pemrograman Web Lanjut', '80.00', 'A', '16'),
                  TableRowItem('Pengolahan Citra', '80.00', 'A', '16'),
                  TableRowItem('Rekayasa Perangkat Lunak', '85.00', 'A', '16'),
                  TableRowItem('Text Mining', '76.00', 'B+', '14'),
                ],
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            Container(
              padding: EdgeInsets.all(15.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                border: Border.all(width: 1, color: Colors.grey.shade300),
                // color: Colors.amber,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  LabelSubHeader('Keterangan Studi', 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        flex: 2,
                        child: Text(
                          'Total SKS',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Text(
                          ':',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Text(
                          '116  ',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        flex: 2,
                        child: Text(
                          'Total Semester',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Text(
                          ':',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Text(
                          'Lima',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        flex: 2,
                        child: Text(
                          'Indeks Prestasi Komulatif',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Text(
                          ':',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Text(
                          '3.71',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

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
}
