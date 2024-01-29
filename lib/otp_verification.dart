// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
// import 'phone_input_page.dart';

// class OtpVerificationPage extends StatefulWidget {
//   final String phoneNumber;

//   OtpVerificationPage({required this.phoneNumber});

//   @override
//   _OtpVerificationPageState createState() => _OtpVerificationPageState();
// }

// class _OtpVerificationPageState extends State<OtpVerificationPage> {
//   List<TextEditingController> _otpControllers =
//       List.generate(6, (index) => TextEditingController());
//   String otp = otpl;
//   bool _isOtpVerified = false;

//   Future<void> _verifyOtp(String phoneNumber, String enteredOtp) async {
//     if (enteredOtp == otp) {
//       // Verification successful
//       setState(() {
//         _isOtpVerified = true;
//       });

//       // Set phone verification status to true
//       await FirebaseFirestore.instance
//           .collection('users')
//           .where('phone', isEqualTo: phoneNumber)
//           .get()
//           .then((querySnapshot) {
//         querySnapshot.docs.forEach((doc) {
//           doc.reference.update({'phoneVerified': true});
//         });
//       });
//     } else {
//       // Verification failed
//       print('Error verifying OTP');
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: () {
//         FocusScope.of(context).requestFocus(new FocusNode());
//       },
//       child: Scaffold(
//         body: Stack(
//           children: [
//             Container(
//               decoration: BoxDecoration(
//                 image: DecorationImage(
//                   image: AssetImage('images/signupbackground.jpeg'),
//                   fit: BoxFit.fill,
//                 ),
//               ),
//             ),
//             SafeArea(
//               child: Center(
//                 child: Padding(
//                   padding: const EdgeInsets.symmetric(horizontal: 20),
//                   child: Column(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     crossAxisAlignment: CrossAxisAlignment.center,
//                     children: [
//                       Text(
//                         "Enter OTP",
//                         style: TextStyle(
//                           fontSize: 20,
//                           fontWeight: FontWeight.bold,
//                           color: Colors.black,
//                         ),
//                       ),
//                       SizedBox(height: 20),
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: List.generate(
//                           6,
//                           (index) => SizedBox(
//                             width: 40,
//                             child: TextFormField(
//                               controller: _otpControllers[index],
//                               keyboardType: TextInputType.number,
//                               maxLength: 1,
//                               textAlign: TextAlign.center,
//                               decoration: InputDecoration(
//                                 counterText: '',
//                                 contentPadding: EdgeInsets.all(10),
//                                 filled: true,
//                                 fillColor: Colors.white,
//                                 border: OutlineInputBorder(
//                                   borderRadius: BorderRadius.circular(7),
//                                 ),
//                               ),
//                             ),
//                           ),
//                         ),
//                       ),
//                       SizedBox(height: 20),
//                       ElevatedButton(
//                         onPressed: () {
//                           String enteredOtp = _otpControllers
//                               .map((controller) => controller.text)
//                               .join('');
//                           _verifyOtp(widget.phoneNumber, enteredOtp);
//                         },
//                         child: Text("Verify and Save"),
//                       ),
//                       SizedBox(height: 20),
//                       _isOtpVerified
//                           ? Text(
//                               "Phone Number Verified",
//                               style: TextStyle(
//                                 fontSize: 18,
//                                 color: Colors.green,
//                               ),
//                             )
//                           : SizedBox(),
//                     ],
//                   ),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
