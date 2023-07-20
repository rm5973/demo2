import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class paymentWidget extends StatefulWidget {
  const paymentWidget({super.key});

  @override
  State<paymentWidget> createState() => _paymentWidget();
}

class _paymentWidget extends State<paymentWidget> {
  @override
  Widget build(BuildContext context) {
    double screenwidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 15.0, vertical: 5),
              child: Text(
                'Hello',
                style: TextStyle(color: HexColor('FF7A7878'), fontSize: 15.0),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 15.0,
              ),
              child: Text(
                'DEXTER MORGEN',
                style: TextStyle(color: Colors.black, fontSize: 20.0),
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 15.0, vertical: 5),
              child: Container(
                width: screenwidth * 0.92,
                height: screenHeight * 0.20,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomCenter,
                        colors: <Color>[
                          HexColor('#0081C9'),
                          HexColor('#5BC0F8'),
                        ])),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 30, left: 16),
                      child: Text(
                        "1200.00rs",
                        style: TextStyle(fontSize: 35, color: Colors.white),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Text(
                        "Total Balance",
                        style: TextStyle(fontSize: 20, color: Colors.white),
                      ),
                    )
                  ],
                ),
              ),
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 25.0, left: 80),
                  child: Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(color: HexColor('#3BA6E1')),
                    child: Row(
                      children: [
                        IconButton(onPressed: () {}, icon: Icon(Icons.qr_code))
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 25.0, left: 50),
                  child: Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(color: HexColor('#3BA6E1')),
                    child: Row(
                      children: [
                        IconButton(onPressed: () {}, icon: Icon(Icons.qr_code))
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 25.0, left: 50),
                  child: Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(color: HexColor('#3BA6E1')),
                    child: Row(
                      children: [
                        IconButton(onPressed: () {}, icon: Icon(Icons.qr_code))
                      ],
                    ),
                  ),
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 8.0, left: 50),
                  child: Text(
                    "Transaction",
                    style: TextStyle(fontSize: 20),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 9.0, left: 2),
                  child: TextButton(
                      onPressed: () {},
                      child: Text(
                        "See All",
                        style: TextStyle(color: Colors.grey),
                      )),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
