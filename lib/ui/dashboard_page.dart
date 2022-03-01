import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:portal_akademik/util/button_grid.dart';

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

  @override
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  int _currentIndexSlider = 0;
  final CarouselController _controller = CarouselController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.only(top: 16.0, left: 16.0, right: 16.0, bottom: 16.0),
          child: Column(
            children: [
              CarouselSlider(
                items: imageSliders,
                carouselController: _controller,
                options: CarouselOptions(
                    autoPlay: true,
                    enlargeCenterPage: true,
                    aspectRatio: 2.0,
                    onPageChanged: (index, reason) {
                      setState(() {
                        _currentIndexSlider = index;
                      });
                    }),
              ),
              Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: imgList.asMap().entries.map((entry) {
                    return GestureDetector(
                      onTap: () => _controller.animateToPage(entry.key),
                      child: Container(
                        width: 12.0,
                        height: 12.0,
                        margin:
                        EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: (Theme.of(context).brightness == Brightness.dark
                              ? Colors.white
                              : Colors.black)
                              .withOpacity(
                              _currentIndexSlider == entry.key ? 0.9 : 0.4),
                        ),
                      ),
                    );
                  }).toList()),
              SizedBox(
                height: 16,
              ),
              Expanded(
                  child: ListView(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            'Akademik',
                            style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 16.0,
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Expanded(
                            child: GridView(
                              physics: NeverScrollableScrollPhysics(),
                              padding: EdgeInsets.only(bottom: 16.0),
                              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 3,
                                  crossAxisSpacing: 10,
                                  mainAxisSpacing: 10,
                                  childAspectRatio: 1
                              ),
                              shrinkWrap: true,
                              primary: true,
                              children: [
                                ButtonGrid(buttonName: 'Rencana Studi', icon: Icons.school),
                                ButtonGrid(buttonName: 'Hasil Studi', icon: Icons.insert_chart),
                                ButtonGrid(buttonName: 'Rekap Hasil Studi', icon: Icons.assignment),
                                ButtonGrid(buttonName: 'Riwayat Registrasi', icon: Icons.access_time),
                              ],
                            ),
                          )
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            'Jadwal',
                            style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 16.0,
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Expanded(
                            child: GridView(
                              physics: NeverScrollableScrollPhysics(),
                              padding: EdgeInsets.only(bottom: 16.0),
                              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 3,
                                  crossAxisSpacing: 10,
                                  mainAxisSpacing: 10,
                                  childAspectRatio: 1
                              ),
                              shrinkWrap: true,
                              primary: true,
                              children: [
                                ButtonGrid(buttonName: 'Kalender Akademik', icon: Icons.school),
                                ButtonGrid(buttonName: 'Jadwal Penting', icon: Icons.trending_up),
                                ButtonGrid(buttonName: 'Perkuliahan', icon: Icons.assignment),
                                ButtonGrid(buttonName: 'Ujian Akhir', icon: Icons.access_time),
                              ],
                            ),
                          )
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            'Kuesioner',
                            style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 16.0,
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Expanded(
                            child: GridView(
                              physics: NeverScrollableScrollPhysics(),
                              padding: EdgeInsets.only(bottom: 16.0),
                              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 3,
                                  crossAxisSpacing: 10,
                                  mainAxisSpacing: 10,
                                  childAspectRatio: 1
                              ),
                              shrinkWrap: true,
                              primary: true,
                              children: [
                                ButtonGrid(buttonName: 'Evaluasi Dosen', icon: Icons.help_outline),
                                ButtonGrid(buttonName: 'Pelayanan', icon: Icons.trending_up),
                              ],
                            ),
                          )
                        ],
                      ),
                    ],
                  )
              )
            ],
          ),
        ),
      ),
    );
  }
}
