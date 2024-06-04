import 'package:demo1/bookingPage.dart';
import 'package:demo1/help.dart';
import 'package:demo1/laundryhistory.dart';
import 'package:demo1/locationselect.dart';
import 'package:demo1/login.dart';
import 'package:demo1/optionlaund.dart';
import 'package:demo1/payment.dart';
import 'package:demo1/pickup.dart';
import 'package:demo1/profile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'laundarybook.dart';

import 'package:flutter/widgets.dart';
import 'package:carousel_slider/carousel_slider.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String selectedLocation = "No location selected";
  void _navigateToLocationSelection() async {
    final newLocation = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => LocationSelectionPage()),
    );
  }

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
        preferredSize: Size.fromHeight(100),
        child: Padding(
          padding: const EdgeInsets.only(
            top: 30.0,
          ),
          child: AppBar(
            automaticallyImplyLeading: false,
            backgroundColor: Colors.white,
            elevation: 0,
            title: GestureDetector(
              onTap: () {
                Navigator.of(context).pushReplacement(MaterialPageRoute(
                  builder: (BuildContext context) => LocationSelectionPage(),
                ));
              },
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 16),
                    child: Text(
                      'Current Location',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                  SizedBox(height: 4),
                  FutureBuilder<User?>(
                    future: FirebaseAuth.instance.authStateChanges().first,
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return CircularProgressIndicator();
                      } else {
                        if (snapshot.hasData) {
                          final user = snapshot.data;
                          final userId = user!.uid;

                          return FutureBuilder<DocumentSnapshot>(
                            future: FirebaseFirestore.instance
                                .collection('users')
                                .doc(userId)
                                .collection('locations')
                                .doc('NFcZto6jL0j69TBAAaAZ')
                                .get(),
                            builder: (context, snapshot) {
                              if (snapshot.connectionState ==
                                  ConnectionState.waiting) {
                                return CircularProgressIndicator();
                              } else {
                                if (snapshot.hasError) {
                                  return Text('Error: ${snapshot.error}');
                                } else {
                                  final data = snapshot.data;

                                  // Check if the document exists before accessing the 'address' field
                                  if (snapshot.hasData &&
                                      snapshot.data!.exists) {
                                    final locationName = data![
                                        'address']; // Access the 'address' field
                                    print('Location Address: $locationName');

                                    return Row(
                                      children: [
                                        Icon(Icons.location_on,
                                            color: Colors.blue),
                                        SizedBox(width: 8),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              (locationName.length > 8)
                                                  ? '${locationName.substring(0, 8)}...'
                                                  : locationName,
                                              overflow: TextOverflow.ellipsis,
                                              style: TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.black,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    );
                                  } else {
                                    // Document doesn't exist or 'address' field is missing
                                    return Text('Location data not available.');
                                  }
                                }
                              }
                            },
                          );
                        } else {
                          // User is not authenticated, handle this case as needed
                          return Text('User is not authenticated.');
                        }
                      }
                    },
                  ),
                ],
              ),
            ),
            actions: [
              IconButton(
                icon: Icon(Icons.notifications, color: Colors.black),
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
                          style: ButtonStyle(
                            foregroundColor:
                                MaterialStateProperty.all(Colors.black),
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
                          onTap: () {
                            Navigator.of(context).pushReplacement(
                                MaterialPageRoute(
                                    builder: (BuildContext context) =>
                                        CartPage()));
                          },
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
                          onTap: () {
                            Navigator.of(context).pushReplacement(
                                MaterialPageRoute(
                                    builder: (BuildContext context) =>
                                        paymentWidget()));
                          },
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
                      //  aa
                      Container(
                        height: 72.0,
                        width: 72.0,
                        child: InkWell(
                          onTap: () {
                            Navigator.of(context).pushReplacement(
                                MaterialPageRoute(
                                    builder: (BuildContext context) =>
                                        CartPage()));
                          },
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
                            Navigator.of(context).pushReplacement(
                                MaterialPageRoute(
                                    builder: (BuildContext context) =>
                                        MyApp()));
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
        width: 150,
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
