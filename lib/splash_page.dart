import 'package:flutter/material.dart';
import 'package:qlts/widget_home/my_home_page.dart';
import 'package:qlts/widget_login/my_login_page.dart';
import 'package:shared_preferences/shared_preferences.dart';


class SplashPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => SplashPageState();
}

class SplashPageState extends State<SplashPage> {
  Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  @override
  void initState() {
    super.initState();

    checkToken();
  }

  void checkToken() async {
    SharedPreferences prefs = await _prefs;
    String token = (prefs.getString('token')) ?? '';

    if (token == '') {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => MyLoginPage()));
    } else {
      Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (context) => MyHomePage(token: token,)));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: CircularProgressIndicator()),
    );
  }
}
