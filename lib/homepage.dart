//import 'dart:js_util';

import 'package:floating_navbar/floating_navbar_item.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:jwt_decode/jwt_decode.dart';
import 'package:racktech/login.dart';
import 'package:floating_navbar/floating_navbar.dart';
import 'package:racktech/profile.dart';
import 'package:racktech/Token.dart';
import 'package:racktech/components/toggleswitch.dart';

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: FloatingNavBar(
        horizontalPadding: 10.0,
        hapticFeedback: false,
        resizeToAvoidBottomInset: false,
        color: Colors.black,
        items: [
          FloatingNavBarItem(
            iconData: Icons.home,
            title: 'Home',
            page: Homepage(),
          ),
          FloatingNavBarItem(
            iconData: Icons.explore,
            title: 'Explore',
            page: Homepage(),
          ),
          FloatingNavBarItem(
            iconData: Icons.shopping_cart_rounded,
            title: 'Cart',
            page: Homepage(),
          ),
          FloatingNavBarItem(
            iconData: Icons.account_circle,
            title: 'Account',
            page: Profile(),
          )
        ],
        selectedIconColor: Colors.white,
      ),
    );
  }
}



class Homepage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return HomepageScreen();
  }
}

class HomepageScreen extends State<Homepage> {
  int selectedIndex = 0;
  bool firstpage = false;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    setState(() {
      decodeToken();
      debugPrint(email);
    });
  }

  void _openDrawer(BuildContext context) {
    _scaffoldKey.currentState?.openDrawer();
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
          children: [
            SizedBox(height: 50,),
            Center(
              child: ToggleButton(width: 250,
                  height: 60,
                  toggleBackgroundColor: Colors.transparent,
                  toggleBorderColor: Colors.transparent,
                  toggleColor: Colors.lightBlueAccent,
                  activeTextColor: Colors.white,
                  inactiveTextColor: Colors.grey,
                  leftDescription: "Best Seller",
                  rightDescription: "New Products",
                  onLeftToggleActive: (){
                  setState(() {
                    firstpage = true;
                  });
                  },
                  onRightToggleActive: (){
                setState(() {
                  firstpage =false;
                });
                  },
              ),
            ),
            Expanded(
                child:firstpage
                ? Page2()
                : Page1()
            ),
          ],
        ),
      ),
    );
  }
}
class Page1 extends StatefulWidget {
  @override
  _Page1State createState() => _Page1State();
}

class _Page1State extends State<Page1> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.red,
      child: Center(
        child: Text('Page 1'),
      ),
    );
  }
}

class Page2 extends StatefulWidget {
  @override
  _Page2State createState() => _Page2State();
}

class _Page2State extends State<Page2> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue,
      child: Center(
        child: Text('Page 2'),
      ),
    );
  }
}