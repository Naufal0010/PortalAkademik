import 'package:flutter/material.dart';

class EmptyRencanaStudi extends StatelessWidget {
  final text;

  EmptyRencanaStudi({this.text});

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
                Text('Tidak ada data rencana studi'),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
