import 'package:flutter/material.dart';
import 'package:portal_akademik/pages/dashboard/subpages/kuesioner/subtabpages/evaluasidosen/evaluasi_dosen_tab_page.dart';
import 'package:portal_akademik/pages/dashboard/subpages/kuesioner/subtabpages/kuesionerpelayanan/kuesioner_pelayanan_tab_page.dart';
import 'package:portal_akademik/util/color_pallete.dart';

class KuesionerPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.white,
          elevation: 0,
          iconTheme: IconThemeData(color: Colors.black),
          title: Text('Kuesioner',
              style: TextStyle(
                  color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold),
              overflow: TextOverflow.ellipsis),
          bottom: TabBar(
            labelColor: Colors.black,
            indicatorColor: ColorPallete.primary,
            tabs: [
              Tab(text: 'Evaluasi Dosen'),
              Tab(text: 'Pelayanan')
            ],
          ),
        ),
        body: TabBarView(
          children: [
            EvaluasiDosenTabPage(),
            KuesionerPelayananTabPage()
          ],
        ),
      ),
    );
  }
}
