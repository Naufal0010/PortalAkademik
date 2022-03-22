import 'package:flutter/material.dart';
import 'package:portal_akademik/pages/presensi/component/shimmer_list_tile.dart';
import 'package:portal_akademik/states/state_user_mahasiswa_jadwal_matakuliah.dart';
import 'package:portal_akademik/widget/error_handling_widget.dart';
import 'package:portal_akademik/widget/label_sub_header_widget.dart';
import 'package:provider/provider.dart';

List<Color> colors = [
  Color(0xFFF99898),
  Color(0xFFA6E4FF),
  Color(0xFF98F9AD),
  Color(0xFFEDA6FF)
];

class PresensiPage extends StatefulWidget {
  const PresensiPage({Key? key}) : super(key: key);

  @override
  _PresensiPageState createState() => _PresensiPageState();
}

class _PresensiPageState extends State<PresensiPage> {

  @override
  Widget build(BuildContext context) {

    UserMahasiswaJadwalMataKuliahState userMahasiswa =
    Provider.of<UserMahasiswaJadwalMataKuliahState>(context, listen: true);

    Future<void> refresh() {
      userMahasiswa.refreshData();
      return userMahasiswa.refreshData();
    }

    return SafeArea(
      child: RefreshIndicator(
        onRefresh: refresh,
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Scaffold(
            body: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                LabelSubHeader('Presensi', 24),
                SizedBox(
                  height: 16.0,
                ),
                userMahasiswa.isLoading
                    ? ShimmerListTile()
                    : getErrorListPresensi(context, userMahasiswa),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
