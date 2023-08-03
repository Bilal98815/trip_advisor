import 'package:flutter/material.dart';

import '../../../../common/widgets/common_text_widget.dart';

class PersonalDetailTile extends StatelessWidget {
  final BoxConstraints size;
  final String text;
  final String image;
  final Function onTap;

  const PersonalDetailTile(
      {required this.size,
      required this.text,
      required this.onTap,
      required this.image,
      super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onTap.call();
      },
      child: Row(
        children: [
          Image.asset(
            image,
            width: size.maxWidth * 0.045,
          ),
          SizedBox(
            width: size.maxWidth * 0.04,
          ),
          CommonText(
              text: text,
              color: Colors.grey[350]!,
              fontsize: 14,
              fontWeight: FontWeight.w400),
        ],
      ),
    );
  }
}
