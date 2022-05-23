import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../../states/jadwal/state_user_mahasiswa_jadwal_hari_ini.dart';
import '../../../util/color_pallete.dart';
import '../../presensi/presensi_detail_page.dart';
import 'jadwal_item_carousel.dart';

Widget ListCarouselJadwalHariIni(
    BuildContext context, UserMahasiswaJadwalHariIniState state) {
  int _currentIndex = 0;

  if (state.error != null) {
    Fluttertoast.showToast(
        msg: "${state.error!['content']}",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.grey,
        textColor: Colors.white,
        fontSize: 16.0);
  }

  if (state.data?.data?.length == 0) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 150,
      padding: EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        border: Border.all(width: 1, color: ColorPallete.primary),
        // color: Colors.amber,
      ),
      child: Center(
        child: Text(
          'Tidak ada jadwal mata kuliah hari ini',
          style: TextStyle(color: Colors.black),
        ),
      ),
    );
  }

  return CarouselSlider(
    items: state.data?.data!
        .map(
          (e) => JadwalItem(
            e,
            () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) =>
                      PresensiDetailPage(state.data!.data![_currentIndex])));
            },
          ),
        )
        .toList(),
    options: CarouselOptions(
      height: 150.0,
      enlargeCenterPage: true,
      autoPlay: false,
      aspectRatio: 16 / 9,
      autoPlayCurve: Curves.fastOutSlowIn,
      enableInfiniteScroll: false,
      viewportFraction: 0.8,
      onPageChanged: (index, _) {
        _currentIndex = index;
      },
    ),
  );
}
