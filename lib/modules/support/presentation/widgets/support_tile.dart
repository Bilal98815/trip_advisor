import 'package:flutter/material.dart';

import 'package:trip_advisor/common/widgets/common_text_widget.dart';

class SupportTile extends StatelessWidget {
  const SupportTile({
    required this.size,
    required this.title,
    required this.onTap,
    super.key,
  });
  final BoxConstraints size;
  final String title;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            CommonText(
              text: title,
              color: Colors.white,
              fontsize: 16,
              fontWeight: FontWeight.w500,
            ),
            const Spacer(),
            InkWell(
              onTap: () {
                onTap.call();
              },
              child: Image.asset(
                'assets/diagonal_arrow.png',
                width: size.maxWidth * 0.03,
              ),
            ),
          ],
        ),
        SizedBox(
          height: size.maxHeight * 0.01,
        ),
        const Divider(
          thickness: 0.3,
          color: Colors.grey,
        ),
      ],
    );
  }
}
