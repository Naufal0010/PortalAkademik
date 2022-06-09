import 'package:bottom_sheet/bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animated_dialog/flutter_animated_dialog.dart';
import 'package:portal_akademik/pages/dashboard/subpages/rencanastudi/subpages/tambahmatakuliah/tambah_mata_kuliah_page.dart';
import 'package:portal_akademik/states/krs/state_user_mahasiswa_krs.dart';
import 'package:portal_akademik/widget/shimmer_widget.dart';
import 'package:provider/provider.dart';
import 'package:simple_fontellico_progress_dialog/simple_fontico_loading.dart';

import '../../../../states/krs/state_user_mahasiswa_krs_header.dart';
import '../../../../util/color_pallete.dart';
import 'component/bottomsheet_krs_header.dart';
import 'component/list_krs_sudah_diambil.dart';

class RencanaStudiPage extends StatefulWidget {
  @override
  State<RencanaStudiPage> createState() => _RencanaStudiPageState();
}

class _RencanaStudiPageState extends State<RencanaStudiPage> {

  Widget stateKrs(String? disetujui, String? dikirim, String? direvisi) {
    if (disetujui == "1" && dikirim == "0" && direvisi == "0") {
      return Text(
        'Disetujui',
        style: TextStyle(color: Colors.white),
        textAlign: TextAlign.center,
      );
    } else if (disetujui == "0" && dikirim == "0" && direvisi == "1") {
      return Text(
        'Direvisi',
        style: TextStyle(color: Colors.white),
        textAlign: TextAlign.center,
      );
    } else if (disetujui == "0" && dikirim == "1" && direvisi == "0") {
      return Text(
        'Dikirim',
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

    SimpleFontelicoProgressDialog _dialog =
    SimpleFontelicoProgressDialog(context: context, barrierDimisable: true);

    Future<void> refresh() {
      user.refreshData();
      userKrs.refreshData();
      return user.refreshData();
    }

    void initDataAjukanKrs() async {
      _dialog.show(
          message: 'Loading...',
          type: SimpleFontelicoProgressDialogType.normal,
          indicatorColor: ColorPallete.primary);
      await Future.delayed(Duration(seconds: 1));
      userKrs.postDataAjukanKrs(context);
      _dialog.hide();
    }

    return Scaffold(
      appBar: AppBar(
        actions: [
          PopupMenuButton(
              // add icon, by default "3 dot" icon
              // icon: Icon(Icons.menu),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0)),
              itemBuilder: (context) {
                return [
                  PopupMenuItem<int>(
                    value: 0,
                    enabled: user.data!.krs!.isDikirim == "0" ? true : false,
                    child: Row(
                      children: [
                        Icon(Icons.add),
                        SizedBox(width: 4),
                        Text("Tambah"),
                      ],
                    ),
                  ),
                  PopupMenuItem<int>(
                    value: 1,
                    enabled: user.data!.krs!.isDikirim == "0" ? true : false,
                    child: Row(
                      children: [
                        Icon(Icons.upload_sharp),
                        SizedBox(width: 4),
                        Text("Ajukan"),
                      ],
                    ),
                  ),
                  PopupMenuItem<int>(
                    value: 2,
                    enabled: user.data!.krs!.isDikirim == "1" &&
                            user.data!.krs!.isDirevisi == "0"
                        ? true
                        : false,
                    child: Row(
                      children: [
                        Icon(Icons.send_sharp),
                        SizedBox(width: 4),
                        Text("Revisi"),
                      ],
                    ),
                  ),
                ];
              },
              onSelected: (value) {
                if (value == 0) {
                  userKrs.initDataPaketSemester();
                  Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => TambahMataKuliahPage()))
                      .then((value) => {refresh()});
                  print("Tambah KRS.");
                } else if (value == 1) {
                  showAnimatedDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return ClassicGeneralDialogWidget(
                          titleText: 'Ajukan Krs',
                          contentText: 'Anda yakin mengajukan KRS ini?',
                          negativeText: 'Tidak',
                          positiveText: 'Ya',
                          positiveTextStyle:
                              TextStyle(color: ColorPallete.primary),
                          onPositiveClick: () {
                            Navigator.of(context).pop();
                            initDataAjukanKrs();
                            refresh();
                          },
                          onNegativeClick: () {
                            Navigator.of(context).pop();
                          },
                        );
                      });
                  print("Ajukan KRS.");
                } else if (value == 2) {
                  userKrs.postDataRevisiKrs(context);
                  refresh();
                  print("Revisi KRS.");
                }
              }),
        ],
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
                                  color: user.isLoading || user.data == null
                                      ? Colors.white
                                      : isColorDisetujui(
                                          user.data!.krs!.isSetujui),
                                ),
                                child: Center(
                                  child: user.isLoading || user.data == null
                                      ? ShimmerWidget(
                                          width: 80,
                                          height: 20,
                                        )
                                      : stateKrs(
                                          user.data!.krs!.isSetujui,
                                          user.data!.krs!.isDikirim,
                                          user.data!.krs!.isDirevisi),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
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
    );
  }
}
