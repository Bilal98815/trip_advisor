import 'package:flutter/material.dart';
import 'package:trip_advisor/common/widgets/common_text_widget.dart';
import 'package:trip_advisor/common/widgets/onboarding_button.dart';
import 'package:trip_advisor/modules/login/presentation/view/login_view.dart';

class OnboardingView extends StatelessWidget {
  const OnboardingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: LayoutBuilder(builder: (context, size) {
          return Container(
            width: size.maxWidth,
            height: size.maxHeight,
            color: Colors.black87,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: size.maxWidth * 0.08),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: size.maxHeight * 0.04,
                  ),
                  const Align(
                    alignment: Alignment.topRight,
                    child: Text(
                      'Skip',
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                          decorationColor: Colors.white,
                          decoration: TextDecoration.underline),
                    ),
                  ),
                  Container(
                    width: size.maxWidth * 0.23,
                    height: size.maxHeight * 0.2,
                    decoration: const BoxDecoration(
                        color: Colors.green, shape: BoxShape.circle),
                    padding: const EdgeInsets.all(15.0),
                    child: Center(child: Image.asset('assets/owl.png')),
                  ),
                  const CommonText(
                      text: 'Sign in to start planning your trip.',
                      color: Colors.white,
                      textAlign: TextAlign.left,
                      textOverflow: TextOverflow.clip,
                      fontsize: 30,
                      fontWeight: FontWeight.w900),
                  SizedBox(
                    height: size.maxHeight * 0.02,
                  ),
                  RichText(
                    text: const TextSpan(
                        text: 'By Proceeding, you agree to our ',
                        style: TextStyle(
                          fontSize: 15,
                        ),
                        children: [
                          TextSpan(
                              text: 'Terms of Use ',
                              style: TextStyle(
                                  fontSize: 15,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w700,
                                  decoration: TextDecoration.underline)),
                          TextSpan(
                              text: 'and confirm you have read our ',
                              style: TextStyle(
                                fontSize: 15,
                              )),
                          TextSpan(
                              text: 'Privacy and Cookie Statement',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w700,
                                  decoration: TextDecoration.underline)),
                        ]),
                  ),
                  SizedBox(
                    height: size.maxHeight * 0.04,
                  ),
                  OnboardingButton(
                    size: size,
                    title: 'Continue with Google',
                    image: 'assets/google.png',
                    onTap: () {},
                  ),
                  SizedBox(
                    height: size.maxHeight * 0.02,
                  ),
                  OnboardingButton(
                      size: size,
                      title: 'Continue with Email',
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => LoginView()));
                      },
                      image: 'assets/email.png'),
                ],
              ),
            ),
          );
        }),
      ),
    );
  }
}
