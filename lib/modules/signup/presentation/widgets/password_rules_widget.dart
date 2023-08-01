import 'package:flutter/material.dart';
import 'package:trip_advisor/common/widgets/common_text_widget.dart';

class PasswordRulesRow extends StatelessWidget {
  final BoxConstraints size;
  final String rule;

  const PasswordRulesRow({required this.size, required this.rule, super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: size.maxWidth * 0.03,
          height: size.maxHeight * 0.02,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.grey.withOpacity(0.5),
          ),
          child: const Center(
              child: Icon(
            Icons.close,
            size: 8,
          )),
        ),
        SizedBox(
          width: size.maxWidth * 0.02,
        ),
        CommonText(
            text: rule,
            color: Colors.grey.withOpacity(0.5),
            fontsize: 12,
            fontWeight: FontWeight.normal),
      ],
    );
  }
}
