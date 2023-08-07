import 'package:flutter/material.dart';

import '../../../../common/widgets/common_text_widget.dart';

class MoreOptionTile extends StatelessWidget {
  final String title;
  final Function onTap;
  final BoxConstraints size;

  const MoreOptionTile(
      {required this.onTap,
      required this.size,
      required this.title,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            CommonText(
                text: title,
                color: Colors.white,
                fontsize: 15,
                fontWeight: FontWeight.w600),
            const Spacer(),
            InkWell(
              onTap: () {
                onTap.call();
              },
              child: const Icon(
                Icons.arrow_forward_ios,
                color: Colors.white,
                size: 18,
              ),
            ),
          ],
        ),
        SizedBox(
          height: size.maxHeight * 0.01,
        ),
        const Divider(
          thickness: 0.4,
          color: Colors.grey,
        ),
      ],
    );
  }
}
