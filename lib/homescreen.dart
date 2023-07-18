import 'package:demo1/help.dart';
import 'package:demo1/login.dart';
import 'package:demo1/optionlaund.dart';
import 'package:demo1/pickup.dart';
import 'package:demo1/profile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

import 'laundarybook.dart';

class NewWidget extends StatefulWidget {
  const NewWidget({super.key});

  @override
  State<NewWidget> createState() => _NewWidget();
}

class _NewWidget extends State<NewWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          IconButton(onPressed: () {}, icon: Icon(Icons.account_circle))
        ],
        toolbarOpacity: 0.7,
        backgroundColor: Color.fromARGB(255, 235, 159, 66),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(25),
                bottomRight: Radius.circular(25))),
        title: Text("WELCOME BACK, DEXTER"),
      ),
      bottomNavigationBar: Container(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 20.0),
          child: GNav(
              curve: Curves.easeOut,
              backgroundColor: Colors.black,
              color: Colors.white,
              tabBackgroundColor: Colors.grey.shade800,
              activeColor: Colors.white,
              gap: 8,
              padding: EdgeInsets.all(16),
              tabs: [
                GButton(
                  active: false,
                  activeBorder: Border(),
                  onPressed: () => {
                    Navigator.push<void>(
                        context,
                        MaterialPageRoute<void>(
                            builder: (BuildContext context) =>
                                const NewWidget()))
                  },
                  icon: (Icons.home),
                  text: 'Home',
                ),
                GButton(
                    onPressed: () => {},
                    icon: (Icons.favorite_border),
                    text: 'like'),
                GButton(
                    onPressed: () => {}, icon: (Icons.search), text: "search"),
                GButton(
                    active: true,
                    onPressed: () => {
                          Navigator.push<void>(
                              context,
                              MaterialPageRoute<void>(
                                  builder: (BuildContext context) =>
                                      const profile()))
                        },
                    icon: (Icons.settings),
                    text: 'settings'),
              ]),
        ),
      ),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Card(
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: ((context) => opWidget()),
                                ));
                          },
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.white),
                          child: Image.asset("images/washing-machine 1.png"),
                        ),
                      ),
                      Text("Book laundary")
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Card(
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: ((context) => pickup()),
                                ));
                          },
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.white),
                          child: Image.asset("images/location 1.png"),
                        ),
                      ),
                      Text("Pickup List")
                    ],
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Card(
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.white),
                          child: Image.asset("images/checklist 1.png"),
                        ),
                      ),
                      Text("laundary history")
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Card(
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.white),
                          child: Image.asset("images/get-money 1.png"),
                        ),
                      ),
                      Text("Payment History")
                    ],
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Card(
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.white),
                          child: Image.asset(
                            "images/text-file 1.png",
                          ),
                        ),
                      ),
                      Text("Book laundary")
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Card(
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.white),
                          child: Image.asset("images/checklist 1.png"),
                        ),
                      ),
                      Text("laundary")
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
