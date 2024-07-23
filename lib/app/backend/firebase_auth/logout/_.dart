import 'package:firebase_auth/firebase_auth.dart';

Future<bool> logout() async {
  try {
    await FirebaseAuth.instance.signOut();
    return true;
  } catch (e) {
    print(e);
    return false;
  }
}
