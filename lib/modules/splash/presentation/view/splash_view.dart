import 'dart:async';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:trip_advisor/common/helpers/shared_preferences/shared_preferences.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    super.initState();
    Timer(
      const Duration(seconds: 3),
      () async {
        final prefs = Preferences();
        final user = await prefs.getSharedPreferenceUser();

        if (context.mounted) {
          context.go(user.email != null ? '/explore' : '/onboarding');
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: Colors.black87,
        child: Container(
          width: 30,
          height: 30,
          padding: const EdgeInsets.all(110.0),
          child: CircleAvatar(
            maxRadius: 0.5,
            backgroundColor: Colors.white,
            child: Padding(
              padding: const EdgeInsets.all(50.0),
              child: Image.asset('assets/owl.png'),
            ),
          ),
        ),
      ),
    );
  }
}
