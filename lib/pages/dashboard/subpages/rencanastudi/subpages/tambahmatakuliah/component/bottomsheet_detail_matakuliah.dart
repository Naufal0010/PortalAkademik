import 'package:flutter/material.dart';

import '../../../../../../../model/krs/model_user_mahasiswa_krs_paket_semester.dart';

class BottomSheetDetailMataKuliah extends StatelessWidget {
  final DataKrs data;
  final ScrollController controller;

  BottomSheetDetailMataKuliah({required this.data, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16.0),
      child: ListView(
        controller: controller,
        shrinkWrap: true,
        children: [
          Text(data.mk, style: TextStyle(fontSize: 20, fontWeight: FontWeight.w800),),
          Text('kelas ${data.kls}', style: TextStyle(fontSize: 12),),
          Text('Prodi ${data.prodi}', style: TextStyle(fontSize: 12),),
          Text('Mata kuliah ${data.w}', style: TextStyle(fontSize: 12),),
          SizedBox(height: 10,),
          Text('Semester', style: TextStyle(fontSize: 14, fontWeight: FontWeight.w800),),
          Text('Semester ${data.semester}', style: TextStyle(fontSize: 12),),
          SizedBox(height: 10,),
          Text('Dosen', style: TextStyle(fontSize: 14, fontWeight: FontWeight.w800),),
          Text(data.detail!.getDosenAmpu(), style: TextStyle(fontSize: 12)),
          Text('SKS', style: TextStyle(fontSize: 14, fontWeight: FontWeight.w800),),
          Text('${data.sksTotal} SKS', style: TextStyle(fontSize: 12),),
          SizedBox(height: 10,),
          Text('Prasyarat', style: TextStyle(fontSize: 14, fontWeight: FontWeight.w800),),
          data.detail!.mkPrasyarat!.length == 0 ? Text('-'):  Text(data.detail!.getMkPrasyarat(), style: TextStyle(fontSize: 12)),
          Text('Peserta', style: TextStyle(fontSize: 14, fontWeight: FontWeight.w800),),
          Text('${data.detail?.mkJumlahPeserta} Peserta', style: TextStyle(fontSize: 12),),
        ],
      ),
    );
  }
}
