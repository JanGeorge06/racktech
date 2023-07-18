import 'package:floating_navbar/floating_navbar_item.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:jwt_decode/jwt_decode.dart';
import 'package:racktech/login.dart';
import 'package:floating_navbar/floating_navbar.dart';



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
        hapticFeedback: true,
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
            page: Homepage(),
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
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  String? email;
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
      // Use the decoded token claims as needed
    } else {
      // Token not found in SharedPreferences
      print('Token not found');
    }
  }

  Future<void> deleteUserToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove('token');
  }

  @override
  void initState() {
    setState(() {
      decodeToken();
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
        leading: IconButton(
          icon: Icon(Icons.menu),
          onPressed: () => _openDrawer(context),
        ),
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
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(color: Color(0xFF1B1919)),
              child: Text(
                'Hello \n${email}',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text(
                'Home',
                style: TextStyle(fontSize: 20),
              ),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.shopping_cart_rounded),
              title: Text(
                'My orders',
                style: TextStyle(fontSize: 20),
              ),
              onTap: () {
                // Handle drawer item click
              },
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text(
                'Settings',
                style: TextStyle(fontSize: 20),
              ),
              onTap: () {
                // Handle drawer item click
              },
            ),
            SizedBox(
              height: MediaQuery.sizeOf(context).height/10,
            ),
            ListTile(
              leading: Icon(Icons.exit_to_app),
              title: Text("Sign Out",style: TextStyle(fontSize: 20),),
              onTap: () {
                deleteUserToken();
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> LoginPage()));
              },
            )
          ],
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
