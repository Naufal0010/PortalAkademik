import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';

import '../../../../../model/krs/model_user_mahasiswa_krs.dart';

class BottomSheetDetailKrs extends StatelessWidget {
  final KrsListMk data;
  final ScrollController controller;

  BottomSheetDetailKrs({required this.data, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16.0),
      child: ListView(
        controller: controller,
        shrinkWrap: true,
        children: [
          Text(data.mkNama, style: TextStyle(fontSize: 20, fontWeight: FontWeight.w800),),
          Text('${data.kurNama}', style: TextStyle(fontSize: 12),),
          Text('Mata kuliah ${data.klsNama}', style: TextStyle(fontSize: 12),),
          SizedBox(height: 10,),
          Text('Semester', style: TextStyle(fontSize: 14, fontWeight: FontWeight.w800),),
          Text('Semester ${data.klsSemester}', style: TextStyle(fontSize: 12),),
          SizedBox(height: 10,),
          Text('Dosen', style: TextStyle(fontSize: 14, fontWeight: FontWeight.w800),),
          Text(data.detail!.getDosenAmpu(), style: TextStyle(fontSize: 12)),
          Text('Jadwal', style: TextStyle(fontSize: 14, fontWeight: FontWeight.w800),),
          data.jadwal.isEmpty ? Text('-') : Html(
            data: """
                ${data.jadwal.toString()}
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
          SizedBox(height: 10,),
          Text('SKS', style: TextStyle(fontSize: 14, fontWeight: FontWeight.w800),),
          Text('${data.mkSksTotal} SKS', style: TextStyle(fontSize: 12),),
        ],
      ),
    );
  }
}
