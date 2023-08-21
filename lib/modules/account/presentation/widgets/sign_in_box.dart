part of 'widgets.dart';

class SignInBox extends StatelessWidget {
  const SignInBox({required this.size, super.key});
  final BoxConstraints size;

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    final ColorScheme colorScheme = Theme.of(context).colorScheme;

    return Container(
      width: size.maxWidth,
      height: size.maxHeight * 0.24,
      decoration: BoxDecoration(
        color:
            Theme.of(context).colorScheme.primaryContainer, //Colors.grey[850],
        borderRadius: const BorderRadius.all(Radius.circular(12)),
      ),
      padding: EdgeInsets.symmetric(horizontal: size.maxWidth * 0.04),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: size.maxHeight * 0.04,
          ),
          Text(LocaleStrings.accountSigninInfo1, style: textTheme.bodyMedium),
          Text(LocaleStrings.accountSigninInfo2, style: textTheme.bodyMedium),
          SizedBox(height: size.maxHeight * 0.04),
          PrimaryButton(
            ignoring: false,
            onTap: () => context.go(OnboardingView.route()),
            color: colorScheme.onBackground,
            height: size.maxHeight * 0.06,
            size: size,
            child: Center(
              child: Text(
                LocaleStrings.accountSigninButton,
                style: textTheme.displayMedium
                    ?.copyWith(color: colorScheme.background),
              ),
            ),
          ),
          SizedBox(height: size.maxHeight * 0.03),
        ],
      ),
    );
  }
}
