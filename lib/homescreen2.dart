import 'package:demo1/help.dart';
import 'package:demo1/laundarybook.dart';
import 'package:demo1/payment.dart';
import 'package:demo1/profile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

import 'dashboard.dart';

class Homescreen extends StatefulWidget {
  @override
  State<Homescreen> createState() => _Homescreen();
}

class _Homescreen extends State<Homescreen> {
  @override
  int _selectedIndex = 0;
  static List<Widget> _widgetOptions = <Widget>[
    MyHomePage(),
    profile(),
    paymentWidget(),
    HelpWidget()
  ];
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: Container(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 20.0),
          child: GNav(
            rippleColor: Colors.grey.shade300,
            hoverColor: Colors.grey.shade100,
            gap: 8,
            activeColor: Color.fromARGB(255, 50, 101, 178),
            iconSize: 24,
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
            tabs: [
              GButton(
                icon: (Icons.home),
                text: 'Home',
              ),
              GButton(icon: (Icons.account_circle), text: 'profile'),
              GButton(icon: (Icons.wallet), text: "wallet"),
              GButton(icon: (Icons.help), text: 'help'),
            ],
            selectedIndex: _selectedIndex,
            onTabChange: (index) {
              setState(() {
                _selectedIndex = index;
              });
            },
          ),
        ),
      ),
    );
  }
}
