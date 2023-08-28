part of 'view.dart';

class OnboardingView extends StatelessWidget {
  const OnboardingView({super.key});

  static const routeName = '/onboarding';
  static String route() => '/onboarding';

  @override
  Widget build(BuildContext context) {
    final Assets assets = AssetProvider.of(context).assets;

    return Scaffold(
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, size) {
            final TextTheme textTheme = Theme.of(context).textTheme;

            return Padding(
              padding: EdgeInsets.symmetric(horizontal: size.maxWidth * 0.08),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: size.maxHeight * 0.04),
                  Align(
                    alignment: Alignment.topRight,
                    child: Text(
                      LocaleStrings.onboardingSkip,
                      style: textTheme.labelLarge?.copyWith(
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                  Container(
                    width: size.maxWidth * 0.23,
                    height: size.maxHeight * 0.2,
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.tertiaryContainer,
                      shape: BoxShape.circle,
                    ),
                    padding: const EdgeInsets.all(15.0),
                    child: Center(child: Image.asset(assets.owlLogo)),
                  ),
                  Text(
                    LocaleStrings.onboardingHeading,
                    style: textTheme.titleLarge,
                    textAlign: TextAlign.left,
                    overflow: TextOverflow.clip,
                  ),
                  SizedBox(height: size.maxHeight * 0.02),
                  RichText(
                    text: TextSpan(
                      text: LocaleStrings.onboardingTextLine1,
                      style: textTheme.bodyMedium,
                      children: [
                        TextSpan(
                          text: LocaleStrings.onboardingTextTerms,
                          style: textTheme.labelMedium?.copyWith(
                            decoration: TextDecoration.underline,
                          ),
                        ),
                        TextSpan(
                          text: LocaleStrings.onboardingTextLine2,
                          style: textTheme.bodyMedium,
                        ),
                        TextSpan(
                          text: LocaleStrings.onboardingTextPrivacy,
                          style: textTheme.labelSmall?.copyWith(
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: size.maxHeight * 0.04),
                  OnboardingButton(
                    size: size,
                    title: LocaleStrings.onboardingGoogleButton,
                    image: assets.gmailIcon,
                    onTap: () {},
                  ),
                  SizedBox(height: size.maxHeight * 0.02),
                  OnboardingButton(
                    size: size,
                    title: LocaleStrings.onboardingEmailButton,
                    image: assets.emailIcon,
                    onTap: () => context.go(LoginView.route()),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
