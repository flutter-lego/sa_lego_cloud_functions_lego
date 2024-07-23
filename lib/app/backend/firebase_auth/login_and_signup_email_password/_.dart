import 'package:firebase_auth/firebase_auth.dart';

Future<User?> loginAndSignUpEmailPassword(String email, String password) async {
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
        print("Email is already in use. Attempting to log in...");
        try {
          final userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
            email: email,
            password: password,
          );
          // print("Signed in with email and password.");
          return userCredential.user;
        } on FirebaseAuthException catch (e) {
          print("Failed to log in: ${e.message}");
          return null;
        }
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
        print("Unknown error: ${e.message}");
    }
    return null;
  }
}
