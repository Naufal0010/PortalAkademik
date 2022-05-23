import 'package:flutter/material.dart';
import 'package:portal_akademik/pages/presensi/component/shimmer_list_tile.dart';

import '../../../../../../states/kuesioner/state_user_mahasiswa_data_kelas_kuesioner.dart';
import '../../../../../../states/state.dart';
import 'component/list_kuesioner_evaluasi_dosen.dart';

class EvaluasiDosenTabPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    UserMahasiswaDataKelasKuesionerState user =
        Provider.of<UserMahasiswaDataKelasKuesionerState>(context,
            listen: true);

    Future<void> refresh() {
      user.refreshData();
      return user.refreshData();
    }

    return RefreshIndicator(
      onRefresh: refresh,
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Container(
          child: user.isLoading
              ? ShimmerListTile()
              : getListKuesionerEvaluasiDosen(context, user),
        ),
      ),
    );
  }
}
