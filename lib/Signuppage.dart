import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:demo1/BlueBackgroundPage.dart';
import 'package:demo1/login.dart';
import 'package:demo1/phone_input_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'phone_input_page.dart';
//import 'BlueBackgroundPage.dart';

class Signup extends StatefulWidget {
  @override
  State<Signup> createState() => _MyAppState();
}

class _MyAppState extends State<Signup> {
  String? _nameError;
  String? _emailError;
  String? _passwordError;
  bool _passwordVisible = false;

  void _validateInputs() async {
    if (_nameController.text.isEmpty ||
        _emailController.text.isEmpty ||
        _passwordController.text.isEmpty) {
      setState(() {
        _nameError =
            _nameController.text.isEmpty ? "Do not leave it empty" : null;
        _emailError =
            _emailController.text.isEmpty ? "Do not leave it empty" : null;
        _passwordError =
            _passwordController.text.isEmpty ? "Do not leave it empty" : null;
      });
      return;
    }

    try {
      UserCredential userCredential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: _emailController.text,
        password: _passwordController.text,
      );

      // Save user data to Firestore
      await FirebaseFirestore.instance
          .collection('users')
          .doc(userCredential.user!.uid)
          .set({
        'name': _nameController.text,
        'email': _emailController.text,
      });
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => BlueBackgroundPage()),
      );

      // Clear input fields and errors
      _nameController.clear();
      _emailController.clear();
      _passwordController.clear();
      setState(() {
        _nameError = null;
        _emailError = null;
        _passwordError = null;
      });

      // User created successfully
      // You can navigate to a new screen or show a success message here
    } catch (e) {
      print('Error creating user: $e');
      // Handle error (e.g., show an error message)
    }
  }

  TextEditingController _nameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('images/signupbackground.jpeg'),
                fit: BoxFit.fill,
              ),
            ),
          ),
          SafeArea(
            child: ListView(
              padding: EdgeInsets.symmetric(horizontal: 20),
              children: [
                SizedBox(height: 15),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [],
                ),
                SizedBox(height: 70),
                Container(
                  height: 38,
                  width: 117,
                  child: Text(
                    "Sign up",
                    style: TextStyle(
                      fontSize: 31,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(height: 60),
                TextFormField(
                  controller: _nameController,
                  decoration: InputDecoration(
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(7),
                    ),
                    hintText: 'Name',
                    hintStyle: TextStyle(
                        color: Colors.grey, fontStyle: FontStyle.normal),
                    prefixIcon: Icon(Icons.person, color: Colors.black),
                    filled: true,
                    fillColor: Colors.white,
                    errorText: _nameError,
                  ),
                ),
                SizedBox(height: 30),
                TextFormField(
                  controller: _emailController,
                  decoration: InputDecoration(
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(7),
                    ),
                    hintText: 'tim@gmail.com',
                    hintStyle: TextStyle(
                        color: Colors.grey, fontStyle: FontStyle.normal),
                    prefixIcon: Icon(Icons.email, color: Colors.black),
                    filled: true,
                    fillColor: Colors.white,
                    errorText: _emailError,
                  ),
                ),
                SizedBox(height: 30),
                TextFormField(
                  controller: _passwordController,
                  decoration: InputDecoration(
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(7),
                    ),
                    hintText: 'Pick a strong password',
                    hintStyle: TextStyle(
                        color: Colors.grey, fontStyle: FontStyle.normal),
                    prefixIcon: Icon(Icons.lock, color: Colors.black),
                    filled: true,
                    fillColor: Colors.white,
                    suffixIcon: IconButton(
                      icon: Icon(
                        _passwordVisible
                            ? Icons.visibility
                            : Icons.visibility_off,
                        color: Colors.black,
                      ),
                      onPressed: () {
                        setState(() {
                          _passwordVisible = !_passwordVisible;
                        });
                      },
                    ),
                    errorText: _passwordError,
                  ),
                  obscureText: !_passwordVisible,
                ),
                SizedBox(height: 30),
                Column(
                  children: [
                    Row(
                      children: [
                        Text(
                          "By signing up, you're agreeing to our",
                          style: TextStyle(fontSize: 13, fontFamily: 'Inter'),
                        ),
                        InkWell(
                          onTap: () {},
                          child: Text(
                            " Terms & Conditions",
                            style: TextStyle(
                                fontSize: 13,
                                fontFamily: 'Inter',
                                color: Colors.blue),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Text(
                          "and",
                          style: TextStyle(fontSize: 13),
                        ),
                        InkWell(
                          onTap: () {},
                          child: Text(
                            " Privacy Policy",
                            style: TextStyle(fontSize: 13, color: Colors.blue),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                InkWell(
                  onTap: () {
                    _validateInputs();
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(7),
                        gradient: LinearGradient(
                          colors: [
                            Color(0xFF441EEE),
                            Color(0xFF8830E6),
                            Color(0xFF5C27F6),
                            Color(0xFF441EEE)
                          ],
                        ),
                      ),
                      height: 55,
                      width: 400,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Create Account",
                            style: TextStyle(fontSize: 25, color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 40),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Already Have an Account?",
                          style: TextStyle(fontSize: 14),
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.of(context).pushReplacement(
                                MaterialPageRoute(
                                    builder: (context) => loginPage()));
                          },
                          child: Text(
                            " Log In",
                            style: TextStyle(fontSize: 14, color: Colors.blue),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 100),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(home: Signup()));
}
