import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:jwt_decode/jwt_decode.dart';
import 'package:racktech/login.dart';
import 'package:racktech/homepage.dart';

class Profile extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return ProfileScreen();
  }
}

class ProfileScreen extends State<Profile> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  Dio dio = Dio();
  String? email;

  @override
  void initState() {
    super.initState();
    decodeToken();
  }

  Future<String?> getTokenFromSharedPreferences() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = await prefs.getString('token');
    return token;
  }

  void decodeToken() async {
    // Retrieve the token from SharedPreferences
    String? token = await getTokenFromSharedPreferences();

    if (token != null) {
      // Decode the token
      Map<String, dynamic>? decodedToken = Jwt.parseJwt(token);

      // Access the token claims
      setState(() {
        email = decodedToken?['email'];
      });

      // Send the GET request
      sendGetRequest();
    } else {
      // Token not found in SharedPreferences
      print('Token not found');
    }
  }

  Future<void> deleteUserToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove('token');
  }

  Future<void> sendGetRequest() async {


    Map<String, dynamic> queryParams = {
      'email': email,
    };

    String url = 'http://10.0.2.2:5000/profile';

    try {
      Response response = await dio.get(url, queryParameters: queryParams);
      // Handle the response data here
      print(response.data);
    } catch (e) {
      // Handle any error that occurs during the request
      print(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        backgroundColor: Color(0xFF1B1919),
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: Hero(
          tag: "racktech",
          child: Image.asset(
            "images/racktech.png",
            width: 100,
            height: 50,
          ),
        ),
      ),
      backgroundColor: Color(0xFF1B1919),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [],
        ),
      ),
    );
  }
}
