import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:portal_akademik/model/model_user_mahasiswa_jadwal_matakuliah.dart';
import 'package:portal_akademik/util/color_pallete.dart';
import 'package:portal_akademik/widget/label_sub_header_widget.dart';

class PresensiDetailPage extends StatelessWidget {
  final Datum data;

  PresensiDetailPage(this.data);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.black),
        title: Text(data.mk,
            style: TextStyle(color: Colors.black, fontSize: 18),
            overflow: TextOverflow.ellipsis),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.all(36.0),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10.0),
                    border: Border.all(width: 1, color: ColorPallete.primary),
                    // color: Colors.amber,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Dosen Ampu', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
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
                      SizedBox(height: 8,),
                      Text('Jadwal', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
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
                      SizedBox(height: 4,),
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
                      SizedBox(height: 8,),
                      Text('Ruang', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
