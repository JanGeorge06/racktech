import 'package:flutter/material.dart';
import 'package:racktech/accessories_category.dart';
import 'package:racktech/cable_categories.dart';
import 'package:racktech/category_product.dart';

class categories_screen extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
return categories();
  }

}

class categories extends State<categories_screen>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
        child: Container(
          height: MediaQuery.sizeOf(context).height-40,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                height: 15,
              ),
              Text(
                "Categories",
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.white
                ),
              ),
              SizedBox(
                height: 5,
              ),
              ListView(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => CategoryProduct(category: "indoor")));
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
                                Colors.purple,
                                Colors.purple,
                                Colors.blue,
                                Colors.white
                              ],
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                            ),
                          ),
                          child: Stack(
                            children: [
                              Center(
                                child: Image.asset('images/indoor_rack.png'),
                              ),
                             Padding(padding: EdgeInsets.only(right: 15,bottom: 5),child:  Align(
                               child:Text("Indoor",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25),),
                               alignment: Alignment.bottomRight,
                             ),),

                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => CategoryProduct(category: "outdoor")));
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
                                Colors.purple,
                                Colors.purple,
                                Colors.blue,
                                Colors.white
                              ],
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                            ),
                          ),
                          child: Stack(
                            children: [
                              Center(
                                child: Image.asset('images/outdoor_rack.png'),
                              ),
                              Padding(padding: EdgeInsets.only(right: 15,bottom: 5),child:  Align(
                                child:Text("Outdoor",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25),),
                                alignment: Alignment.bottomRight,
                              ),),

                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => accessories_screen()));
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
                                Colors.purple,
                                Colors.purple,
                                Colors.blue,
                                Colors.white
                              ],
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                            ),
                          ),
                          child: Stack(
                            children: [
                              Center(
                                child: Image.asset('images/fan.png'),
                              ),
                              Padding(padding: EdgeInsets.only(right: 15,bottom: 5),child:  Align(
                                child:Text("Accessories",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
                                alignment: Alignment.bottomRight,
                              ),),

                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => cable_screen()));
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
                                Colors.purple,
                                Colors.purple,
                                Colors.blue,
                                Colors.white
                              ],
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                            ),
                          ),
                          child: Stack(
                            children: [
                              Center(
                                child: Image.asset('images/cables.png'),
                              ),
                              Padding(padding: EdgeInsets.only(right: 15,bottom: 5),child:  Align(
                                child:Text("RT Link",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25),),
                                alignment: Alignment.bottomRight,
                              ),),
                            ],
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