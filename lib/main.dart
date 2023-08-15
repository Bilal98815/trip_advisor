import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:localization/localization.dart';
import 'package:trip_advisor/modules/app/app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await EasyLocalizationPackage.init();

  runApp(
    EasyLocalizationPackage.createLocalizationWidget(
      child: const MyApp(),
    ),
  );
}
