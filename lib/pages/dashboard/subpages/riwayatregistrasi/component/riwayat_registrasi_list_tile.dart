import 'package:flutter/material.dart';
import 'package:portal_akademik/pages/dashboard/subpages/riwayatregistrasi/component/widget_isi_krs.dart';
import 'package:portal_akademik/pages/dashboard/subpages/riwayatregistrasi/component/widget_krs_disetujui.dart';
import 'package:portal_akademik/pages/dashboard/subpages/riwayatregistrasi/component/widget_revisi_krs.dart';
import '../../../../../model/model_user_mahasiswa_riwayat_registrasi.dart';
import '../../../../../util/color_pallete.dart';

class RiwayatRegistrasiListTile extends StatelessWidget {
  final RiwayatRegistrasi data;

  RiwayatRegistrasiListTile(this.data);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(width: 1, color: ColorPallete.primary),
        ),
        child: Column(
          children: [
            Row(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: 50,
                    decoration: BoxDecoration(
                      color: ColorPallete.primary,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20)),
                    ),
                    child: Center(
                      child: Text(
                        '${data.semesterNama}',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Registrasi'),
                      Container(
                        height: 20,
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        decoration: BoxDecoration(
                            color: ColorPallete.primary,
                            borderRadius: BorderRadius.circular(4.0)),
                        child: Text(
                          '${data.statusRegistrasi}',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 4,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Mengisi KRS'),
                      wIsiKrs(data.isIsiKrs),
                    ],
                  ),
                  SizedBox(
                    height: 4,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('KRS Disetujui Dosen'),
                      wKrsDiSetujui(data.isKrsDisetujui)
                    ],
                  ),
                  SizedBox(
                    height: 4,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Merevisi KRS'),
                      wRevisiKrs(data.isRevisiKrs)
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
