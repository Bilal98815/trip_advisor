part of 'view.dart';

class OnboardingView extends StatelessWidget {
  const OnboardingView({super.key});

  static const routeName = '/onboarding';
  static String route() => '/onboarding';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, size) {
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
                    Align(
                      alignment: Alignment.topRight,
                      child: Text(
                        LocaleStrings.onboardingSkip,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                          decorationColor: Colors.white,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ),
                    Container(
                      width: size.maxWidth * 0.23,
                      height: size.maxHeight * 0.2,
                      decoration: const BoxDecoration(
                        color: Colors.green,
                        shape: BoxShape.circle,
                      ),
                      padding: const EdgeInsets.all(15.0),
                      child: Center(child: Image.asset('assets/owl.png')),
                    ),
                    CommonText(
                      text: LocaleStrings.onboardingHeading,
                      color: Colors.white,
                      textAlign: TextAlign.left,
                      textOverflow: TextOverflow.clip,
                      fontsize: 30,
                      fontWeight: FontWeight.w900,
                    ),
                    SizedBox(
                      height: size.maxHeight * 0.02,
                    ),
                    RichText(
                      text: TextSpan(
                        text: LocaleStrings.onboardingTextLine1,
                        style: const TextStyle(
                          fontSize: 15,
                        ),
                        children: [
                          TextSpan(
                            text: LocaleStrings.onboardingTextTerms,
                            style: const TextStyle(
                              fontSize: 15,
                              color: Colors.white,
                              fontWeight: FontWeight.w700,
                              decoration: TextDecoration.underline,
                            ),
                          ),
                          TextSpan(
                            text: LocaleStrings.onboardingTextLine2,
                            style: const TextStyle(fontSize: 15),
                          ),
                          TextSpan(
                            text: LocaleStrings.onboardingTextPrivacy,
                            style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w700,
                              decoration: TextDecoration.underline,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: size.maxHeight * 0.04,
                    ),
                    OnboardingButton(
                      size: size,
                      title: LocaleStrings.onboardingGoogleButton,
                      image: 'assets/google.png',
                      onTap: () {},
                    ),
                    SizedBox(
                      height: size.maxHeight * 0.02,
                    ),
                    OnboardingButton(
                      size: size,
                      title: LocaleStrings.onboardingEmailButton,
                      onTap: () => context.go(LoginView.route()),
                      image: 'assets/email.png',
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
