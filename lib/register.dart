import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:racktech/homepage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RegisterPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return RegisterPageScreen();
  }
}

class RegisterPageScreen extends State<RegisterPage> {

  final emailController = TextEditingController();
  final phonenumbercontroller = TextEditingController();
  final passwordController = TextEditingController();
  final companyController = TextEditingController();

  bool emailEmpty = false;
  bool passwordEmpty = false;
  bool numberEmpty = false;
  bool companyEmpty = false;

  Dio dio = Dio();


  Future<void> sendPostRequest() async {

    setState(() {
      emailEmpty = emailController.text.isEmpty;
      passwordEmpty = passwordController.text.isEmpty;
      numberEmpty = phonenumbercontroller.text.isEmpty;
      companyEmpty = companyController.text.isEmpty;
    });

    if (!emailEmpty && !passwordEmpty && !numberEmpty) {
      showDialog(
        context: context,
        builder: (context) {
          return const Center (
            child: CircularProgressIndicator(),
          );
        },
      );
    }
    try {
      var response = await dio.post(
        'http://10.0.2.2:5000/register',
        data: {
          "email":emailController.text,
          "password":passwordController.text,
          "number":phonenumbercontroller.text,
          "company":companyController.text
        },
      );
      Navigator.pop(context);
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => MyApp(),
      ));
      // Process the response
      print(response.data);

      String token = response.data['token'];
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setString('token', token);

    } catch (e) {
      // Handle any errors
      if (!emailEmpty && !passwordEmpty && !numberEmpty) {
        Navigator.pop(context);
      }
      print('Error: $e');
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF1B1919),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                height: MediaQuery.sizeOf(context).height/2 - 20,
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
                  controller: emailController,
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
                height: 15,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: TextField(
                  controller: phonenumbercontroller,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.call),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20)
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey.shade400),
                    ),
                    fillColor: Colors.lightBlueAccent.shade100,
                    filled: true,
                    hintText: "Phone number",
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
                  controller: companyController,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.business_sharp),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20)
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey.shade400),
                    ),
                    fillColor: Colors.lightBlueAccent.shade100,
                    filled: true,
                    hintText: "Company name",
                    hintStyle: TextStyle(color: Colors.grey.shade500),
                  ),
                ),
              ),
              SizedBox(height: 15,),
              SizedBox(
                height: 15,
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
                  child: Text('Register',style: TextStyle(fontSize: 25),),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

}