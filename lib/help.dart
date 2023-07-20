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
      body: SafeArea(child: Text("help")),
    );
  }
}
