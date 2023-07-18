// ignore_for_file: unnecessary_new

import 'package:clippy_flutter/clippy_flutter.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:demo1/homescreen.dart';
import 'package:demo1/profile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class helpWidget extends StatefulWidget {
  const helpWidget({super.key});

  @override
  State<helpWidget> createState() => _helpWidget();
}

class _helpWidget extends State<helpWidget> {
  int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: Container(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 20.0),
        child: GNav(
            curve: Curves.easeInOut,
            backgroundColor: Colors.black,
            color: Colors.white,
            tabBackgroundColor: Colors.grey.shade800,
            activeColor: Colors.white,
            gap: 8,
            padding: EdgeInsets.all(16),
            tabs: [
              GButton(
                onPressed: () => {
                  Navigator.push<void>(
                      context,
                      MaterialPageRoute<void>(
                          builder: (BuildContext context) => const NewWidget()))
                },
                icon: (Icons.home),
                text: 'home',
              ),
              GButton(
                  onPressed: () => {},
                  icon: (Icons.favorite_border),
                  active: true,
                  text: 'like'),
              GButton(
                  onPressed: () => {}, icon: (Icons.search), text: "search"),
              GButton(
                  onPressed: () => {},
                  icon: (Icons.settings),
                  active: true,
                  text: 'settings'),
            ],
            selectedIndex: _selectedIndex,
            onTabChange: (index) {
              setState(() {
                _selectedIndex = index;
              });
            }),
      ),
    ));
  }
}
