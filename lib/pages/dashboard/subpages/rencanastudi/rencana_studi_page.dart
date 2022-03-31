import 'package:flutter/material.dart';
import 'package:portal_akademik/states/state_user_mahasiswa_krs_header.dart';
import 'package:portal_akademik/widget/shimmer_widget.dart';
import 'package:provider/provider.dart';
import '../../../../util/color_pallete.dart';

class RencanaStudiPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    UserMahasiswaKrsHeaderState user =
        Provider.of<UserMahasiswaKrsHeaderState>(context, listen: true);

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
        title: Text('Rencana Studi',
            style: TextStyle(
                color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold),
            overflow: TextOverflow.ellipsis),
      ),
      body: SafeArea(
        child: RefreshIndicator(
          onRefresh: refresh,
          child: SingleChildScrollView(
            physics: AlwaysScrollableScrollPhysics(),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
              child: Container(
                width: double.infinity,
                padding: EdgeInsets.all(36.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(width: 1, color: ColorPallete.primary),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Semester',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold)),
                    user.isLoading
                        ? ShimmerWidget(height: 20, width: double.infinity)
                        : Text(
                            '${user.data?.semester}',
                            style: TextStyle(
                                overflow: TextOverflow.ellipsis,
                                fontSize: 12.0),
                          ),
                    SizedBox(
                      height: 6,
                    ),
                    Text('Dosen PA',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold)),
                    user.isLoading
                        ? ShimmerWidget(height: 20, width: double.infinity)
                        : Text(
                            '${user.data?.dosenAmpu}',
                            style: TextStyle(
                                overflow: TextOverflow.ellipsis,
                                fontSize: 12.0),
                          ),
                    SizedBox(
                      height: 6,
                    ),
                    Text('IPS / SKS Maksimal',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold)),
                    user.isLoading
                        ? ShimmerWidget(height: 20, width: double.infinity)
                        : Text(
                            '${user.data?.ips} / ${user.data?.sksMax}',
                            style: TextStyle(
                                overflow: TextOverflow.ellipsis,
                                fontSize: 12.0),
                          ),
                    SizedBox(
                      height: 6,
                    ),
                    Text('Komentar',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold)),
                    ...?user.data?.krs?.komentar
                        ?.map(
                          (e) => Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                height: 16,
                                child: Text(
                                  e.tanggal,
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 10),
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
                            ],
                          ),
                        )
                        .toList(),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
