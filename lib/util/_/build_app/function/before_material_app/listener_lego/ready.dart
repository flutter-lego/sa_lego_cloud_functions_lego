import 'package:flutter/material.dart';
import '../../../../../../../../main.dart';
import '../../../../../../app/frontend/listener/firebase_auth_user_changes.dart';
import '../../../../../../app/frontend/listener/flutter_fgbg.dart';
import '../../../../../../app/frontend/listener/firebase_auth_id_token_changes.dart';
import '../../../../../../app/frontend/listener/_new.dart';
import '../../../../../../app/frontend/listener/firebase_auth_state_changes.dart';

@ListenersByLego()
Future<void> readyForListeners(BuildContext context) async {
 if (_done) return; _done = true;


  await firebaseAuthUserChangesListener(context);
  await flutterFgbgListener(context);
  await firebaseAuthIdTokenChanges(context);
  await newListener(context);
  await firebaseAuthStateChangesListener(context);

}
bool _done = false;
