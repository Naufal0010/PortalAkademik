import 'package:flutter/material.dart';
import 'package:portal_akademik/states/state_auth.dart';
import 'package:portal_akademik/util/color_pallete.dart';
import 'package:provider/provider.dart';
import 'package:simple_fontellico_progress_dialog/simple_fontico_loading.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool _isObscure = true;
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void dispose() {
    usernameController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    AuthState authState = Provider.of<AuthState>(context, listen: true);

    SimpleFontelicoProgressDialog _dialog =
        SimpleFontelicoProgressDialog(context: context, barrierDimisable: true);

    void login() async {
      _dialog.show(
          message: 'Loading...',
          type: SimpleFontelicoProgressDialogType.normal,
          indicatorColor: ColorPallete.primary);
      await Future.delayed(Duration(seconds: 1));
      authState.auth(usernameController.text, passwordController.text);
      _dialog.hide();
    }

    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            constraints: BoxConstraints(
              maxHeight: MediaQuery.of(context).size.height,
              maxWidth: MediaQuery.of(context).size.width,
            ),
            decoration: BoxDecoration(
              color: Colors.white,
            ),
            child: Column(
              children: [
                Expanded(
                  flex: 0,
                  child: Column(
                    children: [Image.asset('assets/images/login_image.png')],
                  ),
                ),
                Expanded(
                  flex: 5,
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Color(0xFFF5F5F5),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(10),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Container(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Selamat Datang',
                              style: TextStyle(
                                  fontSize: 24.0, fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              height: 50.0,
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                TextField(
                                  controller: usernameController,
                                  keyboardType: TextInputType.number,
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(8.0),
                                      borderSide: BorderSide.none,
                                    ),
                                    filled: true,
                                    fillColor: Color(0xFFFFFFFF),
                                    hintText: 'Username',
                                  ),
                                ),
                                SizedBox(
                                  height: 16.0,
                                ),
                                TextField(
                                  controller: passwordController,
                                  keyboardType: TextInputType.text,
                                  obscureText: _isObscure,
                                  decoration: InputDecoration(
                                      border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                        borderSide: BorderSide.none,
                                      ),
                                      filled: true,
                                      fillColor: Color(0xFFFFFFFF),
                                      hintText: 'Password',
                                      suffixIcon: IconButton(
                                        icon: Icon(
                                          _isObscure
                                              ? Icons.visibility_off
                                              : Icons.visibility,
                                        ),
                                        onPressed: () {
                                          setState(() {
                                            _isObscure = !_isObscure;
                                          });
                                        },
                                      )),
                                ),
                                SizedBox(
                                  height: 50.0,
                                ),
                              ],
                            ),
                            Container(
                              width: double.infinity,
                              child: ElevatedButton(
                                child: Text(
                                  'Masuk',
                                  style: TextStyle(fontSize: 20),
                                ),
                                onPressed: () {
                                  login();
                                },
                                style: ElevatedButton.styleFrom(
                                    fixedSize: Size(330, 50),
                                    primary: ColorPallete.primary,
                                    onPrimary: Colors.white),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
