import 'package:demo1/homescreen2.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

void main() {
  runApp(
      MyApp()
  );
}
class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: Scaffold(
      body: SafeArea(child: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/background.jpg'),fit: BoxFit.cover
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                iconSize: 30,
                icon: const Icon(Icons.arrow_back),
                onPressed: () {
                  Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (BuildContext context)=>Homescreen()));
                },
                ),
              IconButton(
                iconSize: 40,
                onPressed: () {},
                icon: const Icon(Icons.more_horiz),
                ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 50,left: 25),
            child: Container(
              height: 20,
              width: 150,
              child: Text('Details about',style: TextStyle(fontSize: 19,fontWeight: FontWeight.bold,color: Colors.black),),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 25,bottom: 32),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  height: 25,
                  width: 130,
                  child: Text('Order #123',style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold,color: Colors.black),),
                ),
                IconButton(
                  iconSize: 30,
                  onPressed: () {},
                  icon: const Icon(Icons.expand_more),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20,right: 20),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.all(Radius.circular(20))
              ),
              // margin: EdgeInsets.only(left: 28,top: 158,right: 28,bottom: 178),
              height: 467.0,
              width: 367.0,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
          
                  Padding(
                    padding: const EdgeInsets.only(left: 25,top: 30),
                    child: Container(
                      height: 23,
                      width: 200.0,
                      child: Text('Order Details',style: TextStyle(fontSize: 19,color: Colors.black,fontWeight: FontWeight.bold),),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 25,top: 15),
                    child: Container(
                      height: 18,
                      width: 200,
                      child: Text('Washing and Folding',style: TextStyle(fontSize: 15),),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 25,top: 15),
                    child: Container(
                      height: 18,
                      width: 200,
                      child: Text('3 x T-shirt (man)',style: TextStyle(fontSize: 15),),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 25,top: 15),
                    child: Container(
                      height: 18,
                      width: 200,
                      child: Text('2 x Shirt (man)',style: TextStyle(fontSize: 15),),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 25,top: 15),
                    child: Container(
                      height: 18,
                      width: 200,
                      child: Text('4 x Pants (man)',style: TextStyle(fontSize: 15),),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 25,top: 15),
                    child: Container(
                      height: 18,
                      width: 200,
                      child: Text('1 x Jeans (man)',style: TextStyle(fontSize: 15),),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 25,top: 30),
                    child: Container(
                      height: 23,
                      width: 200,
                      child: Text('IRONING',style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold,color: Colors.black),),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 25,top: 15),
                    child: Container(
                      
                      height: 18,
                      width: 200,
                      child: Text('3 x T-shirts (man)',style: TextStyle(fontSize: 15),),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 25,top: 30),
                    child: Container(
                      height: 23,
                      width: 200,
                      child: Text('Subtotal',style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold,color: Colors.black),),
                    ),
                  ),
                  
                  Padding(
                    padding: const EdgeInsets.only(left: 25,top: 15),
                    child: Container(
                      height: 23,
                      width: 200,
                      child: Text('Delivery',style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold,color: Colors.black),),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 25,top: 40),
                    child: Container(
                      height: 23,
                      width: 200.0,
                      child: Text('Total',style: TextStyle(fontSize: 19,color: Colors.black,fontWeight: FontWeight.bold),),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20,top: 21,right: 20),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.all(Radius.circular(20))
              ),
              height: 122,
              width: 367,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 25,top: 10),
                    child: Container(
                      child: Text('Your clothes are now washing',style: TextStyle(fontSize: 15,color: Colors.black,fontWeight: FontWeight.bold),),
                    ),
                  ),
                  Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                    padding: const EdgeInsets.only(left: 25,top: 20),
                    child: Container(
                          child: Text('Estimated delivery',style: TextStyle(fontSize: 15,color: Colors.black,),),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 25),
                    child: Container(
                          child: Text('12 Jan 2023',style: TextStyle(fontSize: 15,color: Colors.black,),),
                    ),
                  ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 120),
                        child: Container(
                          height: 78.0,
                          width: 67.0,
                          child: Image(image: AssetImage('images/Washing Machine.png')),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],),
      ),),
    ),);
  }
}