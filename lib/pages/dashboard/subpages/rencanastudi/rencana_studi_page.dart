import 'package:floating_action_bubble/floating_action_bubble.dart';
import 'package:flutter/material.dart';
import 'package:portal_akademik/pages/dashboard/subpages/rencanastudi/subpages/tambahmatakuliah/tambah_mata_kuliah_page.dart';
import 'package:portal_akademik/states/krs/state_user_mahasiswa_krs.dart';
import 'package:portal_akademik/widget/shimmer_widget.dart';
import 'package:provider/provider.dart';

import '../../../../states/krs/state_user_mahasiswa_krs_header.dart';
import '../../../../util/color_pallete.dart';

class RencanaStudiPage extends StatefulWidget {
  @override
  State<RencanaStudiPage> createState() => _RencanaStudiPageState();
}

class _RencanaStudiPageState extends State<RencanaStudiPage>
    with SingleTickerProviderStateMixin {
  late Animation<double> _animation;
  late AnimationController _animationController;

  @override
  void initState() {
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 260),
    );

    final curvedAnimation =
        CurvedAnimation(curve: Curves.easeInOut, parent: _animationController);
    _animation = Tween<double>(begin: 0, end: 1).animate(curvedAnimation);

    super.initState();
  }

  Widget isDisetujui(String? disetujui) {
    if (disetujui == "1") {
      return Text(
        'Disetujui',
        style: TextStyle(color: Colors.white),
        textAlign: TextAlign.center,
      );
    }
    return Text(
      'Belum Disetujui',
      style: TextStyle(color: Colors.white),
      textAlign: TextAlign.center,
    );
  }

  @override
  Widget build(BuildContext context) {
    UserMahasiswaKrsHeaderState user =
        Provider.of<UserMahasiswaKrsHeaderState>(context, listen: true);

    UserMahasiswaKrsState userKrs =
    Provider.of<UserMahasiswaKrsState>(context, listen: true);

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
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Stack(
                    children: [
                      Container(
                        width: double.infinity,
                        padding: EdgeInsets.all(36.0),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(4.0),
                          border:
                              Border.all(width: 1, color: ColorPallete.primary),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Semester',
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.bold)),
                            user.isLoading
                                ? ShimmerWidget(
                                    height: 20, width: double.infinity)
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
                                ? ShimmerWidget(
                                    height: 20, width: double.infinity)
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
                                ? ShimmerWidget(
                                    height: 20, width: double.infinity)
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        height: 16,
                                        child: Text(
                                          e.tanggal,
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 10),
                                        ),
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 10),
                                        decoration: BoxDecoration(
                                            color: ColorPallete.primary,
                                            borderRadius:
                                                BorderRadius.circular(10.0)),
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
                      Positioned(
                        top: 0,
                        right: 0,
                        child: Container(
                          decoration: BoxDecoration(
                            color: ColorPallete.primary,
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(20),
                            ),
                          ),
                          width: 120,
                          height: 32,
                          child: Center(
                            child: user.isLoading
                                ? ShimmerWidget(
                                    width: 80,
                                    height: 20,
                                  )
                                : isDisetujui(user.data!.krs!.isSetujui),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  // userKrs.isLoading
                  //     ? ShimmerWidget(
                  //         width: double.infinity,
                  //         height: 100,
                  //       )
                  //     : KrsListSudahAmbil(
                  //         list: userKrs.data!.mkReguler!.krsListMk),
                  // Container(
                  //   padding: EdgeInsets.all(10.0),
                  //   // decoration: BoxDecoration(
                  //   //   borderRadius: BorderRadius.circular(10.0),
                  //   //   border: Border.all(
                  //   //       width: 1, color: ColorPallete.primary),
                  //   //   // color: Colors.amber,
                  //   // ),
                  //   child: Column(
                  //     crossAxisAlignment: CrossAxisAlignment.start,
                  //     children: [
                  //       Row(
                  //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //         children: [
                  //           Text(
                  //             'Total SKS',
                  //             style: TextStyle(
                  //               fontSize: 16,
                  //               fontWeight: FontWeight.bold,
                  //             ),
                  //           ),
                  //           userKrs.isLoading
                  //               ? ShimmerWidget(
                  //                   width: 60,
                  //                   height: 20,
                  //                 )
                  //               : Text(
                  //                   '${userKrs.data?.mkReguler!.krsTotalSks}',
                  //                   style: TextStyle(
                  //                     fontSize: 16,
                  //                     fontWeight: FontWeight.bold,
                  //                   ),
                  //                 ),
                  //         ],
                  //       ),
                  //     ],
                  //   ),
                  // )
                ],
              ),
            ),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: FloatingActionBubble(
        items: [
          Bubble(
              icon: Icons.add,
              iconColor: Colors.white,
              title: 'Tambah',
              titleStyle: TextStyle(fontSize: 12, color: Colors.white),
              bubbleColor: ColorPallete.primary,
              onPress: () {
                _animationController.reverse();
                userKrs.initDataPaketSemester();
                Navigator.push(context, MaterialPageRoute(builder: (context) =>
                    TambahMataKuliahPage()));
              }),
          Bubble(
              icon: Icons.upload_sharp,
              iconColor: Colors.white,
              title: 'Ajukan',
              titleStyle: TextStyle(fontSize: 12, color: Colors.white),
              bubbleColor: ColorPallete.primary,
              onPress: () {
                _animationController.reverse();
              })
        ],
        animation: _animation,
        onPress: () => _animationController.isCompleted
                        ? _animationController.reverse()
                        : _animationController.forward(),
        iconColor: Colors.white,
        iconData: Icons.add,
        backGroundColor: ColorPallete.primary,
      ),
    );
  }
}
