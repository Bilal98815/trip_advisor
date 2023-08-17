part of 'widgets.dart';

class DialogueBox extends StatelessWidget {
  const DialogueBox({required this.constraint, required this.email, super.key});
  final BoxConstraints constraint;
  final String email;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.grey[900],
      surfaceTintColor: Colors.black,
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              height: constraint.maxHeight * 0.02,
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: const Icon(
                  Icons.close,
                  color: Colors.white,
                ),
              ),
            ),
            SizedBox(
              height: constraint.maxHeight * 0.02,
            ),
            CommonText(
              text: LocaleStrings.forgotPasswordDialogTitle,
              color: Colors.white,
              fontsize: 18,
              fontWeight: FontWeight.w700,
            ),
            SizedBox(
              height: constraint.maxHeight * 0.02,
            ),
            CommonText(
              text: LocaleStrings.forgotPasswordDialogText,
              color: Colors.white,
              textOverflow: TextOverflow.clip,
              textAlign: TextAlign.center,
              fontsize: 19,
              fontWeight: FontWeight.w400,
            ),
            PrimaryButton(
              ignoring: false,
              onTap: () {
                context.go(LoginView.route());
              },
              color: Colors.white,
              height: constraint.maxHeight * 0.06,
              size: constraint,
              child: Center(
                child: CommonText(
                  text: LocaleStrings.forgotPasswordDialogBackButton,
                  color: Colors.black87,
                  fontsize: 18,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            SizedBox(
              height: constraint.maxHeight * 0.01,
            ),
            PrimaryButton(
              ignoring: false,
              onTap: () {
                context
                    .read<ForgotPasswordBloc>()
                    .add(ResetPassword(email: email));
                Navigator.pop(context);
              },
              color: Colors.black87,
              height: constraint.maxHeight * 0.06,
              size: constraint,
              child: Center(
                child: CommonText(
                  text: LocaleStrings.forgotPasswordDialogResendButton,
                  color: Colors.white,
                  fontsize: 18,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
