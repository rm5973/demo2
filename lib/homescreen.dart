import 'package:demo1/help.dart';
import 'package:demo1/laundryhistory.dart';
import 'package:demo1/login.dart';
import 'package:demo1/optionlaund.dart';
import 'package:demo1/payment.dart';
import 'package:demo1/pickup.dart';
import 'package:demo1/profile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

import 'laundarybook.dart';

// class NewWidget extends StatefulWidget {
//   const NewWidget({super.key});

//   @override
//   State<NewWidget> createState() => _NewWidget();
// }

// class _NewWidget extends State<NewWidget> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SafeArea(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 Padding(
//                   padding: const EdgeInsets.all(8.0),
//                   child: Column(
//                     children: [
//                       Card(
//                         child: ElevatedButton(
//                           onPressed: () {
//                             Navigator.push(
//                                 context,
//                                 MaterialPageRoute(
//                                   builder: ((context) => opWidget()),
//                                 ));
//                           },
//                           style: ElevatedButton.styleFrom(
//                               backgroundColor: Colors.white),
//                           child: Image.asset("images/washing-machine 1.png"),
//                         ),
//                       ),
//                       Text("Book laundary")
//                     ],
//                   ),
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.all(8.0),
//                   child: Column(
//                     children: [
//                       Card(
//                         child: ElevatedButton(
//                           onPressed: () {
//                             Navigator.push(
//                                 context,
//                                 MaterialPageRoute(
//                                   builder: ((context) => pickup()),
//                                 ));
//                           },
//                           style: ElevatedButton.styleFrom(
//                               backgroundColor: Colors.white),
//                           child: Image.asset("images/location 1.png"),
//                         ),
//                       ),
//                       Text("Pickup List")
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 Padding(
//                   padding: const EdgeInsets.all(8.0),
//                   child: Column(
//                     children: [
//                       Card(
//                         child: ElevatedButton(
//                           onPressed: () {
//                             Navigator.pop(context);
//                           },
//                           style: ElevatedButton.styleFrom(
//                               backgroundColor: Colors.white),
//                           child: Image.asset("images/checklist 1.png"),
//                         ),
//                       ),
//                       Text("laundary history")
//                     ],
//                   ),
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.all(8.0),
//                   child: Column(
//                     children: [
//                       Card(
//                         child: ElevatedButton(
//                           onPressed: () {
//                             Navigator.pop(context);
//                           },
//                           style: ElevatedButton.styleFrom(
//                               backgroundColor: Colors.white),
//                           child: Image.asset("images/get-money 1.png"),
//                         ),
//                       ),
//                       Text("Payment History")
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 Padding(
//                   padding: const EdgeInsets.all(8.0),
//                   child: Column(
//                     children: [
//                       Card(
//                         child: ElevatedButton(
//                           onPressed: () {
//                             Navigator.pop(context);
//                           },
//                           style: ElevatedButton.styleFrom(
//                               backgroundColor: Colors.white),
//                           child: Image.asset(
//                             "images/text-file 1.png",
//                           ),
//                         ),
//                       ),
//                       Text("Book laundary")
//                     ],
//                   ),
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.all(8.0),
//                   child: Column(
//                     children: [
//                       Card(
//                         child: ElevatedButton(
//                           onPressed: () {
//                             Navigator.pop(context);
//                           },
//                           style: ElevatedButton.styleFrom(
//                               backgroundColor: Colors.white),
//                           child: Image.asset("images/checklist 1.png"),
//                         ),
//                       ),
//                       Text("laundary")
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:carousel_slider/carousel_slider.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List imageList = [
    {"id": 1, "image_path": 'images/laundaryimg1.jpeg'},
    {"id": 2, "image_path": 'images/laundaryimg2.jpeg'},
    {"id": 3, "image_path": 'images/laundaryimg3.jpeg'},
  ];
  int _counter = 0;

  void _incrementCounter() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(80), // Increase the app bar height
        child: Padding(
          padding: const EdgeInsets.only(top: 16.0),
          child: AppBar(
            automaticallyImplyLeading: false, // Remove the back button
            backgroundColor: Colors.white, // Set app bar color to white
            elevation: 0, // Remove the shadow
            title: GestureDetector(
              child: Column(
                // Use Column to align texts vertically
                crossAxisAlignment:
                    CrossAxisAlignment.start, // Align the text to the left
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                        top: 16), // Add top padding of 16 pixels
                    child: Text(
                      'Current Location',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.grey, // Set the color to grey
                      ),
                    ),
                  ),
                  SizedBox(height: 4), // Add some space between the texts
                  Row(
                    // Use Row to align icon and text horizontally
                    children: [
                      Icon(Icons.location_on,
                          color: Colors.blue), // Location icon on the left
                      SizedBox(width: 8),
                      Text(
                        "Potheri, Chennai",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight:
                              FontWeight.bold, // Set the font weight to bold
                          color: Colors.black, // Set the text color to black
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            actions: [
              IconButton(
                icon: Icon(Icons.notifications,
                    color: Colors.black), // Set icon color to black
                onPressed: () {
                  // Handle notification icon press
                },
              ),
            ],
          ),
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: Colors.blue,
                ),
                //margin: EdgeInsets.fromLTRB(21.0, 195.0, 20.0, 10.0),
                height: 170.0,
                width: 450,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 0, left: 30),
                          child: Container(
                            height: 58.0,
                            width: 250.0,
                            child: Text(
                              'Your clothes will be ready in 2 days',
                              style: TextStyle(
                                  fontSize: 20.0, color: Colors.white),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 35.0, right: 10),
                          child: Container(
                            height: 78.0,
                            width: 67.0,
                            child: Image(
                              image: AssetImage('images/Washing Machine 1.png'),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 5.0),
                      child: Container(
                        child: TextButton(
                          style: TextButton.styleFrom(
                            primary: Colors.black,
                          ),
                          onPressed: () {},
                          child: Text(
                            'View Details',
                            style:
                                TextStyle(fontSize: 13.0, color: Colors.white),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            Container(
              child: Row(
                children: [
                  Column(
                    children: [
                      Container(
                        height: 72.0,
                        width: 72.0,
                        margin: EdgeInsets.only(left: 20.0),
                        child: InkWell(
                          onTap: () {},
                          splashColor: Colors.transparent,
                          child: Ink(
                            height: 72.0,
                            width: 72.0,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage('images/Calender Icon 1.png'),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        height: 20.0,
                        width: 72.0,
                        margin: EdgeInsets.only(left: 25.0),
                        child: Text(
                          'Book Laundry',
                          style: TextStyle(fontSize: 11.0, color: Colors.black),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    width: 11.0,
                  ),
                  Column(
                    children: [
                      Container(
                        height: 72.0,
                        width: 72.0,
                        child: InkWell(
                          onTap: () {},
                          splashColor: Colors.transparent,
                          child: Ink(
                            height: 72.0,
                            width: 72.0,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage(
                                    'images/Payment History Icon 1.png'),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        height: 20.0,
                        width: 87.0,
                        child: Text(
                          'Payment History',
                          style: TextStyle(fontSize: 11.0, color: Colors.black),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    width: 13.0,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        height: 72.0,
                        width: 72.0,
                        child: InkWell(
                          onTap: () {},
                          splashColor: Colors.transparent,
                          child: Ink(
                            height: 72.0,
                            width: 72.0,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage('images/List Icon 1.png'),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        width: 59.0,
                        height: 20.0,
                        child: Text(
                          'Pickup List',
                          style: TextStyle(fontSize: 11.0, color: Colors.black),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    width: 11.0,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: 72.0,
                        width: 72.0,
                        child: InkWell(
                          onTap: () {
                            Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (BuildContext context)=>MyApp()));
                          },
                          splashColor: Colors.transparent,
                          child: Ink(
                            height: 72.0,
                            width: 72.0,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                  image:
                                      AssetImage('images/History black 1.png')),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        height: 20.0,
                        width: 85.0,
                        child: Text(
                          'Laundry History',
                          style: TextStyle(fontSize: 11.0, color: Colors.black),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            Container(
              height: 200,
              child: Expanded(
                  child: ListView(
                scrollDirection: Axis.horizontal,
                children: <Widget>[
                  carousal(image: 'images/laundaryimg1.jpeg'),
                  SizedBox(
                    width: 5,
                  ),
                  carousal(image: 'images/laundaryimg2.jpeg'),
                  SizedBox(
                    width: 5,
                  ),
                  carousal(image: 'images/laundaryimg3.jpeg')
                ],
              )),
            )
          ],
        ),
      ),
    );
  }
}

class carousal extends StatelessWidget {
  const carousal({Key? key, required this.image}) : super(key: key);
  final String image;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20), color: Colors.black),
        height: 50,
        width: 200,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Image.asset(
            image,
            fit: BoxFit.fill,
          ),
        ),
      ),
    );
  }
}
