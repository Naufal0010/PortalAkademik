import 'package:flutter/material.dart';
import 'package:portal_akademik/pages/dashboard/subpages/kuesioner/subtabpages/evaluasidosen/subpages/component/list_kritik_saran_evaluasi_dosen.dart';
import 'package:portal_akademik/pages/dashboard/subpages/kuesioner/subtabpages/evaluasidosen/subpages/component/shimmer_list.dart';
import 'package:portal_akademik/states/kuesioner/state_user_mahasiswa_data_detail_kuesioner.dart';

import '../../../../../../../model/kuesioner/model_user_mahasiswa_data_kelas_kuesioner.dart';
import '../../../../../../../states/state.dart';
import '../../../../../../../widget/shimmer_widget.dart';
import 'component/list_evaluasi_dosen_detail.dart';

class EvaluasiDosenDetailPage extends StatelessWidget {
  final KelasMahasiswa data;

  EvaluasiDosenDetailPage(this.data);

  @override
  Widget build(BuildContext context) {
    UserMahasiswaDataDetailKuesionerState user =
        Provider.of<UserMahasiswaDataDetailKuesionerState>(context,
            listen: false);

    user.initData(data.klsId);

    Future<void> refresh() {
      user.refreshData();
      return user.refreshData();
    }

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
      body: RefreshIndicator(
        onRefresh: refresh,
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(16.0),
            child: Container(
                child: Column(
              children: [
                Consumer<UserMahasiswaDataDetailKuesionerState>(
                  builder: (context, value, child) {
                    return value.isLoading
                        ? ShimmerList()
                        : ListEvaluasiDosenDetail(context, user);
                  },
                ),
                Consumer<UserMahasiswaDataDetailKuesionerState>(
                  builder: (context, value, child) {
                    return value.isLoading
                        ? ShimmerWidget(
                            height: 150,
                            width: double.infinity,
                          )
                        : ListKritikSaranEvaluasiDosen(context, user);
                  },
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () {},
                    child: Text('Simpan', style: TextStyle(fontSize: 16),),
                    style: ElevatedButton.styleFrom(
                      primary: Colors.deepPurpleAccent,
                      onPrimary: Colors.white
                    ),
                  ),
                ),
              ],
            )),
          ),
        ),
      ),
    );
  }
}
