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
    var usernameController = TextEditingController();
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
                  child:  Image.asset('images/racktech.png'),
                  )
                ),
              ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: TextField(
                  controller: usernameController,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.person),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20)
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey.shade400),
                    ),
                    fillColor: Colors.lightBlueAccent.shade100,
                    filled: true,
                    hintText: "Username",
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
                controller: usernameController,
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
                controller: usernameController,
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

                },
                child: Text('Register',style: TextStyle(fontSize: 25),),
              ),
            ),
          ],
        )
      ),
    );
  }

}