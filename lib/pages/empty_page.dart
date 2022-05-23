import 'package:flutter/material.dart';

class EmptyPage extends StatelessWidget {
  final String text;

  EmptyPage({required this.text});

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
                Text('Belum Mengambil $text'),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
