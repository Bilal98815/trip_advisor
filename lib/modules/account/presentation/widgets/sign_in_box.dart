import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:trip_advisor/common/widgets/common_text_widget.dart';
import 'package:trip_advisor/common/widgets/primary_button.dart';
import 'package:trip_advisor/modules/onboarding/presentation/view/onbaording_view.dart';

class SignInBox extends StatelessWidget {
  const SignInBox({required this.size, super.key});
  final BoxConstraints size;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size.maxWidth,
      height: size.maxHeight * 0.24,
      decoration: BoxDecoration(
        color: Colors.grey[850],
        borderRadius: const BorderRadius.all(Radius.circular(12)),
      ),
      padding: EdgeInsets.symmetric(horizontal: size.maxWidth * 0.04),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: size.maxHeight * 0.04,
          ),
          const CommonText(
            text: 'Sign in to manage your bookings and',
            color: Colors.white,
            fontsize: 15,
            fontWeight: FontWeight.w300,
          ),
          const CommonText(
            text: 'easily plan your next trip',
            color: Colors.white,
            fontsize: 15,
            fontWeight: FontWeight.w300,
          ),
          SizedBox(
            height: size.maxHeight * 0.04,
          ),
          PrimaryButton(
            ignoring: false,
            onTap: () {
              context.go(OnboardingView.route());
            },
            color: Colors.white,
            height: size.maxHeight * 0.06,
            size: size,
            child: const Center(
              child: CommonText(
                text: 'Sign in',
                color: Colors.black87,
                fontsize: 15,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          SizedBox(
            height: size.maxHeight * 0.03,
          ),
        ],
      ),
    );
  }
}
