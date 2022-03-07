import 'package:flutter/material.dart';
import 'package:portal_akademik/app.dart';
import 'package:portal_akademik/config/application.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Application.preferences = await SharedPreferences.getInstance();

  runApp(App());
}
