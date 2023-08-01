import 'package:flutter/material.dart';

class AuthenticationButton extends StatelessWidget {
  final BoxConstraints size;
  final Color color;
  final Function onTap;
  final double height;
  final Widget child;

  const AuthenticationButton(
      {required this.onTap,
      required this.color,
      required this.height,
      required this.child,
      required this.size,
      super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onTap.call();
      },
      child: Container(
          width: double.infinity,
          height: height,
          decoration: BoxDecoration(
            color: color,
            borderRadius: const BorderRadius.all(Radius.circular(35)),
            border: Border.all(color: Colors.white, width: 2),
          ),
          child: child),
    );
  }
}
