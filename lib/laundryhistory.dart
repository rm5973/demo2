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
          Expanded(
            child: Container(
              color: Colors.transparent,
              child: ListView(
                children: [
                  tileWidget(
                    title: 'Order#123',
                    content:
                        "",
                  ),
                  tileWidget(
                      title: 'Order#124',
                      content: ''),
                ]
              ),
            ),
          ),
          
          
        ],),
      ),),
    ),);
  }
}

class tileWidget extends StatelessWidget {
  const tileWidget({
    Key? key,
    required this.title,
    required this.content,
  }) : super(key: key);
  final String title;
  final String content;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            color: Colors.transparent),
        // color: HexColor('#66BFF1'),
        child: ExpansionTile(
         // collapsedTextColor: Color.fromARGB(255, 233, 10, 10),
          title: Padding(
            padding: const EdgeInsets.only(left: 20.0),
            child: Text(
              title,
              style: TextStyle(color: Colors.black,fontSize: 25,fontWeight: FontWeight.bold),
            ),
          ),
          children: [
            Container(
              width: 500,

                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Container(
                              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  color: Colors.grey),
                              child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                          
                    Padding(
                      padding: const EdgeInsets.only(left:20,top: 30),
                      child: Container(
                        height: 23,
                        width: 200.0,
                        child: Text('Order Details',style: TextStyle(fontSize: 19,color: Colors.black,fontWeight: FontWeight.bold),),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 15,left: 20),
                      child: Container(
                        height: 18,
                        width: 200,
                        child: Text('Washing and Folding',style: TextStyle(fontSize: 15),),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 15,left: 20),
                      child: Container(
                        height: 18,
                        width: 200,
                        child: Text('3 x T-shirt (man)',style: TextStyle(fontSize: 15),),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 15,left: 20),
                      child: Container(
                        height: 18,
                        width: 200,
                        child: Text('2 x Shirt (man)',style: TextStyle(fontSize: 15),),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 15,left: 20),
                      child: Container(
                        height: 18,
                        width: 200,
                        child: Text('4 x Pants (man)',style: TextStyle(fontSize: 15),),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 15,left: 20),
                      child: Container(
                        height: 18,
                        width: 200,
                        child: Text('1 x Jeans (man)',style: TextStyle(fontSize: 15),),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 30,left: 20),
                      child: Container(
                        height: 23,
                        width: 200,
                        child: Text('IRONING',style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold,color: Colors.black),),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 15,left: 20),
                      child: Container(
                        
                        height: 18,
                        width: 200,
                        child: Text('3 x T-shirts (man)',style: TextStyle(fontSize: 15),),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 30,left: 20),
                      child: Container(
                        height: 23,
                        width: 200,
                        child: Text('Subtotal',style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold,color: Colors.black),),
                      ),
                    ),
                    
                    Padding(
                      padding: const EdgeInsets.only(top: 15,left: 20),
                      child: Container(
                        height: 23,
                        width: 200,
                        child: Text('Delivery',style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold,color: Colors.black),),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 40,left: 20),
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
                      ),
           SizedBox(height: 10,),
          tilepart2()
          ]
                    )
                  
                              ),
                            );
                
                
          
        
      
    
  }
}


class tilepart2
 extends StatelessWidget {
  const tilepart2
  ({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
                            padding: const EdgeInsets.only(),
                            child: Container(
                              decoration: BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.all(Radius.circular(10))
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
                          );
                  
                  ;
  }
}