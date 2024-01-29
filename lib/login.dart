import 'package:demo1/Signuppage.dart';
import 'package:demo1/homescreen2.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:hexcolor/src/hexcolor_base.dart';
import 'package:line_icons/line_icons.dart';

class loginPage extends StatefulWidget {
  const loginPage({super.key});

  @override
  State<loginPage> createState() => _loginPageState();
}

class _loginPageState extends State<loginPage> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  static Future<User?> loginUsingEmailPassword(
      {required String email,
      required String password,
      required BuildContext context}) async {
    FirebaseAuth auth = FirebaseAuth.instance;
    User? user;
    try {
      UserCredential userCredential = await auth.signInWithEmailAndPassword(
          email: email, password: password);
      user = userCredential.user;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print("no user found for that email");
      }
    }
    return user;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () {
          // call this method here to hide soft keyboard
          FocusScope.of(context).requestFocus(new FocusNode());
        },
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Stack(
                children: [
                  Container(
                    padding: EdgeInsets.only(top: 910),
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage('images/Vector 2.png'))),
                  ),
                  Container(
                    //padding: EdgeInsets.fromLTRB(0,550,0, 1),
                    child: Stack(
                      children: [
                        Container(
                          padding: EdgeInsets.fromLTRB(0, 500, 0, 1),
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  fit: BoxFit.fill,
                                  image: AssetImage('images/Vector 1.png'))),
                        ),
                        Container(
                          padding: EdgeInsets.fromLTRB(50, 130, 50, 50),
                          child: Column(
                            children: [
                              Text(
                                'Login',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 24),
                              ),
                              SizedBox(
                                height: 40,
                              ),
                              TextFormField(
                                controller: _emailController,
                                decoration: InputDecoration(
                                  contentPadding: EdgeInsets.fromLTRB(
                                      20.0, 10.0, 20.0, 10.0),
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(25)),
                                  hintText: 'Email',
                                  hintStyle: TextStyle(
                                      color: Colors.grey,
                                      fontStyle: FontStyle.normal),
                                  prefixIcon:
                                      Icon(Icons.person, color: Colors.grey),
                                  filled: true,
                                  fillColor: Colors.white,
                                ),
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              TextFormField(
                                controller: _passwordController,
                                obscureText: true,
                                decoration: InputDecoration(
                                  contentPadding: EdgeInsets.fromLTRB(
                                      20.0, 10.0, 20.0, 10.0),
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(25)),
                                  hintText: 'Password',
                                  hintStyle: TextStyle(
                                      color: Colors.grey,
                                      fontStyle: FontStyle.normal),
                                  prefixIcon:
                                      Icon(Icons.lock, color: Colors.grey),
                                  filled: true,
                                  fillColor: Colors.white,
                                ),
                              ),
                              SizedBox(
                                height: 42,
                              ),
                              SizedBox(
                                width: 250,
                                height: 30,
                                child: ElevatedButton(
                                    onPressed: () async {
                                      // Replace this with your login logic
                                      User? user =
                                          await loginUsingEmailPassword(
                                              email: _emailController.text,
                                              password:
                                                  _passwordController.text,
                                              context: context);
                                      print(user);
                                      if (user != null) {
                                        Navigator.of(context).pushReplacement(
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    Homescreen()));
                                      }
                                    },
                                    child: Text('Login'),
                                    style: ButtonStyle(
                                      backgroundColor:
                                          MaterialStateProperty.all<Color>(
                                              HexColor('#6A74CF')),
                                      shape: MaterialStateProperty.all<
                                              RoundedRectangleBorder>(
                                          RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(20),
                                      )),
                                    )),
                              ),
                              SizedBox(
                                height: 12,
                              ),
                              TextButton(
                                  onPressed: () {},
                                  child: const Text(
                                    'Forgot your password?',
                                    style: TextStyle(color: Colors.white),
                                  )),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text('Dont have account?'),
                                  TextButton(
                                      onPressed: () {},
                                      child: TextButton(
                                          onPressed: () {
                                            Navigator.of(context)
                                                .pushReplacement(
                                                    MaterialPageRoute(
                                                        builder: (context) =>
                                                            Signup()));
                                          },
                                          child: const Text(
                                            'SIGN UP',
                                            style: TextStyle(
                                                color: Color.fromARGB(
                                                    255, 20, 121, 215)),
                                          )))
                                ],
                              ),
                            ],
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.fromLTRB(2, 600, 2, 1),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'or connect with',
                                style: TextStyle(color: HexColor('#7A7A7A')),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  // SizedBox(width: 25,),
                                  Container(
                                    width: 130,
                                    child: ElevatedButton(
                                      onPressed: () {},
                                      child: Row(
                                        children: [
                                          Icon(Icons.facebook),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                left: 8.0),
                                            child: Text('facebook'),
                                          ),
                                        ],
                                      ),
                                      style: ButtonStyle(
                                        backgroundColor:
                                            MaterialStateProperty.all<Color>(
                                                HexColor('#35A6EF')),
                                        shape: MaterialStateProperty.all<
                                                RoundedRectangleBorder>(
                                            RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                        )),
                                      ),
                                    ),
                                  ),
                                  // SizedBox(width: 10,),
                                  Container(
                                    width: 130,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(25))),
                                    child: ElevatedButton(
                                      onPressed: () {},
                                      child: Row(
                                        children: [
                                          Icon(
                                            LineIcons.twitter,
                                            size: 18,
                                          ),
                                          SizedBox(
                                            width: 7,
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                left: 8.0),
                                            child: Text('twitter'),
                                          ),
                                        ],
                                      ),
                                      style: ButtonStyle(
                                        backgroundColor:
                                            MaterialStateProperty.all<Color>(
                                                HexColor('#5073B5')),
                                        shape: MaterialStateProperty.all<
                                                RoundedRectangleBorder>(
                                            RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                        )),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
