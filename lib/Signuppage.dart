import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

void main() {
  runApp(
      Signup()
  );
}
class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _MyAppState();
}

class _MyAppState extends State<Signup> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: Scaffold(
      body: SafeArea(child: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('Images/signupbackground.jpeg'),fit: BoxFit.fill
          ),
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 15,right: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  IconButton(
                    iconSize: 30,
                    
                    icon: const Icon(Icons.close,color: Colors.white,),
                    onPressed: () {},
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 70),
              child: Container(
                height: 38,
                width: 117,
                child: Text("Sign up",style: TextStyle(fontSize: 31,color: Colors.black,fontWeight: FontWeight.bold),),
              ),
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
                                            borderRadius: BorderRadius.circular(7)),
                                        hintText: 'Name',
                                        hintStyle: TextStyle(
                                            color: Colors.grey,
                                            fontStyle: FontStyle.normal),
                                        prefixIcon:
                                            Icon(Icons.person, color: Colors.black),
                                        filled: true,
                                        fillColor: Colors.white,
                                      ),
                                    ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 30),
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
                                            borderRadius: BorderRadius.circular(7)),
                                        hintText: 'tim@gmail.com',
                                        hintStyle: TextStyle(
                                            color: Colors.grey,
                                            fontStyle: FontStyle.normal),
                                        prefixIcon:
                                            Icon(Icons.email, color: Colors.black),
                                        filled: true,
                                        fillColor: Colors.white,
                                      ),
                                    ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 30),
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
                                            borderRadius: BorderRadius.circular(7)),
                                        hintText: 'Pick a strong password',
                                        hintStyle: TextStyle(
                                            color: Colors.grey,
                                            fontStyle: FontStyle.normal),
                                        prefixIcon:
                                            Icon(Icons.lock, color: Colors.black),
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
            InkWell(
              splashColor: Colors.purple,
              onTap: () {},
              child: Padding(
                padding: const EdgeInsets.only(left: 35,right: 35,top: 40),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
              
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(7),
                        color: Colors.purple.shade300
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
              padding: const EdgeInsets.only(top: 40),
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

