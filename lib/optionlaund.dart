import 'package:demo1/laundarybook.dart';
import 'package:demo1/profile.dart';
import 'package:flutter/material.dart';

class opWidget extends StatefulWidget {
  opWidget({super.key});

  @override
  State<opWidget> createState() => _opWidget();
}

class _opWidget extends State<opWidget> {
  int currentPageIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 34, 33, 33),
      appBar: AppBar(
        actions: <Widget>[
          IconButton(onPressed: () {}, icon: Icon(Icons.account_circle))
        ],
        toolbarOpacity: 0.7,
        backgroundColor: Color.fromARGB(255, 72, 72, 71),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(25),
                bottomRight: Radius.circular(25))),
        title: Text("We Serve at Your Best"),
      ),
      bottomNavigationBar: NavigationBar(
        onDestinationSelected: (int index) {
          setState(() {
            currentPageIndex = index;
          });
        },
        selectedIndex: currentPageIndex,
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
            icon: Icon(Icons.help_center),
            label: 'Help',
          )
        ],
      ),
      body: SafeArea(
          child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              Card(
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Laundarybook()));
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                  ),
                  child: Image.asset(
                    "images/download.png",
                    width: 100.0,
                    height: 130.0,
                  ),
                ),
              ),
              Card(
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Laundarybook()));
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                  ),
                  child: Image.asset(
                    "images/download1f.png",
                    width: 100.0,
                    height: 130.0,
                  ),
                ),
              ),
            ]),
            Card(
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Laundarybook()));
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                ),
                child: Image.asset(
                  "images/baby.png",
                  width: 100.0,
                  height: 130.0,
                ),
              ),
            ),
          ],
        ),
      )),
    );
  }
}
