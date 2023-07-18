import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class Laundarybook extends StatefulWidget {
  const Laundarybook({super.key});

  @override
  State<Laundarybook> createState() => _Laundarybook();
}

class _Laundarybook extends State<Laundarybook> {
  int currentPageIndex = 0; 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarOpacity: 0.7,
        backgroundColor: Color.fromARGB(255, 39, 43, 156),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(25),
                bottomRight: Radius.circular(25))),
        title: Text("Book laundary"),
      ),
      backgroundColor: Color.fromARGB(255, 237, 231, 243),
      body: ListView(children: [
        ExpansionTile(
          leading: Icon(Icons.mail),
          title: Text("Trousers"),
          children: [
            Card(
                child: Row( mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Icon(Icons.add),
                ),
                Card(
                  child: SizedBox(
                    width: 200.0,
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'Quantity',
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Icon(Icons.remove),
                )
              ],
            ))
          ],
        )
        ,ExpansionTile(
          leading: Icon(Icons.mail),
          title: Text("Shirt"),
          children: [
            Card(
                child: Row( mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Icon(Icons.add),
                ),
                Card(
                  child: SizedBox(
                    width: 200.0,
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'Quantity',
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Icon(Icons.remove),
                )
              ],
            ))
          ],
        )
        , ExpansionTile(
          leading: Icon(Icons.mail),
          title: Text("Shorts"),
          children: [
            Card(
                child: Row( mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Icon(Icons.add),
                ),
                Card(
                  child: SizedBox(
                    width: 200.0,
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'Quantity',
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Icon(Icons.remove),
                )
              ],
            ))
          ],
        )
      , ExpansionTile(
          leading: Icon(Icons.mail),
          title: Text("Blazers"),
          children: [
            Card(
                child: Row( mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Icon(Icons.add),
                ),
                Card(
                  child: SizedBox(
                    width: 200.0,
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'Quantity',
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Icon(Icons.remove),
                )
              ],
            ))
          ],
        )
        , ExpansionTile(
          leading: Icon(Icons.mail),
          title: Text("Jacket"),
          children: [
            Card(
                child: Row( mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Icon(Icons.add),
                ),
                Card(
                  child: SizedBox(
                    width: 200.0,
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'Quantity',
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Icon(Icons.remove),
                )
              ],
            ))
          ],
        )
      ]),
    bottomNavigationBar: NavigationBar(
        onDestinationSelected: (int index) {
          setState(() {
            currentPageIndex = index;
          });
        },
        selectedIndex: currentPageIndex,
        destinations: const <Widget>[
          NavigationDestination(
            icon: Icon(Icons.home),
            label: 'Explore',
          ),
          NavigationDestination(
            icon: Icon(Icons.account_box_outlined,),
            label: 'Profile',
          ),
          NavigationDestination( 
            selectedIcon: Icon(Icons.settings),
            icon: Icon(Icons.settings),
            label: 'Settings',
          ), NavigationDestination(
            selectedIcon: Icon(Icons.help_center),
            icon: Icon(Icons.help_center),
            label: 'Help',
          )
        ],
      ),
    );
  }
}
