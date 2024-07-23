import 'package:firebase_auth/firebase_auth.dart';

Future<User?> loginEmailPassword(String email, String password) async {
  try {
    final userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
    // print("Signed in with email and password.");
    return userCredential.user;
  } on FirebaseAuthException catch (e) {
    switch (e.code) {
      case "invalid-email":
        print("Invalid email.");
        break;
      case "user-disabled":
        print("User has been disabled.");
        break;
      case "user-not-found":
        print("User not found.");
        break;
      case "wrong-password":
        print("Wrong password.");
        break;
      default:
        print("Unknown error.");
    }
    return null;
  }
}