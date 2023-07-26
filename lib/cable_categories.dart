import 'package:flutter/material.dart';
import 'package:racktech/category.dart';
import 'package:racktech/category_product.dart';

class cable_screen extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return cable_accessories();
  }

}

class cable_accessories extends State<cable_screen>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF1B1919),
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
        child: Container(
          height: MediaQuery.sizeOf(context).height-40,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                height: 30,
              ),
              Text(
                "Cables",
                style: TextStyle(
                    fontSize: 30,
                    color: Colors.white
                ),
              ),
              SizedBox(
                height: 5,
              ),
              ListView(
                padding: EdgeInsets.only(top: 80.0),
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 20.0),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => CategoryProduct(category: "fiber-cables")));
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20)
                        ),
                        height: MediaQuery.sizeOf(context).height/5.7,
                        child: Card(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20)
                          ),
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              gradient: LinearGradient(
                                colors: [
                                  Colors.grey.shade300,
                                  Colors.grey.shade500,
                                  Colors.grey.shade600,
                                  //Colors.white
                                ],
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                              ),
                            ),
                            child: Stack(
                              children: [
                                Center(
                                  child: Image.asset('images/optic_fiber.png'),
                                ),
                                Padding(padding: EdgeInsets.only(right: 15,bottom: 5),child:  Align(
                                  child:Text("Fiber",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25),),
                                  alignment: Alignment.bottomRight,
                                ),),

                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 20.0),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => CategoryProduct(category: "utp-cables")));
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20)
                        ),
                        height: MediaQuery.sizeOf(context).height/5.7,
                        child: Card(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20)
                          ),
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              gradient: LinearGradient(
                                colors: [
                                  Colors.grey.shade600,
                                  Colors.grey.shade500,
                                  Colors.grey.shade300,
                                  //Colors.white
                                ],
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                              ),
                            ),
                            child: Stack(
                              children: [
                                Center(
                                  child: Image.asset('images/utp_cable.png'),
                                ),
                                Padding(padding: EdgeInsets.only(right: 15,bottom: 5),child:  Align(
                                  child:Text("UTP",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25),),
                                  alignment: Alignment.bottomRight,
                                ),),

                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}