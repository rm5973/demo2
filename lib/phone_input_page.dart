import 'package:flutter/material.dart';
import 'package:twilio_flutter/twilio_flutter.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
// Import the verification page
import 'otp_generator.dart';

String otpl = OTPGenerator.generateOTP();

class OtpPage extends StatefulWidget {
  final String userId;

  OtpPage({required this.userId});

  @override
  _OtpPageState createState() => _OtpPageState();
}

class _OtpPageState extends State<OtpPage> {
  var twilioFlutter = TwilioFlutter(
    accountSid: 'AC9079a9321237cb06b7b38b065911a60b',
    authToken: 'cdcd0f70ad7fcca04f5d716213eff309',
    twilioNumber: '+14705708974',
  );

  TextEditingController _phoneController = TextEditingController();
  TextEditingController _otpController = TextEditingController();
  bool _showSendOtp = false;
  bool _isPhoneVerified = false;

  Future<void> _sendOtp(String phoneNumber) async {
    try {
      await twilioFlutter.sendSMS(
        toNumber: '+91$phoneNumber',
        messageBody: 'Your OTP: $otpl',
      );

      setState(() {
        _showSendOtp = false;
      });

      // Upload phone number and set verification status to false
      await FirebaseFirestore.instance
          .collection('users')
          .doc(widget.userId)
          .update({
        'phone': phoneNumber,
        'phoneVerified': false,
      });
    } catch (e) {
      print('Error sending OTP: $e');
      // Handle error (e.g., show an error message)
    }
  }

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

  @override
  void dispose() {
    _phoneController.removeListener(_phoneControllerListener);
    _phoneController.dispose();
    _otpController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(new FocusNode());
      },
      child: Scaffold(
        resizeToAvoidBottomInset:
            true, // Allow content to resize when keyboard appears
        body: SingleChildScrollView(
          child: Container(
            height: double.infinity,
            width: double.infinity,
            child: Stack(
              children: [
                Column(
                  children: [
                    Container(
                      height: MediaQuery.of(context).size.height *
                          0.5, // 50% screen height
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(20),
                          bottomRight: Radius.circular(20),
                        ),
                      ),
                    ),
                    SizedBox(
                        height:
                            20), // Added spacing between blue container and white container
                  ],
                ),
                Align(
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.8,
                    color: const Color.fromARGB(255, 227, 172, 172),
                    padding: EdgeInsets.only(
                      bottom: MediaQuery.of(context)
                          .viewInsets
                          .bottom, // Adjust padding for keyboard
                    ),
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          SizedBox(height: 20),
                          Text(
                            "Enter Your Phone Number",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                          SizedBox(height: 20),
                          TextFormField(
                            controller: _phoneController,
                            keyboardType: TextInputType.phone,
                            decoration: InputDecoration(
                              hintText: 'Phone Number',
                              fillColor: Colors.white,
                              filled: true,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(7),
                              ),
                            ),
                          ),
                          SizedBox(height: 20),
                          _showSendOtp
                              ? TextButton(
                                  onPressed: () {
                                    _sendOtp(_phoneController.text);
                                  },
                                  child: Text(
                                    "Send OTP",
                                    style: TextStyle(
                                      fontSize: 18,
                                      color: Colors.grey,
                                    ),
                                  ),
                                )
                              : SizedBox(),
                          SizedBox(height: 20),
                          _isPhoneVerified
                              ? Text(
                                  "Phone Number Verified",
                                  style: TextStyle(
                                    fontSize: 18,
                                    color: Colors.green,
                                  ),
                                )
                              : SizedBox(),
                          SizedBox(height: 20),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
