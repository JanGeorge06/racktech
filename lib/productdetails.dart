import 'package:flutter/material.dart';
import 'package:racktech/homepage.dart';
import 'package:google_fonts/google_fonts.dart';

class productdetails extends StatefulWidget {
  final String image;
  final String name;
  final String description;

  productdetails({Key? key, required this.image, required this.name,required this.description})
      : super(key: key);

  @override
  State<productdetails> createState() => _productdetailsState();
}

class _productdetailsState extends State<productdetails> {
  bool showFullDescription = false;

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
                    borderRadius: BorderRadius.circular(20),
                    image: DecorationImage(
                      image: NetworkImage(widget.image),
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
                widget.name.toUpperCase(),
                style: GoogleFonts.abrilFatface(
                  textStyle: Theme.of(context).textTheme.displayLarge,
                  fontSize: 35,
                  fontWeight: FontWeight.w600,
                  fontStyle: FontStyle.normal,
                  color: Colors.white,
                ),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
              ),
              margin: const EdgeInsets.all(7.0),
              alignment: Alignment.centerLeft,
              child: ListTile(
                title: Text(
                  "Description",
                  style: GoogleFonts.abel(
                    textStyle: Theme.of(context).textTheme.displayLarge,
                    fontSize: 15,
                    fontWeight: FontWeight.w800,
                    fontStyle: FontStyle.normal,
                    color: Colors.white,
                  ),
                ),
                subtitle: showFullDescription
                    ? Text(
                  widget.description,
                  style: GoogleFonts.abel(
                    textStyle: Theme.of(context).textTheme.headline5,
                    color: Colors.white,
                  ),
                )
                    : GestureDetector(
                  onTap: () {
                    setState(() {
                      showFullDescription = true;
                    });
                  },
                  child: RichText(
                    text: TextSpan(
                      style: GoogleFonts.abel(
                        textStyle: Theme.of(context).textTheme.headline5,
                        color: Colors.white,
                      ),
                      children: <TextSpan>[
                        TextSpan(
                          text: !widget.description.isEmpty
                              ? widget.description.substring(0, 100)
                              : "No description",
                        ),
                        if (!widget.description.isEmpty)
                          TextSpan(
                            text: " \nsee more...", // Show the "see more" part
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.blue// Making "see more" bolder
                            ),
                          ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width - 50,
              height: 60,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.blue, // Set the background color to white
                  onPrimary: Colors.white, // Set the text color to black
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0), // Set the corner radius
                  ),
                ),
                onPressed: () {},
                child: Text(
                  'View Datasheet',
                  style: TextStyle(fontSize: 25),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
