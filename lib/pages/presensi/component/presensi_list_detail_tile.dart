import 'package:flutter/material.dart';
import 'package:portal_akademik/model/model_user_mahasiswa_list_mk_presensi.dart';
import 'package:portal_akademik/util/color_pallete.dart';

class PresensiListDetailTile extends StatelessWidget {
  final DataPresensi data;

  PresensiListDetailTile({required this.data});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        margin: EdgeInsets.symmetric(vertical: 6),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(width: 1, color: ColorPallete.primary),
          // color: Colors.amber,
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
                        Text(
                          data.tglPertemuan,
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 14),
                        ),
                        Text(
                          data.dosenAmpu,
                          style: TextStyle(fontSize: 12),
                        ),
                        SizedBox(height: 8),
                        SizedBox(
                          width: 220,
                          child: Text(
                            data.jenisPresensi,
                            style: TextStyle(fontSize: 12),
                          ),
                        ),
                        SizedBox(height: 8),
                        SizedBox(
                          width: 220,
                          child: Text(
                            data.pokokBahasan,
                            style: TextStyle(fontSize: 12),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Spacer(),
                  Container(
                    decoration: BoxDecoration(
                        color: ColorPallete.greenPastel,
                        borderRadius: BorderRadius.only(
                            topRight: Radius.circular(20),
                            bottomRight: Radius.circular(20))),
                    width: 80,
                    height: 200,
                    child: Center(
                      child: Text('Hadir', style: TextStyle(color: Colors.white), ),
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
                width: 48,
                height: 32,
                child: Center(
                  child: Text(
                    data.noPertemuan,
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
