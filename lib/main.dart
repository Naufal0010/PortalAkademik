import 'package:flutter/material.dart';
import 'package:portal_akademik/ui/login.dart';

void main() {
  runApp(MaterialApp(
    home: Login(),
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
