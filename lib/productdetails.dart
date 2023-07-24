import 'package:flutter/material.dart';
import 'package:racktech/homepage.dart';

class productdetails extends StatelessWidget {
  final String image;
  final String name;
  final String price;

  productdetails({Key? key, required this.image, required this.name,required this.price})
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
      body: Column(
        children: [
          AspectRatio(
            aspectRatio: 1,
            child: Container(
              width: double.infinity,
              child: Image(
                image: NetworkImage(image),
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.all(20.0),
            child: Center(
              child: Text(
                name,
                style: TextStyle(fontSize: 40),
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.all(20.0),
            child: Center(
              child: Text(
                price,
                style: TextStyle(fontSize: 40),
              ),
            ),
          ),
        ],
      ),
    );
  }
}


