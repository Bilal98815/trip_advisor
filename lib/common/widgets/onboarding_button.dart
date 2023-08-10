import 'package:flutter/material.dart';

import 'package:trip_advisor/common/widgets/common_text_widget.dart';

class OnboardingButton extends StatelessWidget {
  const OnboardingButton({
    required this.title,
    required this.onTap,
    required this.image,
    required this.size,
    super.key,
  });
  final String image;
  final String title;
  final BoxConstraints size;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onTap.call();
      },
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(
          vertical: size.maxHeight * 0.02,
          horizontal: size.maxWidth * 0.05,
        ),
        decoration: BoxDecoration(
          color: Colors.black12,
          borderRadius: const BorderRadius.all(Radius.circular(35)),
          border: Border.all(color: Colors.white, width: 2),
        ),
        child: Row(
          children: [
            Image.asset(
              image,
              width: 22,
              height: 22,
            ),
            SizedBox(
              width: size.maxWidth * 0.13,
            ),
            CommonText(
              text: title,
              color: Colors.white,
              fontsize: 17,
              fontWeight: FontWeight.w500,
            ),
          ],
        ),
      ),
    );
  }
}
