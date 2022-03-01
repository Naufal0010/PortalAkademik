import 'package:flutter/material.dart';

class PresensiPage extends StatefulWidget {
  const PresensiPage({Key? key}) : super(key: key);

  @override
  _PresensiPageState createState() => _PresensiPageState();
}

class _PresensiPageState extends State<PresensiPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/images/no_data_transparent.png',
                  width: 200.0,
                  height: 200.0,
                ),
                Text('Belum Mengambil Mata Kuliah'),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
