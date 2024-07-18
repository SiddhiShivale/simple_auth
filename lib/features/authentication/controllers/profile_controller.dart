import 'package:get/get.dart';
import 'package:login_signup_ui/features/authentication/models/user_model.dart';
import 'package:login_signup_ui/repository/authentication_repository/authentication_repository%20.dart';
import 'package:login_signup_ui/repository/user_repository/user_repository.dart';

class ProfileController extends GetxController {
  static ProfileController get instance => Get.find();

  final _authRepo = Get.put(AuthenticationRepository()); //currently pointing to authentication repository
  final _userRepo = Get.put(UserRepository());

  //Step 3 => Get User Email and pass to UserRepository to fetch user record.
  getUserData() {
    final email = _authRepo.firebaseUser.value?.email;

    if(email != null) {
      _userRepo.getUserDetails(email); //this query is going to get us the details of the user 
    }
    else {
      Get.snackbar("Error", "Login to continue");
    }
  }

  //Fetch list of user records.
  Future<List<UserModel>> getAllUsers() async => await _userRepo.allUser();

  updateRecord(UserModel user) async {
    await _userRepo.updateUserRecord(user);
  }
}