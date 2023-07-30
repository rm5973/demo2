import 'dart:ffi';

import 'package:demo1/CartNotifier.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'login.dart';

void main() {
  runApp(ChangeNotifierProvider(
      create: (_) => CartNotifier(),
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'laundary app',
        home: loginPage(),
      )));
}








// class _NavigationExampleState extends State<NavigationExample> {
//   int currentPageIndex = 0;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       bottomNavigationBar: NavigationBar(
//         onDestinationSelected: (int index) {
//           setState(() {
//             currentPageIndex = index;
//           });
//         },
//         selectedIndex: currentPageIndex,
//         destinations: const <Widget>[
//           NavigationDestination(
//             icon: Icon(Icons.explore),
//             label: 'Explore',
//           ),
//           NavigationDestination(
//             icon: Icon(Icons.commute),
//             label: 'Commute',
//           ),
//           NavigationDestination(
//             selectedIcon: Icon(Icons.bookmark),
//             icon: Icon(Icons.bookmark_border),
//             label: 'Saved',
//           ),
//         ],
//       ),
//       body: <Widget>[
//         Container(
//           color: Colors.red,
//           alignment: Alignment.center,
//           child: const Text('Page 1'),
//         ),
//         Container(
//           color: Colors.green,
//           alignment: Alignment.center,
//           child: const Text('Page 2'),
//         ),
//         Container(
//           color: Colors.blue,
//           alignment: Alignment.center,
//           child: const Text('Page 3'),
//         ),
//       ][currentPageIndex],
//     );
//   }
// }