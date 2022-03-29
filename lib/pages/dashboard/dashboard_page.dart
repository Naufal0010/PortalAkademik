import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:portal_akademik/pages/dashboard/subpages/rencanastudi/rencana_studi_page.dart';
import 'package:portal_akademik/states/state.dart';
import 'package:portal_akademik/widget/error_handling_widget.dart';
import 'package:portal_akademik/widget/icon_button_widget.dart';
import 'package:portal_akademik/widget/jadwal_item_widget.dart';
import 'package:portal_akademik/widget/label_sub_header_widget.dart';
import 'package:portal_akademik/widget/shimmer_widget.dart';

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
    UserMahasiswaState userMahasiswa =
        Provider.of<UserMahasiswaState>(context, listen: true);

    Future<void> refresh() {
      userMahasiswa.refreshData();
      return userMahasiswa.refreshData();
    }

    return SafeArea(
      child: RefreshIndicator(
        onRefresh: refresh,
        child: SingleChildScrollView(
          physics: AlwaysScrollableScrollPhysics(),
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
                            userMahasiswa.isLoading
                                ? ShimmerWidget(
                                    height: 25,
                                  )
                                : getErrorName(context, userMahasiswa),
                            userMahasiswa.isLoading
                                ? ShimmerWidget(
                                    height: 15,
                                  )
                                : getErrorNim(context, userMahasiswa),
                          ],
                        ),
                      ),
                      SizedBox(
                        width: 30,
                      ),
                      userMahasiswa.isLoading
                          ? ShimmerWidget(
                              borderRadius: BorderRadius.circular(30.0),
                              height: 50,
                              width: 50,
                            )
                          : getErrorPhoto(context, userMahasiswa)
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
                        IconButtonCustom(
                            nameLabel: 'Rencana',
                            iconLabel: Icons.school,
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          RencanaStudiPage()));
                            }),
                        IconButtonCustom(
                            nameLabel: 'Rekap ',
                            iconLabel: Icons.insert_chart,
                            onTap: () {}),
                        IconButtonCustom(
                            nameLabel: 'Riwayat',
                            iconLabel: Icons.assignment,
                            onTap: () {}),
                        IconButtonCustom(
                            nameLabel: 'Kalender',
                            iconLabel: Icons.calendar_today,
                            onTap: () {})
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButtonCustom(
                            nameLabel: 'Jadwal',
                            iconLabel: Icons.schedule,
                            onTap: () {}),
                        IconButtonCustom(
                            nameLabel: 'Perkuliahan ',
                            iconLabel: Icons.class_,
                            onTap: () {}),
                        IconButtonCustom(
                            nameLabel: 'Ujian Akhir',
                            iconLabel: Icons.task,
                            onTap: () {}),
                        IconButtonCustom(
                            nameLabel: 'Kuesioner',
                            iconLabel: Icons.star,
                            onTap: () {})
                      ],
                    ),
                  ],
                ),
              ),
              LabelSubHeader('Jadwal Hari Ini', 20),
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
              LabelSubHeader('Informasi', 20),
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
}
