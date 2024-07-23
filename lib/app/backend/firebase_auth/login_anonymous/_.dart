import 'package:firebase_auth/firebase_auth.dart';

Future<User?> loginAnonymous() async {
  try {
    final userCredential = await FirebaseAuth.instance.signInAnonymously();
    // print("Signed in with temporary account.");
    return userCredential.user;
  } on FirebaseAuthException catch (e) {
    switch (e.code) {
      case "operation-not-allowed":
        print("Anonymous auth hasn't been enabled for this project.");
        break;
      default:
        print("Unknown error.");
    }
    return null;
  }
}
