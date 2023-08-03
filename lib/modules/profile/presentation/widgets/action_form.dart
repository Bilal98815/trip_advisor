import 'package:flutter/material.dart';
import 'package:trip_advisor/common/widgets/authentication_button.dart';

import '../../../../common/widgets/common_text_widget.dart';

class ActionForm extends StatelessWidget {
  final int number;
  final String actionTitle;
  final Function onTap;
  final BoxConstraints size;
  final String buttonText;

  const ActionForm(
      {required this.onTap,
      required this.size,
      required this.buttonText,
      required this.number,
      required this.actionTitle,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: size.maxHeight * 0.05,
        ),
        Align(
          alignment: Alignment.centerLeft,
          child: CommonText(
              text: '$number $actionTitle',
              color: Colors.white,
              fontsize: 22,
              fontWeight: FontWeight.w800),
        ),
        SizedBox(
          height: size.maxHeight * 0.08,
        ),
        CommonText(
            text: 'You have no $actionTitle yet.',
            color: Colors.white,
            fontsize: 14,
            fontWeight: FontWeight.w400),
        SizedBox(
          height: size.maxHeight * 0.09,
        ),
        AuthenticationButton(
            onTap: onTap,
            color: Colors.black12,
            height: size.maxHeight * 0.075,
            size: size,
            child: Center(
              child: CommonText(
                  text: buttonText,
                  color: Colors.white,
                  fontsize: 17,
                  fontWeight: FontWeight.w500),
            )),
        SizedBox(
          height: size.maxHeight * 0.06,
        ),
        const Divider(
          color: Colors.grey,
          thickness: 0.4,
        ),
      ],
    );
  }
}
