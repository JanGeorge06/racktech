import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return RegisterPageScreen();
  }
}

class RegisterPageScreen extends State<RegisterPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF1B1919),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              height: MediaQuery.sizeOf(context).height/2,
              width: MediaQuery.sizeOf(context).width-40,
              child: Hero(
                tag:'racktech',
                child: Center(
                  child: Padding(
                    padding: EdgeInsets.only(left: 40),
                    child: Image.asset('images/racktech.png'),
                  )
                ),
              ),
            )
          ],
        )
      ),
    );
  }

}