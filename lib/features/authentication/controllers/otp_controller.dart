import 'package:get/get.dart';
import 'package:login_signup_ui/repository/authentication_repository/authentication_repository%20.dart';
import 'package:login_signup_ui/screens/home_screen.dart';

class OtpController extends GetxController {
  static OtpController get instance => Get.find();

  void verifyOTP(String otp) async{
    var isVerified = await AuthenticationRepository.instance.verifyOTP(otp);
    isVerified ? Get.offAll(const HomeScreen()) : Get.back();
  }
  
}