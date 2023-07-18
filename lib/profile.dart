import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:flutter/scheduler.dart';
import 'package:racktech/Token.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:jwt_decode/jwt_decode.dart';
import 'package:racktech/login.dart';
import 'package:racktech/homepage.dart';
import 'UserModel.dart';
import 'SignIn.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

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
    String? token = prefs.getString('token');
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

  Future<void> sendGetRequest() async {
    Map<String, dynamic> queryParams = {
      'email': email,
    };

    String url = 'http://10.0.2.2:5000/profile';

    try {
      Response response = await dio.get(url, queryParameters: queryParams);
      // Handle the response data here
      print(response.data);

      // Create a UserModel object from the response data
      User user = User(
        email: response.data['email'],
        number: response.data['phone'],
        company: response.data['company'],
      );

      // Delay the UI update by a slight duration
      await Future.delayed(Duration(milliseconds: 500));

      // Update the UI with the user details
      setState(() {
        userDetails = user;
      });
    } catch (e) {
      // Handle any error that occurs during the request
      print(e.toString());
    }
  }


  User? userDetails;

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
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Center(
                child: Card(
                  color: Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                       Center(
                         child:  Text(
                           'User Details',
                           style: TextStyle(
                             fontSize: 18.0,
                             fontWeight: FontWeight.bold,
                           ),
                         ),
                       ),
                        SizedBox(height: 10.0),
                        if (userDetails != null)
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Email: ${userDetails!.email}',
                                style: TextStyle(
                                  fontSize: 16.0,
                                ),
                              ),
                              SizedBox(height: 5.0),
                              Text(
                                'Number: ${userDetails!.number}',
                                style: TextStyle(
                                  fontSize: 16.0,
                                ),
                              ),
                              SizedBox(height: 5.0),
                              Text(
                                'Company: ${userDetails!.company}',
                                style: TextStyle(
                                  fontSize: 16.0,
                                ),
                              ),
                            ],
                          ),
                        if (userDetails == null)
                          SpinKitThreeInOut(color: Colors.black,size: 20,)
                      ],
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 150,
            ),
            Container(
              width: MediaQuery.sizeOf(context).width-50,
              height: 60,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.red, // Set the background color to white
                  onPrimary: Colors.white, // Set the text color to black
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0), // Set the corner radius
                  ),
                ),
                onPressed: () {
                  deleteUserToken();
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (BuildContext context) => LoginPage(),
                    )
                  );
                  },
                child: Text('Sign Out',style: TextStyle(fontSize: 25),),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
