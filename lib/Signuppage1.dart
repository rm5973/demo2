import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

void main() {
  runApp(
      Signup1()
  );
}
class Signup1 extends StatefulWidget {
  const Signup1({super.key});

  @override
  State<Signup1> createState() => _MyAppState();
}

class _MyAppState extends State<Signup1> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: Scaffold(
      body: SafeArea(child: Container(
        width: double.infinity,
        height: double.infinity,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 15,right: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  IconButton(
                    iconSize: 30,
                    
                    icon: const Icon(Icons.arrow_back),
                    onPressed: () {},
                  ),
                ],
              ),
            ),
            Container(
              
              child: Image.asset('images/2101.i039.007 1.png')
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 35,right: 35,top: 10),
                  child: Container(
                    width: 500,
                    child: Text("Welcome to",style: TextStyle(fontSize: 28,fontWeight: FontWeight.bold),),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 35,right: 35),
                  child: Container(
                    child: Text("An amusement park for your clothes",style: TextStyle(fontSize: 15),),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 60),
              child: Padding(
                padding: const EdgeInsets.only(left: 35,right: 35),
                child: Container(
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black38,
                        blurRadius: 25,
                        offset: const Offset(0, 10)
                      ),
                    ],
                  ),
                  child: TextFormField(
                                      decoration: InputDecoration(
                                        contentPadding: EdgeInsets.fromLTRB(
                                            20.0, 10.0, 20.0, 10.0),
                                        border: OutlineInputBorder(
                                            borderRadius: BorderRadius.circular(10)),
                                        hintText: 'Name',
                                        hintStyle: TextStyle(
                                            color: Colors.grey,
                                            fontStyle: FontStyle.normal),
                                        
                                        filled: true,
                                        fillColor: Colors.white,
                                        suffixIcon: Icon(Icons.check_box,color: Colors.blue,)
                                      ),
                                    ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 50),
              child: Padding(
                padding: const EdgeInsets.only(left: 35,right: 35),
                child: Container(
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black38,
                        blurRadius: 25,
                        offset: const Offset(0, 10)
                      ),
                    ],
                  ),
                  child: TextFormField(
                                      decoration: InputDecoration(
                                        contentPadding: EdgeInsets.fromLTRB(
                                            20.0, 10.0, 20.0, 10.0),
                                        border: OutlineInputBorder(
                                            borderRadius: BorderRadius.circular(10)),
                                        hintText: 'tim@gmail.com',
                                        hintStyle: TextStyle(
                                            color: Colors.grey,
                                            fontStyle: FontStyle.normal),
                                        
                                        filled: true,
                                        fillColor: Colors.white,
                                      ),
                                    ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 50),
              child: Padding(
                padding: const EdgeInsets.only(left: 35,right: 35),
                child: Container(
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black38,
                        blurRadius: 25,
                        offset: const Offset(0, 10)
                      ),
                    ],
                  ),
                  child: TextFormField(
                                      decoration: InputDecoration(
                                        contentPadding: EdgeInsets.fromLTRB(
                                            20.0, 10.0, 20.0, 10.0),
                                        border: OutlineInputBorder(
                                            borderSide: BorderSide(color: Colors.white),
                                            borderRadius: BorderRadius.circular(10)),
                                        hintText: 'Pick a strong password',
                                        hintStyle: TextStyle(
                                            color: Colors.grey,
                                            fontStyle: FontStyle.normal),
                                        
                                        filled: true,
                                        fillColor: Colors.white,
                                        suffixIcon: Icon(Icons.visibility_off)
                                      ),
                                    ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 35,top: 30,right: 35),
              child: Column(
                children: [
                  Container(
                    child: Row(
                      children: [
                        Text("By signing up, you're agreeing to our",style: TextStyle(fontSize: 13,fontFamily: 'Inter'),),
                        InkWell(
                          onTap: () {},
                          child: Text(" Terms & Conditions",style: TextStyle(fontSize: 13,fontFamily: 'Inter',color: Colors.blue),
                          ),
                          ),
                        
                      
                      ],
                    ),
                  ),
                  Row(
                    children: [
                      Text("and",style: TextStyle(fontSize: 13),),
                      InkWell(
                          onTap: () {},
                          child: Text(" Privacy Policy",style: TextStyle(fontSize: 13,color: Colors.blue),),
                        ),
                    ],
                  ),
                        
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 30,left: 35,right: 35),
              child: InkWell(
                splashColor: Colors.transparent,
                onTap: () {},
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.blue,
                      ),
                      height: 55,
                      width: 400,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Create Account",style: TextStyle(fontSize: 25,color: Colors.white),),
                        ],
                      ))
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 30),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Already Have an Account?",style: TextStyle(fontSize: 14),),
                      InkWell(
                        onTap: () {},
                        child: Text(" Log In",style: TextStyle(fontSize: 14,color: Colors.blue),),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),),
    ),);
  }
}

