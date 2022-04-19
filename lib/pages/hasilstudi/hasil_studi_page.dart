import 'package:flutter/material.dart';
import 'package:portal_akademik/pages/hasilstudi/component/hasil_studi_list.dart';
import 'package:portal_akademik/pages/hasilstudi/component/rekap_hasil_studi_list.dart';
import 'package:portal_akademik/states/khs/state_user_mahasiswa_rekap_hasil_studi.dart';
import 'package:portal_akademik/states/state.dart';
import 'package:portal_akademik/util/api_local_store.dart';
import 'package:portal_akademik/util/color_pallete.dart';
import 'package:portal_akademik/widget/label_sub_header_widget.dart';
import 'package:portal_akademik/widget/shimmer_widget.dart';

import '../../states/khs/state_user_mahasiswa_khs.dart';
import '../../states/khs/state_user_mahasiswa_khs_semester.dart';

class HasilStudiPage extends StatefulWidget {
  @override
  _HasilStudiPageState createState() => _HasilStudiPageState();
}

class _HasilStudiPageState extends State<HasilStudiPage> {
  String _valSemester = ApiLocalStorage.semesterAktif!.rows![0].semesterAktif;

  @override
  Widget build(BuildContext context) {
    UserMahasiswaKhsSemesterState user =
        Provider.of<UserMahasiswaKhsSemesterState>(context, listen: true);

    UserMahasiswaKhsState userKhs =
        Provider.of<UserMahasiswaKhsState>(context, listen: false);

    UserMahasiswaRekapHasilStudiState userRhs =
        Provider.of<UserMahasiswaRekapHasilStudiState>(context, listen: false);

    Future<void> refresh() {
      user.refreshData();
      return userKhs.refreshData();
    }

    userKhs.initData(_valSemester.toString());
    userRhs.initData();

    return SafeArea(
      child: RefreshIndicator(
        onRefresh: refresh,
        child: SingleChildScrollView(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // LabelSubHeader('Statistik IP Semester', 20),
              // SizedBox(
              //   height: 6,
              // ),
              // Container(
              //   child: Container(
              //     height: 150,
              //     width: MediaQuery.of(context).size.width,
              //     // color: Colors.amber,
              //     child: LineChartWidget(),
              //   ),
              // ),
              // SizedBox(height: 75),
              Container(
                margin: EdgeInsets.only(bottom: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    LabelSubHeader('Nilai Semester', 24),
                    SizedBox(
                      height: 6,
                    ),
                    user.isLoading
                        ? ShimmerWidget(
                            height: 20,
                            width: 200,
                          )
                        : SizedBox(
                            width: double.infinity,
                            child: Container(
                              padding: EdgeInsets.only(left: 10.0, right: 10.0),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.0),
                                color: Color(0xFFE7E7E7),
                              ),
                              child: DropdownButtonHideUnderline(
                                child: DropdownButton(
                                  hint: Text("Pilih Semester",
                                      overflow: TextOverflow.ellipsis,
                                      style:
                                          TextStyle(color: Color(0xFF808080))),
                                  icon: Icon(Icons.keyboard_arrow_down),
                                  iconSize: 28,
                                  value: _valSemester,
                                  items: user.data?.data?.map((value) {
                                    return DropdownMenuItem(
                                      child: Text(
                                        value.semNama!,
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                            color: Color(0xFF808080),
                                            fontSize: 14),
                                      ),
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
                            ),
                          )
                  ],
                ),
              ),
              Consumer<UserMahasiswaKhsState>(
                builder: (context, value, child) {
                  return value.isLoading
                      ? ShimmerWidget(
                          height: 150,
                          width: double.infinity,
                        )
                      : Column(
                          children: [
                            HasilStudiList(khs: value.data?.khs?.khs),
                            SizedBox(
                              height: 20.0,
                            ),
                            Container(
                              padding: EdgeInsets.all(15.0),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.0),
                                border: Border.all(
                                    width: 1, color: ColorPallete.primary),
                                // color: Colors.amber,
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Expanded(
                                        flex: 2,
                                        child: Text(
                                          'SKS Lulus',
                                          style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        flex: 1,
                                        child: userKhs.isLoading
                                            ? ShimmerWidget(
                                                width: MediaQuery.of(context)
                                                    .size
                                                    .width,
                                                height: 20,
                                              )
                                            : Text(
                                                '${userKhs.data?.khs?.sksLulus}',
                                                style: TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Expanded(
                                        flex: 2,
                                        child: Text(
                                          'Indeks Prestasi (IP)',
                                          style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        flex: 1,
                                        child: userKhs.isLoading
                                            ? ShimmerWidget(
                                                width: MediaQuery.of(context)
                                                    .size
                                                    .width,
                                                height: 20,
                                              )
                                            : Text(
                                                '${userKhs.data?.khs?.ipk}',
                                                style: TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Expanded(
                                        flex: 2,
                                        child: Text(
                                          'SKS Maksimal Berikutnya',
                                          style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        flex: 1,
                                        child: userKhs.isLoading
                                            ? ShimmerWidget(
                                                width: MediaQuery.of(context)
                                                    .size
                                                    .width,
                                                height: 20,
                                              )
                                            : Text(
                                                '${userKhs.data?.khs?.sksMaxDepan}',
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
                            ),
                          ],
                        );
                },
              ),
              LabelSubHeader('Rekap Hasil Studi', 20),
              Consumer<UserMahasiswaRekapHasilStudiState>(
                builder: (context, value, child) {
                  return value.isLoading
                      ? ShimmerWidget(
                          height: 150,
                          width: double.infinity,
                        )
                      : Column(
                          children: [
                            RekapHasilStudiList(
                                transkrip: value.data?.transkrip),
                            SizedBox(
                              height: 20.0,
                            ),
                            Container(
                              padding: EdgeInsets.all(15.0),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.0),
                                border: Border.all(
                                    width: 1, color: ColorPallete.primary),
                                // color: Colors.amber,
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  LabelSubHeader('Keterangan Studi', 20),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
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
                                        child: userRhs.isLoading
                                            ? ShimmerWidget(
                                                width: MediaQuery.of(context)
                                                    .size
                                                    .width,
                                                height: 20,
                                              )
                                            : Text(
                                                '${userRhs.data?.sksLulus}',
                                                style: TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Expanded(
                                        flex: 2,
                                        child: Text(
                                          'Indeks Prestasi Kumulatif',
                                          style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        flex: 1,
                                        child: userRhs.isLoading
                                            ? ShimmerWidget(
                                                width: MediaQuery.of(context)
                                                    .size
                                                    .width,
                                                height: 20,
                                              )
                                            : Text(
                                                '${userRhs.data?.ipk}',
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
                        );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}