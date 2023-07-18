import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'homescreen.dart';


class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircleAvatar(
            radius: 50.0,
            child: Icon(
              Icons.account_circle,
              color: Color.fromARGB(255, 245, 244, 244),
              size: 100.0,
            ),
            backgroundColor: Colors.white,
          ),
          Text(
            "SIGN IN",
            style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold),
          ),
          const Card(
            color: Colors.white,
            margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
            child: Padding(
              padding: EdgeInsets.all(10.0),
              child: ListTile(
                leading: Icon(
                  Icons.mail,
                  color: Colors.teal,
                ),
                title: Text(
                  'Username',
                  style: TextStyle(
                    color: Color.fromARGB(255, 0, 0, 0),
                    //fontFamily: 'Source-sans-pro',
                    fontSize: 20.0,
                  ),
                ),
              ),
            ),
          ),
          const Card(
            color: Colors.white,
            margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
            child: Padding(
              padding: EdgeInsets.all(10.0),
              child: ListTile(
                leading: Icon(
                  Icons.mail,
                  color: Colors.teal,
                ),
                title: Text(
                  'Password',
                  style: TextStyle(
                    color: Color.fromARGB(255, 0, 0, 0),
                    //fontFamily: 'Source-sans-pro',
                    fontSize: 20.0,
                  ),
                ),
              ),
            ),
          ),
            TextButton(style: TextButton.styleFrom( primary: Colors.white, backgroundColor: Colors.blueAccent),
              child: Text("LOG IN"),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: ((context) => const NewWidget()),
                    )
                    );
              },
            ),
          
        ],
      )),
    );
  }
}