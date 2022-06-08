import 'package:flutter/material.dart';

import '../../../../../model/krs/model_user_mahasiswa_krs_header.dart';
import '../../../../../util/color_pallete.dart';

class BottomSheetKrsHeader extends StatelessWidget {
  final ScrollController controller;
  final UserMhsHeaderKrs data;

  BottomSheetKrsHeader({required this.controller, required this.data});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16.0),
      child: ListView(
        controller: controller,
        shrinkWrap: true,
        children: [
          Text('Semester',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          Text('${data.semester}'),
          SizedBox(
            height: 10,
          ),
          Text('Dosen PA',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          Text(data.dosenAmpu),
          SizedBox(
            height: 10,
          ),
          Text('Indeks Prestasi Semester',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          Text(data.ips),
          SizedBox(
            height: 10,
          ),
          Text('SKS Maksimal',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          Text('${data.sksMax} SKS'),
          SizedBox(
            height: 10,
          ),
          Text('Komentar',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          ...?data.krs?.komentar
              ?.map(
                (e) => Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 16,
                      child: Text(
                        e.tanggal,
                        style: TextStyle(color: Colors.white, fontSize: 10),
                      ),
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      decoration: BoxDecoration(
                          color: ColorPallete.primary,
                          borderRadius: BorderRadius.circular(10.0)),
                    ),
                    Text(
                      e.teks,
                      style: TextStyle(fontSize: 12.0),
                    ),
                    SizedBox(height: 8,)
                  ],
                ),
              )
              .toList(),
        ],
      ),
    );
  }
}
