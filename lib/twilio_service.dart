import 'package:twilio_flutter/twilio_flutter.dart';

class TwilioServices {
  TwilioFlutter twilioFlutter = TwilioFlutter(
      accountSid: "AC8df09864c92c6ac50c6d7954f771bf03", // found on console
      authToken: "9260ad62af6c80464f1636e660e4bf0b", // found on console
      twilioNumber: "+13134975358" // trial phone number is the one from

      );
  sendSMS(String phonenumber, otpl) async {
    try {
      await twilioFlutter.sendSMS(
          toNumber: "+91$phonenumber", messageBody: "Your otp $otpl");
    } catch (e) {
      print(e);
    }
  }
}
