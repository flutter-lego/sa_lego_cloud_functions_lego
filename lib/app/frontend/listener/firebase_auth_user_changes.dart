import 'package:easy_event_bus/easy_event_bus.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../../../../../../../../../../main.dart';

@ReadyForListener()
Future<void> firebaseAuthUserChangesListener(BuildContext context) async {
  /// https://tinyurl.com/5xfhrvdx#userchanges
  EasyEventBus.on("firebaseAuthUserChanges", (user) {
    print("Firebase Auth User is changed!: $user");
  });
}