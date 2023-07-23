// ignore_for_file: unnecessary_new

import 'package:clippy_flutter/clippy_flutter.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:demo1/homescreen.dart';
import 'package:demo1/profile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:line_icons/line_icon.dart';
import 'package:lite_rolling_switch/lite_rolling_switch.dart';
import 'package:sliding_switch/sliding_switch.dart';

class helpWidget extends StatefulWidget {
  const helpWidget({super.key});

  @override
  State<helpWidget> createState() => _helpWidget();
}

class _helpWidget extends State<helpWidget> {
  int _selectedIndex = 0;
  bool lights = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                    onPressed: () {},
                    icon: LineIcon.arrowLeft(
                      color: Colors.black,
                    )),
                Switch(
                  value: lights,
                  activeColor: Colors.black,
                  onChanged: (
                    bool value,
                  ) {
                    setState(() {
                      lights = value;
                    });
                  },
                ),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'FAQ',
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: 35,
              decoration: BoxDecoration(
                  color: HexColor("FFD9D9D9"),
                  borderRadius: BorderRadius.circular(20.0)),
              child: TextField(
                  decoration: InputDecoration(
                      iconColor: Colors.black,
                      contentPadding: EdgeInsets.all(5.0),
                      hintText: "Search...",
                      suffixIcon: IconButton(
                        color: Colors.black,
                        icon: Icon(
                          Icons.search,
                        ),
                        onPressed: () {},
                      ),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20.0)))),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text(
              'Top questions',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8.0, bottom: 30),
            child: Container(
              height: 30,
              child: Expanded(
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: <Widget>[
                    tileWidget2(title2: 'All'),
                    tileWidget2(
                      title2: 'Get started',
                    ),
                    tileWidget2(title2: 'Ordering & Payment'),
                    tileWidget2(title2: 'About Us')
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                tileWidget(
                  title: " 1.How can i order?",
                  content:
                      "To place an order, open the Laundry App, select your desired laundry services, choose a convenient pickup and delivery time, and proceed to checkout. You can pay securely using various payment methods.",
                ),
                tileWidget(
                    title: '2.How do I modify or cancel an order?',
                    content: ''),
                tileWidget(
                    title: '3.How can I track my laundry order?', content: ''),
                tileWidget(
                    title: "4.Do you offer refunds or discounts?", content: ""),
                tileWidget(
                    title: '5.Is my payment information secure?', content: ''),
                tileWidget(
                    title: '6.Can I request special laundry instructions?',
                    content: ''),
                tileWidget(
                    title: '7.How do I contact customer support?', content: '')
              ],
            ),
          )
        ],
      ),
    ));
  }
}

class tileWidget extends StatelessWidget {
  const tileWidget({
    Key? key,
    required this.title,
    required this.content,
  }) : super(key: key);
  final String title;
  final String content;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 30.0, right: 30.0, top: 10),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            color: HexColor('#66BFF1')),
        // color: HexColor('#66BFF1'),
        child: ExpansionTile(
          collapsedTextColor: Colors.black,
          title: Padding(
            padding: const EdgeInsets.only(left: 55.0),
            child: Text(
              title,
              style: TextStyle(color: Colors.white),
            ),
          ),
          children: [
            Card(
                child: Container(
              decoration: BoxDecoration(color: HexColor('#66BFF1')),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    decoration: BoxDecoration(color: HexColor('#66BFF1')),
                    height: 100,
                    width: 200,
                    child: Text(
                      content,
                      style: TextStyle(color: Colors.white, fontSize: 12),
                    ),
                  )
                ],
              ),
            ))
          ],
        ),
      ),
    );
  }
}

class tileWidget2 extends StatelessWidget {
  const tileWidget2({
    Key? key,
    required this.title2,
  }) : super(key: key);
  final String title2;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0),
      child: Container(
        decoration: BoxDecoration(
            color: HexColor('#FFD9D9D9'),
            borderRadius: BorderRadius.circular(50),
            border: Border.all(width: .1)),
        // color: Colors.purple[600],
        child: Center(
            child: Padding(
          padding: EdgeInsets.only(left: 8.0, right: 8.0),
          child: Text(
            title2,
            style: TextStyle(fontSize: 18, color: Colors.black),
          ),
        )),
      ),
    );
  }
}
