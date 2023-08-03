import 'package:flutter/material.dart';

import '../../../../common/widgets/common_text_widget.dart';

class TripGuidanceTile extends StatelessWidget {
  final BoxConstraints size;
  final String image;
  final String text;

  const TripGuidanceTile(
      {required this.size, required this.image, required this.text, super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          width: size.maxWidth * 0.2,
          height: size.maxHeight * 0.05,
          decoration: const BoxDecoration(
              color: Color(0xFF235347), shape: BoxShape.circle),
          child: Center(
            child: Image.asset(
              image,
              width: size.maxWidth * 0.045,
            ),
          ),
        ),
        CommonText(
            text: text,
            color: Colors.white,
            fontsize: 15,
            fontWeight: FontWeight.w400),
      ],
    );
  }
}
