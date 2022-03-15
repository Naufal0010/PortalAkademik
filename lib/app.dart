import 'package:flutter/material.dart';
import 'package:portal_akademik/states/state.dart';
import 'package:portal_akademik/states/state_user_mahasiswa_khs_semester.dart';
import 'package:portal_akademik/ui/home_page.dart';
import 'package:portal_akademik/ui/login.dart';

class App extends StatelessWidget {
  App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthState()),
        ChangeNotifierProvider(create: (_) => UserMahasiswaState()),
        ChangeNotifierProvider(create: (_) => UserMahasiswaKhsSemesterState()),
      ],
      child: GestureDetector(
        onTap: () {
          FocusScope.of(context).requestFocus(FocusNode());
        },
        child: MaterialApp(
          home: WillPopScope(
            child: Consumer<AuthState>(
              builder: (context, percentDone, child) {
                return context.watch<AuthState>().isLogged
                    ? HomePage()
                    : Login();
              },
            ),
            onWillPop: onWillPop,
          ),
        ),
      ),
    );
  }

  DateTime? currentBackPressTime;

  Future<bool> onWillPop() {
    DateTime now = DateTime.now();
    if (currentBackPressTime == null ||
        now.difference(currentBackPressTime!) > const Duration(seconds: 2)) {
      currentBackPressTime = now;
      return Future.value(false);
    }
    return Future.value(true);
  }
}
