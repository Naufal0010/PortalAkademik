import 'package:bottom_sheet/bottom_sheet.dart';
import 'package:floating_action_bubble/floating_action_bubble.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animated_dialog/flutter_animated_dialog.dart';
import 'package:portal_akademik/pages/dashboard/subpages/rencanastudi/subpages/tambahmatakuliah/tambah_mata_kuliah_page.dart';
import 'package:portal_akademik/states/krs/state_user_mahasiswa_krs.dart';
import 'package:portal_akademik/widget/shimmer_widget.dart';
import 'package:provider/provider.dart';

import '../../../../states/krs/state_user_mahasiswa_krs_header.dart';
import '../../../../util/color_pallete.dart';
import 'component/bottomsheet_krs_header.dart';
import 'component/list_krs_sudah_diambil.dart';

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

  Color isColorDisetujui(String? disetujui) {
    if (disetujui == "1") {
      return ColorPallete.greenPastel;
    }
    return ColorPallete.primary;
  }

  @override
  Widget build(BuildContext context) {
    UserMahasiswaKrsHeaderState? user =
        Provider.of<UserMahasiswaKrsHeaderState>(context, listen: true);

    UserMahasiswaKrsState userKrs =
        Provider.of<UserMahasiswaKrsState>(context, listen: true);

    Future<void> refresh() {
      user.refreshData();
      userKrs.refreshData();
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
                  Container(
                    width: MediaQuery.of(context).size.width,
                    child: Card(
                      shape: RoundedRectangleBorder(
                        side: BorderSide(color: ColorPallete.primary),
                        borderRadius: BorderRadius.all(Radius.circular(6)),
                      ),
                      child: InkWell(
                        onTap: () {
                          showFlexibleBottomSheet(
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.only(
                                      topRight: Radius.circular(10.0),
                                      topLeft: Radius.circular(10.0))),
                              isExpand: false,
                              initHeight: 0.7,
                              maxHeight: 0.7,
                              context: context,
                              bottomSheetColor: Colors.transparent,
                              builder: (context, controller, offset) {
                                return BottomSheetKrsHeader(
                                    data: user.data!, controller: controller);
                              });
                        },
                        splashColor: ColorPallete.primary,
                        borderRadius: BorderRadius.all(Radius.circular(6)),
                        child: Padding(
                          padding: EdgeInsets.all(16.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('Semester',
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold)),
                                  user.isLoading
                                      ? ShimmerWidget(height: 20, width: 100)
                                      : Text(
                                          '${user.data?.semester}',
                                          style: TextStyle(
                                              overflow: TextOverflow.ellipsis,
                                              fontSize: 12.0),
                                        ),
                                ],
                              ),
                              Spacer(),
                              Container(
                                padding: EdgeInsets.all(16.0),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(4.0),
                                  color: user.isLoading
                                      ? Colors.white
                                      : isColorDisetujui(
                                          user.data!.krs!.isSetujui),
                                ),
                                child: Center(
                                  child: user.isLoading
                                      ? ShimmerWidget(
                                          width: 80,
                                          height: 20,
                                        )
                                      : isDisetujui(user.data!.krs!.isSetujui),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Total SKS dipilih',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            userKrs.isLoading
                                ? ShimmerWidget(
                                    width: 60,
                                    height: 20,
                                  )
                                : Text(
                                    '${userKrs.data?.mkReguler!.krsTotalSks}',
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  userKrs.isLoading && user.isLoading
                      ? ShimmerWidget(
                          width: double.infinity,
                          height: 100,
                        )
                      : ListKrsSudahDiambil(context, user, userKrs),
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
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => TambahMataKuliahPage()));
              }),
          Bubble(
              icon: Icons.upload_sharp,
              iconColor: Colors.white,
              title: 'Ajukan',
              titleStyle: TextStyle(fontSize: 12, color: Colors.white),
              bubbleColor: ColorPallete.primary,
              onPress: () {
                _animationController.reverse();
                showAnimatedDialog(context: context, builder: (BuildContext context) {
                  return ClassicGeneralDialogWidget(
                    titleText: 'Ajukan Krs',
                    contentText: 'Anda yakin mengajukan KRS ini?',
                    negativeText: 'Tidak',
                    positiveText: 'Ya',
                    positiveTextStyle: TextStyle(color: ColorPallete.primary),
                    onPositiveClick: () {
                      Navigator.of(context).pop();
                    },
                    onNegativeClick: () {
                      Navigator.of(context).pop();
                    },
                  );
                });
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
