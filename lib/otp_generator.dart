import 'dart:math';

class OTPGenerator {
  static String generateOTP() {
    // Generate a random 6-digit OTP
    Random random = Random();
    int otp = random.nextInt(900000) + 100000;
    return otp.toString();
  }
}
