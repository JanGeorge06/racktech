import 'package:flutter/material.dart';
import 'package:racktech/category.dart';
import 'package:racktech/category_product.dart';

class accessories_screen extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return accessories();
  }

}

class accessories extends State<accessories_screen>{
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
                "Accessories",
                style: TextStyle(
                    fontSize: 30,
                    color: Colors.white
                ),
              ),
              SizedBox(
                height: 5,
              ),
              ListView(
                padding: EdgeInsets.only(top: 60.0),
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 20.0),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => CategoryProduct(category: "accessories-indoor")));
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
                                  Colors.red.shade900,
                                  Colors.red.shade600,
                                  Colors.red.shade500,
                                ],
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                              ),
                            ),
                            child: Stack(
                              children: [
                                Center(
                                  child: Image.asset('images/shelf_accessories.png'),
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
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 20.0),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => CategoryProduct(category: "accessories-fiber")));
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
                                  Colors.red.shade900,
                                  Colors.red.shade600,
                                  Colors.red.shade500,
                                  //Colors.red.shade200
                                ],
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                              ),
                            ),
                            child: Stack(
                              children: [
                                Center(
                                  child: Image.asset('images/fiber_accessories.png'),
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
                  GestureDetector(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => CategoryProduct(category: "accessories-utp")));
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
                                Colors.red.shade900,
                                Colors.red.shade600,
                                Colors.red.shade500,
                              ],
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                            ),
                          ),
                          child: Stack(
                            children: [
                              Center(
                                child: Image.asset('images/keystone.png'),
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
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}