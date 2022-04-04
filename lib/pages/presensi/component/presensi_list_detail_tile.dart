import 'package:flutter/material.dart';
import 'package:portal_akademik/model/model_user_mahasiswa_list_mk_presensi.dart';
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
            width: 220,
            child: Text(
              '${data.tglMulaiPresensi} s/d ${data.tglSelesaiPresensi}',
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
          width: 80,
          height: 50,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.white,
            border: Border.all(color: ColorPallete.primary)
          ),
          child: Center(
            child: Text(data.aksi,
                style: TextStyle(color: ColorPallete.primary, fontWeight: FontWeight.bold), textAlign: TextAlign.center),
          ),
        ),
      );
    }
    return Text(data.aksi,
        style: TextStyle(color: Colors.white), textAlign: TextAlign.center);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.symmetric(vertical: 6),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(width: 1, color: ColorPallete.primary),
      ),
      child: Stack(
        children: [
          Container(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 36.0, top: 36.0, bottom: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: 200,
                        child: Text(
                          data.pokokBahasan,
                          style: TextStyle(fontSize: 12,),
                        ),
                      ),
                      SizedBox(height: 8),
                      SizedBox(
                        width: 200,
                        child: Text(
                         'SKS Pertemuan : ',
                          style: TextStyle(fontSize: 12,),
                        ),
                      ),
                      SizedBox(height: 6),
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
                    child: Container(
                      decoration: BoxDecoration(
                          color: keteranganColor(data.aksi),
                          borderRadius: BorderRadius.only(
                              topRight: Radius.circular(20),
                              bottomRight: Radius.circular(20))),
                      width: 100,
                      height: 200,
                      child: Center(
                        child: aksiPresensiOnClick(data.aksi),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            top: 0,
            child: Container(
              decoration: BoxDecoration(
                  color: ColorPallete.blackPastel,
                  borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(20),
                      topLeft: Radius.circular(20))),
              width: 200,
              height: 32,
              child: Center(
                child: Text(
                  'Pertemuan ke - ${data.noPertemuan}',
                  style: TextStyle(color: Colors.white),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}