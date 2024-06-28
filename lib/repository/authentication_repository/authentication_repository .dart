// ignore_for_file: empty_catches, unnecessary_null_comparison, unused_catch_clause

//* * https://firebase.google.com/docs/auth/admin/errors

import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:login_signup_ui/screens/login.dart';
import 'package:login_signup_ui/screens/home_screen.dart';
import '../exceptions/signup_email_password_failure.dart';

class AuthenticationRepository extends GetxController {
  static AuthenticationRepository get instance => Get.find();

  //variables
  final _auth = FirebaseAuth.instance;
  late final Rx<User?> firebaseUser;
  var verificationId = ''.obs;  //obs => observable value. Whenever there is any change in the verification id it will automatically update its children

  @override
  void onReady() {
    firebaseUser = Rx<User?>(_auth.currentUser);
    firebaseUser
        .bindStream(_auth.userChanges()); //always listen to user activity
    ever(firebaseUser, _setInitialScreen);
  }

  _setInitialScreen(User? user) {
    //user == null means user has been loged out ... Get.offAll() -> removes all the previous screen
    user == null
        ? Get.offAll(() => const LoginPage())
        : Get.offAll(const HomeScreen());
  }

  //phone number authentication function
  Future<void> phoneAuthentication(String phoneNo) async {
    await _auth.verifyPhoneNumber(
        phoneNumber: phoneNo, //gives phone number of the user
        verificationCompleted:
            (credential) async {
              await _auth.signInWithCredential(credential); //this is where to redirect the user after he is successfully verified.
            }, //on verification completed the user crediantials will be given
        verificationFailed: (e) {
          if(e.code == 'invalid-phone-number') {
            Get.snackbar('Error', 'The provided phone number is not valid.');
          }
          else {
            Get.snackbar('Error', 'Something went wrong! Try again.');
          }
        },
        codeSent: (verificationId, resendToken) { //when the code is sent we need to get the verification Id and let the user enter the Otp 
          this.verificationId.value = verificationId;
        },
        codeAutoRetrievalTimeout: (verificationId) {
          this.verificationId.value = verificationId; //this will pass the current value of verification id
        }, //when we have to resend the code after some time 
    );
  }

  Future<bool> verifyOTP(String otp) async{ //this function is going to call when user enters the otp
    var credentials = await _auth
      .signInWithCredential(PhoneAuthProvider.credential(verificationId: this.verificationId.value, smsCode: otp));
    return credentials.user != null ? true : false; 
  }

  Future<void> createUserWithEmailAndPassword(
      String email, String password) async {
    try {
      await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      firebaseUser != null
          ? Get.offAll(() => const HomeScreen())
          : Get.offAll(
              () => const LoginPage()); //when user is successfully signed in
    } on FirebaseAuthException catch (e) {
      final ex = SignupEmailPasswordFailure.code(e.code);
      print('Firebase Auth Exception - ${ex.message}');
      throw ex;
    } catch (_) {
      final ex = SignupEmailPasswordFailure();
      print('Exception - ${ex.message}');
      throw ex;
    }
  }

  Future<void> loginWithEmailAndPassword(String email, String password) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
    } catch (_) {}
  }

  Future<void> logout() async => await _auth.signOut();
}
