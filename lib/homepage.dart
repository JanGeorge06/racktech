//import 'dart:js_util';
import 'package:dio/dio.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:racktech/ProductModel.dart';
import 'package:floating_navbar/floating_navbar_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:jwt_decode/jwt_decode.dart';
import 'package:racktech/login.dart';
import 'package:floating_navbar/floating_navbar.dart';
import 'package:racktech/profile.dart';
import 'package:racktech/Token.dart';
import 'package:racktech/components/toggleswitch.dart';
import 'package:racktech/productdetails.dart';
import 'package:racktech/category.dart';

class MyApp extends StatelessWidget {
  // This widget is the root of your application.


  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        child: MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            primarySwatch: Colors.blue,
            visualDensity: VisualDensity.adaptivePlatformDensity,
          ),
          home: FloatingNavBar(
            horizontalPadding: 10.0,
            hapticFeedback: false,
            resizeToAvoidBottomInset: false,
            color: Colors.black,
            items: [
              FloatingNavBarItem(
                iconData: Icons.home,
                title: 'Home',
                page: Homepage(),
              ),
              FloatingNavBarItem(
                iconData: Icons.explore,
                title: 'Explore',
                page: categories_screen(),
              ),
              FloatingNavBarItem(
                iconData: Icons.account_circle,
                title: 'Account',
                page: Profile(),
              )
            ],
            selectedIconColor: Colors.white,
          ),
        ),
        onWillPop: () async {
          return await showDialog(
              context: context,
              barrierDismissible: false,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: Text("Confirm Exit"),
                  content: Text("Are you sure you want to exit?"),
                  actions: <Widget>[
                    TextButton(
                      child: Text("YES"),
                      onPressed: () {
                        SystemNavigator.pop();
                      },
                    ),
                    TextButton(
                      child: Text("NO"),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    )
                  ],
                );
              }
          );
          return Future.value(true);
        }
        );
  }
}

class PhotoItem {
  final String image;
  final String name;
  final String description;
  PhotoItem(this.image, this.name,this.description);
}

final List<PhotoItem> _items = [
  PhotoItem(
      "https://images.pexels.com/photos/1772973/pexels-photo-1772973.png?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260",
      "Mountains","200"),
  PhotoItem(
      "https://images.pexels.com/photos/1758531/pexels-photo-1758531.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260",
      "Road","300"),
  PhotoItem(
      "https://images.pexels.com/photos/1758531/pexels-photo-1758531.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260",
      "Road","300"),
  PhotoItem(
      "https://images.pexels.com/photos/1758531/pexels-photo-1758531.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260",
      "Road","300"),
  PhotoItem(
      "https://images.pexels.com/photos/1758531/pexels-photo-1758531.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260",
      "Road","300"),
  PhotoItem(
      "https://images.pexels.com/photos/1758531/pexels-photo-1758531.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260",
      "Road","300"),
  PhotoItem(
      "https://images.pexels.com/photos/1758531/pexels-photo-1758531.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260",
      "Road","300"),
  PhotoItem(
      "https://images.pexels.com/photos/1758531/pexels-photo-1758531.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260",
      "Road","300"),
  PhotoItem(
      "https://images.pexels.com/photos/1758531/pexels-photo-1758531.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260",
      "Road","300"),
];

class Homepage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return HomepageScreen();
  }
}

late List<Product> products;
bool isLoading = true;
bool isError = false;

class HomepageScreen extends State<Homepage> {
  int selectedIndex = 0;
  bool firstpage = false;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();


  Dio dio = Dio();

  Future<void> sendGetRequest() async {
    Map<String, dynamic> queryParams = {'best-seller': 'yes'};
    String url = 'http://10.0.2.2:5000/products';

    try {
      Response response = await dio.get(url, queryParameters: queryParams);

      setState(() {
        products = (response.data as List<dynamic>).map((json) => Product(
          category: json['category'] as String,
          name: json['name'] as String,
          image: json['image'] as String,
          description: json['description'] as String,
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
    decodeToken();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(height: 20,),
            Center(
              child: ToggleButton(width: 200,
                height: 50,
                toggleBackgroundColor: Colors.black,
                toggleBorderColor: Colors.black,
                toggleColor: Colors.white,
                activeTextColor: Colors.black,
                inactiveTextColor: Colors.grey,
                leftDescription: "Best Seller",
                rightDescription: "New Products",
                onLeftToggleActive: () {
                  setState(() {
                    firstpage = true;
                  });
                },
                onRightToggleActive: () {
                  setState(() {
                    firstpage = false;
                  });
                },
              ),
            ),
            Column(
              children: [
                LimitedBox(
                  maxHeight: MediaQuery.sizeOf(context).height-250,
                  maxWidth: 200,
                  child: Container(
                      child: firstpage
                          ? Page2()
                          : Page1()
                  ),
                )
              ],
            ),
            // Expanded(
            //     child:firstpage
            //     ? Page2()
            //     : Page1()
            // ),
          ],
        ),
      ),
    );
  }
}

class Page1 extends StatefulWidget {
  @override
  _Page1State createState() => _Page1State();
}

class _Page1State extends State<Page1> {
  @override
  Widget build(BuildContext context) {
    return Container(
      // color: Colors.red,
      // child: Center(
      //   child: Text('Page 1'),
      //),
      padding: EdgeInsets.all(12.0),
      child:  isLoading
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
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => productdetails(
                    image: products[index].image,
                    name: products[index].name,
                    description: products[index].description,
                  ),
                ),
              );
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

class Page2 extends StatefulWidget {
  @override
  _Page2State createState() => _Page2State();
}

class _Page2State extends State<Page2> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue,
      child: Center(
        child: Text('Page 2'),
      ),
    );
  }
}