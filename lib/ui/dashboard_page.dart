import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:portal_akademik/states/state.dart';
import 'package:portal_akademik/states/state_user_mahasiswa_photo.dart';
import 'package:portal_akademik/util/icon_button.dart';
import 'package:portal_akademik/util/jadwal_item.dart';
import 'package:portal_akademik/util/label_sub_header.dart';
import 'package:portal_akademik/widget/shimmer_widget.dart';
import 'package:fluttertoast/fluttertoast.dart';

final List<String> imgList = [
  'assets/images/berakhlak.png',
  'assets/images/msib.png',
  'assets/images/permata.png'
];

final List<Widget> imageSliders = imgList
    .map((item) => Container(
  child: Container(
    margin: EdgeInsets.all(5.0),
    child: ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(5.0)),
        child: Stack(
          children: <Widget>[
            Image.asset(item, fit: BoxFit.cover, width: 1000.0),
            Positioned(
              bottom: 0.0,
              left: 0.0,
              right: 0.0,
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Color.fromARGB(200, 0, 0, 0),
                      Color.fromARGB(0, 0, 0, 0)
                    ],
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                  ),
                ),
                padding: EdgeInsets.symmetric(
                    vertical: 10.0, horizontal: 20.0),
              ),
            ),
          ],
        )),
  ),
))
    .toList();

class DashboardPage extends StatefulWidget {
  const DashboardPage({Key? key}) : super(key: key);

  @override
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  int _currentIndexSlider = 0;
  bool isLoading = false;

  final CarouselController _controller = CarouselController();

  @override
  Widget build(BuildContext context) {

    UserMahasiswaState userMahasiswa = Provider.of<UserMahasiswaState>(context, listen: true);
    UserMahasiswaPhotoState userMahasiswaPhoto = Provider.of<UserMahasiswaPhotoState>(context, listen: true);

    Future<void> refresh() {
      userMahasiswa.refreshData();
      return userMahasiswaPhoto.refreshData();
    }

    return SafeArea(
      child: RefreshIndicator(
        onRefresh: refresh,
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 80.0,
                padding: EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  color: Color(0xFFFF9F43),
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
                child: Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Flexible(
                        flex: 1,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            userMahasiswa.isLoading ? ShimmerWidget(height: 25,) :
                            getErrorName(context, userMahasiswa),
                            userMahasiswa.isLoading ? ShimmerWidget(height: 15,) :
                            getErrorNim(context, userMahasiswa),
                          ],
                        ),
                      ),
                      SizedBox(width: 30,),
                      userMahasiswaPhoto.isLoading ? ShimmerWidget(borderRadius: BorderRadius.circular(30.0), height: 50, width: 50,) :
                      getErrorPhoto(context, userMahasiswaPhoto)
                    ],
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.only(top: 24, bottom: 10),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButtonCustom('Rencana', Icons.school),
                        IconButtonCustom('Rekap ', Icons.insert_chart),
                        IconButtonCustom('Riwayat', Icons.assignment),
                        IconButtonCustom('Kalender', Icons.calendar_today)
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButtonCustom('Jadwal', Icons.schedule),
                        IconButtonCustom('Perkuliahan ', Icons.class_),
                        IconButtonCustom('Ujian', Icons.task),
                        IconButtonCustom('Kuesioner', Icons.star)
                      ],
                    ),
                  ],
                ),
              ),
              LabelSubHeader('Jadwal Hari Ini'),
              Container(
                child: SizedBox(
                  height: 150,
                  child: ListView(
                    children: [
                      CarouselSlider(
                        items: [
                          JadwalItem(
                              'JFH63',
                              'Manajemen Proyek',
                              'Ruang Kuliah II.3.1',
                              'Mohammad Reza Faisal',
                              'Rudy Herteno',
                              '08:00'),
                          JadwalItem(
                              'JFH63',
                              'Manajemen Proyek',
                              'Ruang Kuliah II.3.1',
                              'Mohammad Reza Faisal',
                              'Rudy Herteno',
                              '08:00'),
                          JadwalItem(
                              'JFH63',
                              'Manajemen Proyek',
                              'Ruang Kuliah II.3.1',
                              'Mohammad Reza Faisal',
                              'Rudy Herteno',
                              '08:00'),
                        ],
                        options: CarouselOptions(
                          height: 150.0,
                          enlargeCenterPage: true,
                          autoPlay: false,
                          aspectRatio: 16 / 9,
                          autoPlayCurve: Curves.fastOutSlowIn,
                          enableInfiniteScroll: false,
                          autoPlayAnimationDuration:
                          const Duration(milliseconds: 800),
                          viewportFraction: 0.8,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              LabelSubHeader('Informasi'),
              Container(
                child: Column(
                  children: [
                    CarouselSlider(
                      items: imageSliders,
                      carouselController: _controller,
                      options: CarouselOptions(
                          autoPlay: false,
                          enlargeCenterPage: true,
                          aspectRatio: 2.0,
                          onPageChanged: (index, reason) {
                            setState(() {
                              _currentIndexSlider = index;
                            });
                          }),
                    )
                  ],
                ),
              )

            ],
          ),
        ),
      ),
    );
  }

  Widget getErrorName(BuildContext context, UserMahasiswaState state) {
    if (state.error != null) {
      Fluttertoast.showToast(
          msg: "${state.error!['content']}",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0
      );

      return Text('Loading');
    }

    return Text(
      '${state.data!.nama!.value}',
      overflow: TextOverflow.ellipsis,
      maxLines: 1,
      style: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
    );
  }

  Widget getErrorNim(BuildContext context, UserMahasiswaState state) {
    if (state.error != null) {
      Fluttertoast.showToast(
          msg: "${state.error!['content']}",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0
      );

      return Text('Loading');
    }

    return Text(
      '${state.data!.nim!.value}',
      overflow: TextOverflow.ellipsis,
      maxLines: 1,
      style: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
    );
  }
}

Widget getErrorPhoto(BuildContext context, UserMahasiswaPhotoState state) {
  if (state.error != null) {
    Fluttertoast.showToast(
        msg: "${state.error!['content']}",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0
    );

    return CircleAvatar(
      radius: 30,
      backgroundColor: Colors.grey,
    );
  }

  return CircleAvatar(
    radius: 30,
    backgroundImage: NetworkImage('https://portal.ulm.ac.id/uploads/${state.data!.foto}'),
  );
}