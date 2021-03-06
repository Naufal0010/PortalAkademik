import 'package:flutter/material.dart';
import 'package:portal_akademik/model/presensi/model_user_mahasiswa_list_mk_presensi.dart';
import 'package:portal_akademik/util/color_pallete.dart';

class PresensiListDetailTile extends StatelessWidget {
  final DataPresensi data;
  final Function() onTap;

  PresensiListDetailTile({required this.data, required this.onTap});

  Color keteranganColor(String aksi) {
    switch (aksi) {
      case "presensi":
        return Colors.white;
      case "Tanpa Keterangan":
        return ColorPallete.redPastel;
      case "Hadir":
        return ColorPallete.greenPastel;
      case "Izin":
        return ColorPallete.orangePastel;
      case "Sakit":
        return ColorPallete.orangePastel;
      default:
        return ColorPallete.redPastel;
    }
  }

  Widget wIsMandiri(String? isMandiri) {
    if (isMandiri == "1") {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 200,
            child: Text(
              'Presensi Mandiri',
              style: TextStyle(fontSize: 12,),
            ),
          ),
          SizedBox(height: 6,),
          SizedBox(
            width: 200,
            child: Text(
              '${data.tglMulaiPresensi} s/d \n${data.tglSelesaiPresensi}',
              style: TextStyle(fontSize: 12),
            ),
          ),
        ],
      );
    } else {
      return SizedBox(
        width: 200,
        child: Text(
          'Presensi oleh Dosen',
          style: TextStyle(fontSize: 12,),
        ),
      );
    }
  }

  Widget aksiPresensiOnClick(String aksi) {
    if (aksi == "Hadir") {
      return Center(
        child: Text(data.aksi,
            style: TextStyle(color: Colors.white), textAlign: TextAlign.center)
      );
    } else if (aksi == "presensi") {
      return Center(
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            border: Border.all(color: ColorPallete.primary)
          ),
          child: Center(
            child: Text(data.aksi,
                style: TextStyle(color: ColorPallete.primary), textAlign: TextAlign.center)
          ),
        ),
      );
    } else if (aksi == "Tanpa Keterangan") {
      return Center(
        child: Text(data.aksi,
            style: TextStyle(color: Colors.white, fontSize: 12), textAlign: TextAlign.center),
      );
    }
    return Center(
      child: Text(data.aksi,
          style: TextStyle(color: Colors.white), textAlign: TextAlign.center),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.symmetric(vertical: 6),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(4.0),
        border: Border.all(width: 1, color: ColorPallete.primary),
      ),
      child: Stack(
        children: [
          Container(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 36.0, top: 16.0, bottom: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                                bottomRight: Radius.circular(20),
                                topLeft: Radius.circular(20))),
                        child: Center(
                          child: Text(
                            'Pertemuan ke - ${data.noPertemuan}',
                            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                      SizedBox(height: 4,),
                      SizedBox(
                        width: 200,
                        child: Text(
                          data.pokokBahasan,
                          style: TextStyle(fontSize: 12,),
                        ),
                      ),
                      SizedBox(height: 8),
                      Text(
                        data.dosenAmpu,
                        style: TextStyle(fontSize: 12),
                      ),
                      SizedBox(height: 6),
                      wIsMandiri(data.ismandiri),
                    ],
                  ),
                ),
                const Spacer(),
                Ink(
                  child: InkWell(
                    onTap: onTap,
                    child: Center(
                      child: Padding(
                        padding: EdgeInsets.only(right: 16.0),
                        child: SizedBox(
                          width: 80,
                          child: Container(
                            decoration: BoxDecoration(
                                color: keteranganColor(data.aksi),
                                borderRadius: BorderRadius.circular(10)),
                            height: 60,
                            child: aksiPresensiOnClick(data.aksi),
                          ),
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
          // Positioned(
          //   top: 0,
          //   left: -3,
          //   child: Container(
          //     decoration: BoxDecoration(
          //         color: Colors.white,
          //         borderRadius: BorderRadius.only(
          //             bottomRight: Radius.circular(20),
          //             topLeft: Radius.circular(20))),
          //     width: 200,
          //     height: 32,
          //     child: Center(
          //       child: Text(
          //         'Pertemuan ke - ${data.noPertemuan}',
          //         style: TextStyle(color: Colors.black),
          //         textAlign: TextAlign.center,
          //       ),
          //     ),
          //   ),
          // ),
        ],
      ),
    );
  }
}