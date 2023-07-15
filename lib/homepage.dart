import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return HomePageScreen();
  }
}

class HomePageScreen extends State<HomePage> {
  @override
  int index = 0;

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF1B1919),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
                padding: EdgeInsets.only(left: 10, top: 20),
                child: Text(
                  "RackTech",
                  style: TextStyle(
                      fontSize: 45,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                  textAlign: TextAlign.start,
                )),
            SizedBox(
              height: 25,
            ),
            Center(
              child: Container(
                  width: MediaQuery.sizeOf(context).width - 10,
                  height: 60,
                  decoration: BoxDecoration(
                      color: Colors.black26,
                      borderRadius: BorderRadius.circular(10)),
                  child: Padding(
                    padding: EdgeInsets.all(10),
                    child: Text("Hello, Jan",
                        style: TextStyle(fontSize: 30, color: Colors.white)),
                  )
              ),
            ),
            SizedBox(height: 40,),
            GestureDetector(
              onTap: () {

              },
              child: Image.asset("images/rack.png",width: MediaQuery.sizeOf(context).width-20),
            ),
            SizedBox(height: 10,),
            Center(
              child: Text("Racks",style: TextStyle(color: Colors.white),),
            )
          ],
        ),
      ),
    );
  }
}
