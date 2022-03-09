import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/material.dart';
import 'package:portal_akademik/ui/hasil_studi_page.dart';
import 'package:portal_akademik/ui/presensi_page.dart';
import 'package:portal_akademik/ui/profile_page.dart';
import 'dashboard_page.dart';

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
                ),
            ),
          ),
        )).toList();

final List listOfPage = [
  DashboardPage(),
  HasilStudiPage(),
  PresensiPage(),
  ProfilePage()
];

class HomePage extends StatefulWidget {
  @override
  _HomePage createState() => _HomePage();
}

class _HomePage extends State<HomePage> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    // SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    //     statusBarColor: Colors.transparent,
    //     statusBarIconBrightness: Theme.of(context).brightness == Brightness.dark
    //         ? Brightness.light
    //         : Brightness.dark));
    return Scaffold(
      body: listOfPage[currentIndex],
      bottomNavigationBar: BottomNavyBar(
        curve: Curves.easeInOutCirc,
        backgroundColor: Colors.deepOrange,
        selectedIndex: currentIndex,
        onItemSelected: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        items: <BottomNavyBarItem>[
          BottomNavyBarItem(
              icon: Icon(Icons.home),
              title: Text('Home'),
              activeColor: Colors.white70,
              inactiveColor: Colors.white),
          BottomNavyBarItem(
              icon: const Icon(Icons.bar_chart),
              title: const Text('Hasil Studi'),
              activeColor: Colors.white70,
              inactiveColor: Colors.white),
          BottomNavyBarItem(
              icon: Icon(Icons.people_rounded),
              title: Text('Presensi'),
              activeColor: Colors.white70,
              inactiveColor: Colors.white),
          BottomNavyBarItem(
              icon: Icon(Icons.account_circle_rounded),
              title: Text('Profile'),
              activeColor: Colors.white70,
              inactiveColor: Colors.white),
        ],
      ),
    );
  }
}