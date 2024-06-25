// ignore_for_file: empty_catches, unnecessary_null_comparison, unused_catch_clause

import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:login_signup_ui/screens/LoginPage.dart';
import 'package:login_signup_ui/screens/home_screen.dart';
import 'package:login_signup_ui/repository/exceptions/signup_email_password_failure.dart';

class AuthenticationRepository extends GetxController {
  static AuthenticationRepository get instance => Get.find();

  //variables
  final _auth = FirebaseAuth.instance;
  late final Rx<User?> firebaseUser;

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

  Future<void> createUserWithEmailAndPassword(
      String email, String password) async {
    try {
      await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
          firebaseUser != null ? Get.offAll(() => const HomeScreen()) : Get.offAll(() => const LoginPage()); //when user is successfully signed in
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
