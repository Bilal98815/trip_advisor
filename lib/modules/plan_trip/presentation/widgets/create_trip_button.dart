import 'package:flutter/material.dart';

class CreateTripButton extends StatelessWidget {

  const CreateTripButton(
      {required this.onTap,
      required this.height,
      required this.child,
      required this.color,
      super.key,});
  final Function onTap;
  final double height;
  final Color color;
  final Widget child;

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
          ),
          child: child,),
    );
  }
}
