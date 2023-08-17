part of 'widgets.dart';

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
          CommonText(
            text: LocaleStrings.accountSigninInfo1,
            color: Colors.white,
            fontsize: 15,
            fontWeight: FontWeight.w300,
          ),
          CommonText(
            text: LocaleStrings.accountSigninInfo2,
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
            child: Center(
              child: CommonText(
                text: LocaleStrings.accountSigninButton,
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
