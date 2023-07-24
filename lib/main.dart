import 'package:flutter/material.dart';
import 'package:racktech/login.dart';
import 'package:racktech/homepage.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

void main() {
  runApp(MyApp1());
}

class MyApp1 extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp1> {
  String? _token;

  @override
  void initState() {
    super.initState();
    checkToken();
  }

  // Check if the user is already logged in (token exists)
  void checkToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = prefs.getString("token") ?? "";
    setState(() {
      _token = token;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (_token == null || _token!.isEmpty) {
      return MaterialApp(
        home: LoginPage(),
      );
    } else {
      return MaterialApp(
        home: MyApp(),
      );
    }
  }
}