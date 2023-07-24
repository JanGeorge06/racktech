import 'package:flutter/material.dart';
import 'package:racktech/category.dart';
import 'package:dio/dio.dart';
import 'ProductModel.dart';

class category_product extends StatefulWidget{
  late String category;

  category_product({super.key,required this.category});
  @override
  State<StatefulWidget> createState() {
    return cat_product(category);
  }
}

class cat_product extends State<category_product>{
  late String category;

  cat_product(this.category);

  Dio dio = Dio();

  var products;

  Future<void> sendGetRequest() async {
    Map<String, dynamic> queryParams = {
      'category': category
    };

    String url = 'http://10.0.2.2:5000/products';

    try {
      Response response = await dio.get(url, queryParameters: queryParams);

      setState(() {
        products = (response.data as List<dynamic>).map((json) => Product(
          category: json['category'] as String,
          name: json['name'] as String,
          image: json['image'] as String,
        )).toList();
        print(products); // move the print statement here
      });
    } catch (e) {
      print(e.toString());
    }
  }

  @override
  void initState() {
    super.initState();
    sendGetRequest();
  }
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
        scrollDirection: Axis.vertical,
          child: Container(
            child:  GridView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              itemCount: products.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 4.0,
                mainAxisSpacing: 4.0,
                //mainAxisExtent: 400.0,
              ),
              itemBuilder: (BuildContext context, int index) {
                return GestureDetector(
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.amber,
                      borderRadius: BorderRadius.circular(30),
                      image: DecorationImage(
                        fit: BoxFit.values.last,
                        alignment: Alignment.topCenter,
                        image: NetworkImage(products[index].image),
                      ),
                    ),
                  ),
                );
              },
            ),
          )
        ),
    );
  }
}