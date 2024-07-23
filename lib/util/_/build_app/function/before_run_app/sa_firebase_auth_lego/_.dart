import 'package:easy_event_bus/easy_event_bus.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../../../../../main.dart';

@ReadyBeforeRunApp(index: 1.4)
Future<void> readyForSaFirebaseAuthLego() async {
  if(!_isOpened) {
    _isOpened = true;

    /// https://tinyurl.com/5xfhrvdx#authstatechanges
    FirebaseAuth.instance
        .authStateChanges()
        .listen((User? user) {

      EasyEventBus.fire("firebaseAuthStateChanges", user);
    });

    /// https://tinyurl.com/5xfhrvdx#idtokenchanges
    FirebaseAuth.instance
        .idTokenChanges()
        .listen((User? user) async {
      EasyEventBus.fire('firebaseIdTokenChanges', await user?.getIdToken());
    });

    /// https://tinyurl.com/5xfhrvdx#userchanges
    FirebaseAuth.instance
        .userChanges()
        .listen((User? user) {
      EasyEventBus.fire('firebaseAuthUserChanges', user);
    });

  }

}

bool _isOpened = false;