import 'package:flutter/material.dart';

import '../../../../../../../model/kuesioner/model_user_mahasiswa_data_kelas_kuesioner.dart';

class EvaluasiDosenDetailPage extends StatelessWidget {
  final KelasMahasiswa data;

  EvaluasiDosenDetailPage(this.data);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.black),
        title: Text(data.mkkurNamaResmi,
            style: TextStyle(
                color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold),
            overflow: TextOverflow.ellipsis),
      ),
    );
  }
}
