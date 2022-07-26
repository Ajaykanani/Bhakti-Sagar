import '../pages/login_page.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../pages/home_page.dart';

class AuthController {

  static logIn(context, user) async {
    var any = await SharedPreferences.getInstance();
    any.setString("user", user);
    Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => HomePage()));
  }

  Future<bool> tryAutoLogin() async {
    var any = await SharedPreferences.getInstance();
    if (!any.containsKey("user")) {
      return false;
    }
    else {
      return true;
    }
  }

  static logOut(context) async {
    var any = await SharedPreferences.getInstance();
    any.clear();
    Navigator.pushReplacement(
        context, MaterialPageRoute(
          builder: (context) => LoginPage()
        )
    );
  }

}