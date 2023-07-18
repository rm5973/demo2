import 'package:demo1/help.dart';
import 'package:demo1/optionlaund.dart';
import 'package:demo1/pickup.dart';
import 'package:demo1/profile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
      bottomNavigationBar: NavigationBar(
        destinations: <Widget>[
          NavigationDestination(
            icon: Icon(Icons.home),
            label: 'Explore',
          ),
          NavigationDestination(
            // ignore: prefer_const_constructors
            icon: IconButton(
                onPressed: () {
                  Navigator.push<void>(
                    context,
                    MaterialPageRoute<void>(
                      builder: (BuildContext context) => const profile(),
                    ),
                  );
                },
                icon: Icon(Icons.contact_emergency_outlined)),
            label: 'Profile',
          ),
          NavigationDestination(
            selectedIcon: Icon(Icons.settings),
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
          NavigationDestination(
            selectedIcon: Icon(Icons.help_center),
            icon: IconButton(
                onPressed: () {
                  Navigator.push<void>(
                    context,
                    MaterialPageRoute<void>(
                      builder: (BuildContext context) => const helpWidget(),
                    ),
                  );
                },
                icon: Icon(Icons.help_center)),
            label: 'Help',
          )
        ],
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
