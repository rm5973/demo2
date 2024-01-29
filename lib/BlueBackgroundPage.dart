import 'dart:math';
import 'package:demo1/twilio_service.dart';
import 'package:demo1/login.dart';
import 'package:flutter/material.dart';
import 'package:flutter_material_pickers/flutter_material_pickers.dart';
import 'package:twilio_flutter/twilio_flutter.dart';

import 'otp_generator.dart';

class BlueBackgroundPage extends StatefulWidget {
  @override
  _BlueBackgroundPageState createState() => _BlueBackgroundPageState();
}

class _BlueBackgroundPageState extends State<BlueBackgroundPage> {
  TwilioServices twilioservices = TwilioServices();
  String otpl = OTPGenerator.generateOTP();
  TextEditingController _phoneController = TextEditingController();
  bool _showSendOtp = false;

  @override
  void initState() {
    super.initState();
    _phoneController.addListener(_phoneControllerListener);
  }

  void _phoneControllerListener() {
    setState(() {
      _showSendOtp = _phoneController.text.length == 10;
    });
  }

  _showOtpPage(String pno) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (BuildContext context) {
        return SingleChildScrollView(
          child: OtpPage(phoneNumber: pno
              // Pass the instance
              ),
        );
      },
    );
  }

  @override
  void dispose() {
    _phoneController.removeListener(_phoneControllerListener);
    _phoneController.dispose();

    super.dispose();
  }

  String selectedISD = '+1'; // Default ISD code

  bool showSendOTPButton = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Column(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height * 0.5,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(20.0),
                      bottomRight: Radius.circular(20.0),
                    ),
                  ),
                ),
                Container(
                  height: MediaQuery.of(context).size.height * 0.5,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20.0),
                      topRight: Radius.circular(20.0),
                    ),
                  ),
                ),
              ],
            ),
            Positioned(
              top: MediaQuery.of(context).size.height * 0.05,
              left: MediaQuery.of(context).size.width * 0.2,
              right: MediaQuery.of(context).size.width * 0.2,
              child: Container(
                width: MediaQuery.of(context).size.width * 0.6,
                child: Image.asset(
                  'images/mobile_devices.png', // Replace with actual image path
                ),
              ),
            ),
            Positioned(
              top: MediaQuery.of(context).size.height * 0.8 / 2,
              left: MediaQuery.of(context).size.width * 0.1,
              child: Container(
                height: MediaQuery.of(context).size.height * 0.5,
                width: MediaQuery.of(context).size.width * 0.8,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20.0),
                    topRight: Radius.circular(20.0),
                  ),
                ),
                padding: EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    Text(
                      'Enter your mobile number',
                      style: TextStyle(
                        fontSize: 21.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 16.0),
                    Container(
                      alignment: Alignment.center,
                      child: Text(
                        "We'll text you a verification code. Message and data rates may apply",
                        style: TextStyle(
                          color: Color(0xFF706E6E),
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    SizedBox(height: 16.0),
                    Container(
                      padding: EdgeInsets.symmetric(vertical: 4.0),
                      decoration: BoxDecoration(
                        color: Color(0xFFA6A1A1),
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                      child: Row(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5.0),
                              color: Colors.transparent,
                            ),
                            padding: EdgeInsets.symmetric(
                              vertical: 4.0,
                              horizontal: 8.0,
                            ),
                            child: DropdownButton<String>(
                              value: selectedISD,
                              onChanged: (newValue) {
                                setState(() {
                                  selectedISD = newValue!;
                                });
                              },
                              items: <String>['+1', '+91', '+44', '+81']
                                  .map<DropdownMenuItem<String>>(
                                (String value) {
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: Text(
                                      value,
                                      style: TextStyle(
                                        color: Colors.white,
                                      ),
                                    ),
                                  );
                                },
                              ).toList(),
                              dropdownColor: Color(0xFFA6A1A1),
                              iconEnabledColor: Colors.white,
                              underline: Container(),
                            ),
                          ),
                          SizedBox(width: 8.0),
                          Flexible(
                            child: TextField(
                              keyboardType: TextInputType.phone,
                              controller: _phoneController,
                              style: TextStyle(
                                color: Colors.white,
                              ),
                              decoration: InputDecoration(
                                hintText: 'Phone Number',
                                border: OutlineInputBorder(
                                  borderSide: BorderSide.none,
                                ),
                                hintStyle: TextStyle(
                                  color: Colors.white.withOpacity(0.5),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 16.0),
                    _showSendOtp
                        ? Container(
                            width: double.infinity,
                            child: TextButton(
                              onPressed: () async {
                                // Concatenate ISD code and phone number
                                await twilioservices.sendSMS(
                                    _phoneController.text,
                                    otpl); // Send the OTP with the full phone number
                                _showOtpPage(_phoneController.text);

                                // Show the OTP page with the full phone number
                              },
                              style: TextButton.styleFrom(),
                              child: Text(
                                'Send OTP',
                                style: TextStyle(
                                  color: Colors.grey,
                                ),
                              ),
                            ),
                          )
                        : SizedBox(height: 20),
                    // _showSendOtp
                    //     ? TextButton(
                    //         onPressed: () {
                    //           twilioservices.sendSMS(_phoneController.text);
                    //         },
                    //         child: Text(
                    //           "Send OTP",
                    //           style: TextStyle(
                    //             fontSize: 18,
                    //             color: Colors.grey,
                    //           ),
                    //         ),
                    //       )
                    //     : SizedBox(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class RoundedTopClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.lineTo(0, size.height - 20);
    path.quadraticBezierTo(
        size.width / 2, size.height, size.width, size.height - 20);
    path.lineTo(size.width, 0);
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}

class OtpPage extends StatefulWidget {
  final String phoneNumber;

  OtpPage({required this.phoneNumber});

  @override
  _OtpPageState createState() => _OtpPageState();
}

class _OtpPageState extends State<OtpPage> {
  String otp = '';
  TwilioServices twilioservices = TwilioServices();
  int _counter = 30;
  bool _canResend = false;

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  void _startTimer() {
    Future.delayed(Duration(seconds: 1), () {
      setState(() {
        if (_counter > 0) {
          _counter--;
          _startTimer();
        } else {
          _canResend = true; // Set _canResend to true after the timer ends
        }
      });
    });
  }

  void _navigateToLoginPage() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
          builder: (context) => loginPage()), // Use proper class name
    );

    Future.microtask(() {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Success'),
            content: Text('OTP verification completed. You can now log in.'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context); // Close the dialog
                },
                child: Text('OK'),
              ),
            ],
          );
        },
      );
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  _resendOtp() async {
    if (_canResend) {
      setState(() {
        _canResend = false;
        _counter = 30;
        String otpl = OTPGenerator.generateOTP();
        twilioservices.sendSMS(widget.phoneNumber, otpl);

        _startTimer();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: RoundedTopClipper(),
      child: Container(
        height: MediaQuery.of(context).size.height * 0.8,
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white,
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Text(
                'Enter your code',
                style: TextStyle(
                  fontSize: 21.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: 16.0),
            Text(
              'A text message was sent to ${widget.phoneNumber}',
              style: TextStyle(
                color: Color(0xFF706E6E),
              ),
            ),
            SizedBox(height: 16.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: List.generate(
                6,
                (index) => SizedBox(
                  width: 40.0,
                  height: 50.0,
                  child: TextField(
                    maxLength: 1,
                    onChanged: (value) {
                      if (value.isNotEmpty) {
                        setState(() {
                          if (value.isNotEmpty) {
                            setState(() {
                              otp += value; // Concatenate the entered digit
                            });

                            if (otp.length == 6) {
                              _navigateToLoginPage(); // Call navigation when OTP length is 6
                            } else if (index < 5) {
                              FocusScope.of(context).nextFocus();
                            }
                          }
                        });
                      }
                    },
                    keyboardType: TextInputType.number,
                    style: TextStyle(fontSize: 20.0),
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.zero,
                      counterText: '',
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey),
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey),
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 16.0),
            GestureDetector(
                onTap: _canResend ? _resendOtp : null,
                child: Text(
                  _canResend ? 'Resend OTP' : 'Resend OTP ($_counter s)',
                  style: TextStyle(
                    color: Colors.blue,
                    decoration: _canResend
                        ? TextDecoration.underline
                        : TextDecoration.none,
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
