import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'ProductModel.dart';

class CategoryProduct extends StatefulWidget {
  final String category;

  CategoryProduct({required this.category});

  @override
  State<StatefulWidget> createState() {
    return _CategoryProductState();
  }
}

class _CategoryProductState extends State<CategoryProduct> {
  Dio dio = Dio();
  late List<Product> products;
  bool isLoading = true;
  bool isError = false;

  Future<void> sendGetRequest() async {
    Map<String, dynamic> queryParams = {'category': widget.category};
    String url = 'http://10.0.2.2:5000/products';

    try {
      Response response = await dio.get(url, queryParameters: queryParams);

      setState(() {
        products = (response.data as List<dynamic>).map((json) => Product(
          category: json['category'] as String,
          name: json['name'] as String,
          image: json['image'] as String,
        )).toList();
        isLoading = false;
        isError = false;
      });
    } catch (e) {
      print(e.toString());
      setState(() {
        isLoading = false;
        isError = true;
      });
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
      body: isLoading
          ? Center(child: SpinKitThreeInOut(color: Colors.white,size:20,))
          : isError
          ? Center(child: Text('Error fetching products'))
          : GridView.builder(
        shrinkWrap: true,
        physics:BouncingScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 6.0,
          mainAxisSpacing: 20.0,
        ),
        itemCount: products.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              // Implement navigation to product details screen
            },
            child: Container(
              child: ListTile(
                title:Image.network(products[index].image, fit: BoxFit.cover),
                subtitle: Text(products[index].name.toUpperCase(),style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold
                ),
                ),
                isThreeLine:true,
              )
            ),
          );
        },
      ),
    );
  }
}
