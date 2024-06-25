class SignupEmailPasswordFailure {
  final String message;

  SignupEmailPasswordFailure([this.message = "An unknown error occured."]);

  //factory constructor

  factory SignupEmailPasswordFailure.code(String code) {
    switch(code) {
      case 'weak-password':
        return SignupEmailPasswordFailure('Please enter string password.');
      case 'invalid-email':
        return SignupEmailPasswordFailure('Email is not valid or badly formatted.');
      case 'email-already-in-use':
        return SignupEmailPasswordFailure('An account already exist for that email.');
      case 'operation-not-allowed':
        return SignupEmailPasswordFailure('Operation is not allowed. Please contact support.');
      case 'user-disabled':
        return SignupEmailPasswordFailure('This user has been disabled. Please contact support for help.'); 
      default: 
        return SignupEmailPasswordFailure(); 
    }
  }
}