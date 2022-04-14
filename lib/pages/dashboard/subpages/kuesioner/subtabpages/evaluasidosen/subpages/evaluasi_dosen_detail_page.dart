import 'package:flutter/material.dart';
import 'package:portal_akademik/states/kuesioner/state_user_mahasiswa_data_detail_kuesioner.dart';

import '../../../../../../../model/kuesioner/model_user_mahasiswa_data_kelas_kuesioner.dart';
import '../../../../../../../states/state.dart';
import '../../../../../../../widget/shimmer_widget.dart';
import '../component/evaluasi_dosen_detail_list_tile.dart';

class EvaluasiDosenDetailPage extends StatelessWidget {
  final KelasMahasiswa data;

  EvaluasiDosenDetailPage(this.data);

  @override
  Widget build(BuildContext context) {
    UserMahasiswaDataDetailKuesionerState user =
        Provider.of<UserMahasiswaDataDetailKuesionerState>(context,
            listen: false);

    user.initData(data.klsId);

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
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Container(
          child: Consumer<UserMahasiswaDataDetailKuesionerState>(
            builder: (context, value, child) {
              return value.isLoading
                  ? ShimmerWidget(
                      height: 150,
                      width: double.infinity,
                    )
                  : ListView(
                      children: user.data!.kuesioner!
                          .map(
                            (e) => EvaluasiDosenDetailListTile(
                              dataKuesioner: e,
                              dosenKelas: user.data!.dosenKelas,
                            ),
                          )
                          .toList(),
                    );
            },
          ),
        ),
      ),
    );
  }
}
