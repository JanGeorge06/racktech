import 'package:flutter/material.dart';
import 'package:racktech/homepage.dart';
import 'package:dio/dio.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:shared_preferences/shared_preferences.dart';
class SignIn extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return SignInScreen();
  }
}

class SignInScreen extends State<SignIn> {
  // text editing controllers
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  bool passwordEmpty = false;
  bool usernameEmpty = false;

  bool isLoading = false;


  // sign user in method
  // sign user in method
  Dio dio = Dio();
  // sign user in method
  Future<void> sendPostRequest() async {
    setState(() {
      usernameEmpty = usernameController.text.isEmpty;
      passwordEmpty = passwordController.text.isEmpty;
      isLoading = true; // Add isLoading variable
    });

    try {
      var response = await dio.post(
        'http://10.0.2.2:5000/login',
        data: {
          "email": usernameController.text,
          "password": passwordController.text,
        },
      );

      if (response.statusCode == 200) {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => MyApp()),
        );
      }

      // Process the response
      print(response.data);
      String token = response.data['token'];
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setString('token', token);
    } catch (e) {
      if (!usernameEmpty && !passwordEmpty) {
      }
      print('Error: $e');
    } finally {
      setState(() {
        isLoading = false; // Set isLoading to false after request completion
      });
    }
  }





  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF1B1919),
      body: SafeArea(
        child: SingleChildScrollView(
          child:  Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  height: MediaQuery.sizeOf(context).height/2,
                  width: MediaQuery.sizeOf(context).width-40,
                  child: Hero(
                      tag:'racktech',
                      child: Center(
                        child:  Image.asset('images/racktech.png'),
                      )
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: TextField(
                    controller: usernameController,
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.mail_rounded),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20)
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey.shade400),
                      ),
                      fillColor: Colors.lightBlueAccent.shade100,
                      filled: true,
                      hintText: "Email address",
                      hintStyle: TextStyle(color: Colors.grey.shade500),
                    ),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: TextField(
                    obscureText: true,
                    controller: passwordController,
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.lock),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20)
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey.shade400),
                      ),
                      fillColor: Colors.lightBlueAccent.shade100,
                      filled: true,
                      hintText: "Password",
                      hintStyle: TextStyle(color: Colors.grey.shade500),
                    ),
                  ),
                ),
                SizedBox(
                  height: 35,
                ),
                Container(
                  width: MediaQuery.sizeOf(context).width-50,
                  height: 60,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.black, // Set the background color to white
                      onPrimary: Colors.white, // Set the text color to black
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0), // Set the corner radius
                      ),
                    ),
                    onPressed: () {
                      sendPostRequest();
                    },
                    child: isLoading ?  SpinKitThreeInOut(color: Colors.white,size: 20,)
                        : Text('Login',style: TextStyle(fontSize: 25),),
                  ),
                ),
              ]
          ),
        ),
      ),
    );
  }

}
