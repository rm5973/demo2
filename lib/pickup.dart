import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class pickup extends StatefulWidget {
  pickup({super.key});

  @override
  State<pickup> createState() => _pickup();
}

class _pickup extends State<pickup> {
  int currentPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          IconButton(onPressed: () {}, icon: Icon(Icons.location_on_outlined))
        ],
        toolbarOpacity: 0.7,
        backgroundColor: Color.fromARGB(255, 37, 210, 83),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(25),
                bottomRight: Radius.circular(25))),
        title: Text("Pick up"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [ TextField(decoration: InputDecoration(hintText:"SEARCH",icon: Icon(Icons.search)),),
            
            ExpansionTile(
              leading: Icon(Icons.mail),
              title: Text("Order Id : 265"),
              children: [
                Card(
                    child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [Text('order name : Dexter Morgen' ),Text("Date:12/3/23",)
                     , 
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [Text("Contact Number:"), Text("8378870518")],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text("Address:"),
                        Text("203 kedar,malhar appt pimple gurav pcmc garden")
                      ],
                    ),
                    Divider(
                      color: Colors.black,
                      height: 8,
                      thickness: 2,
                      endIndent: 25,
                      indent: 25,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          "Pickup partner details:",
                          style: TextStyle(fontSize: 20.0),
                        )
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [Text("Name:"), Text("Rakshit")],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [Text("Contact Number:"), Text("9348209788")],
                    ),
                    Divider(
                      color: Colors.black,
                      height: 8,
                      thickness: 2,
                      endIndent: 25,
                      indent: 25,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          "ORDER LIST :",
                          style: TextStyle(fontSize: 20.0),
                        )
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                            width: 400,
                            child: ExpansionTile(
                              title: Text("MEN"),
                              children: [
                               
                                Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        "Items",
                                        style: TextStyle(fontSize: 15.0),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        "Quantity",
                                        style: TextStyle(fontSize: 15.0),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        "Price",
                                        style: TextStyle(fontSize: 15.0),
                                      ),
                                    )
                                  ],
                                )
                               , Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        "Trousers",
                                        style: TextStyle(fontSize: 15.0),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        "6",
                                        style: TextStyle(fontSize: 15.0),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        "300",
                                        style: TextStyle(fontSize: 15.0),
                                      ),
                                    )
                                  ],
                                )
                              , Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        "Shirt",
                                        style: TextStyle(fontSize: 15.0),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        "      "+"5",
                                        style: TextStyle(fontSize: 15.0),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        "200",
                                        style: TextStyle(fontSize: 15.0),
                                      ),
                                    )
                                  ],
                                )
                              , Divider(
                      color: Colors.black,
                      height: 8,
                      thickness: 2,
                      endIndent: 15,
                      indent: 15,
                    ),
                              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        "Total :",
                                        style: TextStyle(fontSize: 15.0),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        "     "+"11",
                                        style: TextStyle(fontSize: 15.0),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        "500",
                                        style: TextStyle(fontSize: 15.0),
                                      ),
                                    )
                                  ],
                                )
                              ],
                            ))
                      ],
                    ),
                    
                  ],
                ))
              ],
            )
          , ExpansionTile(
              leading: Icon(Icons.mail),
              title: Text("Order Id : 265"),
              children: [
                Card(
                    child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [Text('order name : Dexter Morgen' ),Text("Date:12/3/23",)
                     , 
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [Text("Contact Number:"), Text("8378870518")],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text("Address:"),
                        Text("203 kedar,malhar appt pimple gurav pcmc garden")
                      ],
                    ),
                    Divider(
                      color: Colors.black,
                      height: 8,
                      thickness: 2,
                      endIndent: 25,
                      indent: 25,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          "Pickup partner details:",
                          style: TextStyle(fontSize: 20.0),
                        )
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [Text("Name:"), Text("Rakshit")],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [Text("Contact Number:"), Text("9348209788")],
                    ),
                    Divider(
                      color: Colors.black,
                      height: 8,
                      thickness: 2,
                      endIndent: 25,
                      indent: 25,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          "ORDER LIST :",
                          style: TextStyle(fontSize: 20.0),
                        )
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                            width: 400,
                            child: ExpansionTile(
                              title: Text("MEN"),
                              children: [
                               
                                Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        "Items",
                                        style: TextStyle(fontSize: 15.0),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        "Quantity",
                                        style: TextStyle(fontSize: 15.0),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        "Price",
                                        style: TextStyle(fontSize: 15.0),
                                      ),
                                    )
                                  ],
                                )
                               , Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        "Trousers",
                                        style: TextStyle(fontSize: 15.0),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        "6",
                                        style: TextStyle(fontSize: 15.0),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        "300",
                                        style: TextStyle(fontSize: 15.0),
                                      ),
                                    )
                                  ],
                                )
                              , Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        "Shirt",
                                        style: TextStyle(fontSize: 15.0),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        "      "+"5",
                                        style: TextStyle(fontSize: 15.0),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        "200",
                                        style: TextStyle(fontSize: 15.0),
                                      ),
                                    )
                                  ],
                                )
                              , Divider(
                      color: Colors.black,
                      height: 8,
                      thickness: 2,
                      endIndent: 15,
                      indent: 15,
                    ),
                              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        "Total :",
                                        style: TextStyle(fontSize: 15.0),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        "     "+"11",
                                        style: TextStyle(fontSize: 15.0),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        "500",
                                        style: TextStyle(fontSize: 15.0),
                                      ),
                                    )
                                  ],
                                )
                              ],
                            ))
                      ],
                    ),
                    
                  ],
                ))
              ],
            )
          ],
        ),
      ),
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
            icon: Icon(
              Icons.account_box_outlined,
            ),
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
    );
  }
}

// Container(
//                 width: double.infinity,
//                 height: 40.0,
//                 color: Color.fromARGB(255, 220, 212, 212),
//                 margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
//                 child: Row(
//                   children: [TextField(decoration: InputDecoration(hintText: 'search'),), ],
//                 )),