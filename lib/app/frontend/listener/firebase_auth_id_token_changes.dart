import 'package:easy_event_bus/easy_event_bus.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../../../../../../../../../../main.dart';

@ReadyForListener()
Future<void> firebaseAuthIdTokenChanges(BuildContext context) async {
  /// https://tinyurl.com/5xfhrvdx#idtokenchanges
  EasyEventBus.on("firebaseIdTokenChanges", (idTokenString) async {
    print("Firebase Auth IdToken is changed!: $idTokenString");
  });
}