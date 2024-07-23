import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';

Future<User?> loginWithApple() async {
  final appleProvider = AppleAuthProvider();
  if (kIsWeb) {
    UserCredential credential =
        await FirebaseAuth.instance.signInWithPopup(appleProvider);
    return credential.user;
  } else {
    UserCredential credential =
        await FirebaseAuth.instance.signInWithProvider(appleProvider);
    return credential.user;
  }
}
