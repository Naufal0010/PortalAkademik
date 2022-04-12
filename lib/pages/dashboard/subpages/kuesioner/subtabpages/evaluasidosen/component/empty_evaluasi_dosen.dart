import 'package:flutter/material.dart';

class EmptyEvaluasiDosen extends StatelessWidget {
  final text;

  EmptyEvaluasiDosen({this.text});

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
                Text('Anda belum bisa mengisi kuesioner'),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
