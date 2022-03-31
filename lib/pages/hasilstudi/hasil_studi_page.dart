import 'package:flutter/material.dart';
import 'package:portal_akademik/pages/hasilstudi/component/hasil_studi_list.dart';
import 'package:portal_akademik/states/state.dart';
import 'package:portal_akademik/states/state_user_mahasiswa_khs_semester.dart';
import 'package:portal_akademik/util/api_local_store.dart';
import 'package:portal_akademik/widget/label_sub_header_widget.dart';
import 'package:portal_akademik/widget/line_chart_widget.dart';
import 'package:portal_akademik/widget/shimmer_widget.dart';
import '../../states/state_user_mahasiswa_khs.dart';


class HasilStudiPage extends StatefulWidget {
  @override
  _HasilStudiPageState createState() => _HasilStudiPageState();
}

class _HasilStudiPageState extends State<HasilStudiPage> {

  String _valSemester = ApiLocalStorage.userModelMahasiswa!.semAwal;

  @override
  Widget build(BuildContext context) {
    UserMahasiswaKhsSemesterState user =
        Provider.of<UserMahasiswaKhsSemesterState>(context, listen: true);

    UserMahasiswaKhsState userKhs =
    Provider.of<UserMahasiswaKhsState>(context, listen: false);

    Future<void> refresh() {
      user.refreshData();
      return userKhs.refreshData();
    }

    userKhs.initData(_valSemester.toString());
    
    return SafeArea(
      child: RefreshIndicator(
        onRefresh: refresh,
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
                    user.isLoading ? ShimmerWidget(height: 20, width: 200,) : SizedBox(
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
                              userKhs.initData(value.toString());
                            });
                          },
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Consumer<UserMahasiswaKhsState>(
                builder: (context, value, child) {
                  return value.isLoading
                      ? ShimmerWidget(height: 150, width: double.infinity,)
                      : HasilStudiList(khs: value.data?.khs?.khs);
                },
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
      ),
    );
  }
}
