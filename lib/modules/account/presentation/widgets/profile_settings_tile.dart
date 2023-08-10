import 'package:flutter/material.dart';
import 'package:trip_advisor/common/widgets/common_text_widget.dart';

class ProfileSettingsTile extends StatelessWidget {
  const ProfileSettingsTile({
    required this.image,
    required this.onTap,
    required this.title,
    required this.size,
    super.key,
  });
  final String image;
  final String title;
  final BoxConstraints size;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: onTap,
          child: Row(
            children: [
              Image.asset(
                image,
                width: size.maxWidth * 0.045,
              ),
              SizedBox(
                width: size.maxWidth * 0.06,
              ),
              CommonText(
                text: title,
                color: Colors.white,
                fontsize: 15,
                fontWeight: FontWeight.w500,
              ),
              const Spacer(),
              const Icon(
                Icons.arrow_forward_ios,
                color: Colors.white,
                size: 18,
              ),
            ],
          ),
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
