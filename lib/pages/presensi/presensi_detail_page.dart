import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:portal_akademik/model/model_user_mahasiswa_jadwal_matakuliah.dart';
import 'package:portal_akademik/pages/presensi/component/shimmer_list_detail_tile.dart';
import 'package:portal_akademik/states/state_user_mahasiswa_list_mk_presensi.dart';
import 'package:portal_akademik/util/color_pallete.dart';
import 'package:portal_akademik/widget/error_handling_widget.dart';
import 'package:provider/provider.dart';

class PresensiDetailPage extends StatelessWidget {
  final MataKuliah data;

  PresensiDetailPage(this.data);

  @override
  Widget build(BuildContext context) {
    UserMahasiswaListMkPresensiState userMahasiswa =
        Provider.of<UserMahasiswaListMkPresensiState>(context, listen: false);
    userMahasiswa.mataKuliah = data;
    userMahasiswa.refreshData();

    Future<void> refresh() {
      userMahasiswa.refreshData();
      return userMahasiswa.refreshData();
    }

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.black),
        title: Text(data.mk,
            style: TextStyle(
                color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold),
            overflow: TextOverflow.ellipsis),
      ),
      body: SafeArea(
        child: RefreshIndicator(
          onRefresh: refresh,
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: double.infinity,
                    padding: EdgeInsets.all(36.0),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(width: 1, color: ColorPallete.primary),
                      // color: Colors.amber,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Dosen Ampu',
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold)),
                        Container(
                          width: MediaQuery.of(context).size.width * 0.6,
                          child: Html(
                            data: """
                              ${data.dosen}
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
                        SizedBox(
                          height: 8,
                        ),
                        Text('Jadwal',
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold)),
                        Container(
                          width: MediaQuery.of(context).size.width * 0.6,
                          child: Html(
                            data: """
                              ${data.hariKuliah}
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
                        SizedBox(
                          height: 4,
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width * 0.6,
                          child: Html(
                            data: """
                              ${data.jamKuliah}
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
                        SizedBox(
                          height: 8,
                        ),
                        Text('Ruang',
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold)),
                        Container(
                          width: MediaQuery.of(context).size.width * 0.6,
                          child: Html(
                            data: """
                              ${data.ruangKuliah}
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
                      ],
                    ),
                  ),
                  Consumer<UserMahasiswaListMkPresensiState>(
                    builder: (context, value, child) {
                      return value.isLoading
                          ? ShimmerListDetailTile()
                          : getErrorListDetailPresensi(context, value);
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
