import 'package:firebase_auth/firebase_auth.dart';

Future<User?> signUpEmailPassword(String email, String password) async {
  try {
    final userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
    // print("Signed up with email and password.");
    return userCredential.user;
  } on FirebaseAuthException catch (e) {
    switch (e.code) {
      case "email-already-in-use":
        print("Email is already in use.");
        break;
      case "invalid-email":
        print("Invalid email.");
        break;
      case "operation-not-allowed":
        print("Email/password accounts are not enabled.");
        break;
      case "weak-password":
        print("Password is too weak.");
        break;
      default:
        print("Unknown error.");
    }
    return null;
  }
}