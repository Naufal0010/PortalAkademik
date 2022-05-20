import 'package:flutter/material.dart';
import 'package:portal_akademik/pages/presensi/component/shimmer_list_detail_tile.dart';

import '../../../../../../states/kuesioner/state_user_mahasiswa_data_pelayanan.dart';
import '../../../../../../states/state.dart';
import 'component/list_kuesioner_pelayanan.dart';

class KuesionerPelayananTabPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    UserMahasiswaDataPelayananState user =
        Provider.of<UserMahasiswaDataPelayananState>(context, listen: false);

    Future<void> refresh() {
      user.refreshData();
      return user.refreshData();
    }

    return RefreshIndicator(
      onRefresh: refresh,
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Container(
            child: Column(
              children: [
                Consumer<UserMahasiswaDataPelayananState>(
                  builder: (context, value, child) {
                    return value.isLoading
                        ? ShimmerListDetailTile()
                        : ListKuesionerPelayananan(context, user);
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
