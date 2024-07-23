import 'package:flutter/material.dart';
import '../../../../../main.dart';
import 'widget_binding_lego/_.dart';
import 'firebase_core_lego/_.dart';
import 'sa_firebase_auth_lego/_.dart';

Future<void> readyBeforeRunApp() async {
  if (_done) return;
  _done = true;
  await readyForWidgetBindingLego();
  await readyForFirebaseCoreLego();
  await readyForSaFirebaseAuthLego();

}

bool _done = false;
