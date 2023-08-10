import 'package:flutter/material.dart';

class ExploreView extends StatelessWidget {
  const ExploreView({super.key});

  static const routeName = '/explore';
  static String route() => '/explore';

  @override
  Widget build(BuildContext context) {
    return const Center(child: Text('Explore'));
  }
}
