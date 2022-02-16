import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: MyApp(),
    )
  );
}

class MyApp extends StatefulWidget {
  _MyAppState createState() => new _MyAppState();
}

class _MyAppState extends State<MyApp>  {

  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const <Widget>[
            Text('Hello World')
          ],
        ),
      ),
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
            inactiveColor: Colors.white
          ),
          BottomNavyBarItem(
              icon: Icon(Icons.people_rounded),
              title: Text('Presensi'),
              activeColor: Colors.white70,
              inactiveColor: Colors.white
          ),
          BottomNavyBarItem(
              icon: Icon(Icons.account_circle_rounded),
              title: Text('Profile'),
              activeColor: Colors.white70,
              inactiveColor: Colors.white
          ),
        ],
      ),
    );
  }
}