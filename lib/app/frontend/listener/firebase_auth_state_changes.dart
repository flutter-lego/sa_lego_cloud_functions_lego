import 'package:easy_event_bus/easy_event_bus.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../../../../../../../../../../main.dart';

@ReadyForListener()
Future<void> firebaseAuthStateChangesListener(BuildContext context) async {
  /// https://tinyurl.com/5xfhrvdx#authstatechanges
  EasyEventBus.on("firebaseAuthStateChanges", (user) {
    print("Firebase Auth State is changed!: $user");
  });
}