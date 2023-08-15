import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:localization/easy_localization.dart';
import 'package:trip_advisor/modules/app/app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  initializeLocalization(app: const MyApp());
  // runApp(const MyApp());
}
