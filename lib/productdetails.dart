import 'package:flutter/material.dart';
import 'package:racktech/homepage.dart';

class productdetails extends StatelessWidget {
  final String image;
  final String name;
  final String description;

  productdetails({Key? key, required this.image, required this.name,required this.description})
      : super(key: key);

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
      body: SingleChildScrollView(
        child: Column(
          children: [
            //SizedBox(height: 20,),
            AspectRatio(
              aspectRatio: 1,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    image: DecorationImage(
                      image: NetworkImage(image),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ),
            Container(
              alignment: Alignment.centerLeft,
              margin: const EdgeInsets.all(7.0),
                child: Text(
                  name.toUpperCase(),
                  style: TextStyle(fontSize: 40),
                ),
            ),
            Container(
              margin: const EdgeInsets.all(7.0),
              alignment: Alignment.centerLeft,
                child: Text(
                  "Description: $description",
                  style: TextStyle(fontSize: 25),
                ),
            ),
          ],
        ),
      ),
    );
  }
}


