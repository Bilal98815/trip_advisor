import 'package:flutter/material.dart';
import 'package:trip_advisor/common/widgets/common_text_widget.dart';

class MissingPlaceButton extends StatelessWidget {
  const MissingPlaceButton({
    required this.onTap,
    required this.size,
    super.key,
  });
  final VoidCallback onTap;
  final BoxConstraints size;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: size.maxWidth,
        height: size.maxHeight * 0.06,
        decoration: BoxDecoration(
          color: Colors.black12,
          borderRadius: const BorderRadius.all(Radius.circular(35)),
          border: Border.all(color: Colors.white),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/pin.png',
              width: size.maxWidth * 0.045,
            ),
            SizedBox(
              width: size.maxWidth * 0.03,
            ),
            const CommonText(
              text: 'Add a missing place',
              color: Colors.white,
              fontsize: 18,
              fontWeight: FontWeight.w500,
            ),
          ],
        ),
      ),
    );
  }
}
