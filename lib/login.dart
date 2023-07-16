import 'package:flutter/material.dart';
import 'package:racktech/register.dart';
import 'package:racktech/SignIn.dart';

class LoginPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return LoginPageScreen();
  }
}

class LoginPageScreen extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF1B1919),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              height: MediaQuery.sizeOf(context).height/1.5,
              width: MediaQuery.sizeOf(context).width-40,
              child: Hero(
                tag: "racktech",
                child: Image.asset("images/racktech.png"),
              )
            ),
            const Text("Welcome to RackTech Shop",style: TextStyle(
              fontSize:45,
              color: Colors.white
            ),textAlign: TextAlign.center,),
            SizedBox(
              height: 10,
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
                  Navigator.push(context, MaterialPageRoute(builder: (context)=> SignIn()));
                  },
                child: Text('Login',style: TextStyle(fontSize: 25),),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            const Divider(
              height: 1.0, // Set the height of the divider
              color: Colors.grey, // Set the color of the divider
              thickness: 1.0, // Set the thickness of the divider
              indent: 20.0,
              endIndent: 20.0,
            ),
            SizedBox(
              height: 10,
            ),
             Center(
              child: GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=> RegisterPage()));
                },
                child: RichText(
                  text: const TextSpan(
                      children:<TextSpan> [
                        TextSpan(text: "Don't have an account?",style: TextStyle(color: Colors.white)),
                        TextSpan(text: "  Register now!",style: TextStyle(color: Colors.blue)),

                      ]
                  ),
                ),
              )
            )
          ],
        ),
      ),
    );
  }

}