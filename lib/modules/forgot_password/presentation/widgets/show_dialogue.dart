part of 'widgets.dart';

class DialogueBox extends StatelessWidget {
  const DialogueBox({required this.constraint, required this.email, super.key});
  final BoxConstraints constraint;
  final String email;

  @override
  Widget build(BuildContext context) {
    final ColorScheme colorScheme = Theme.of(context).colorScheme;
    final TextTheme textTheme = Theme.of(context).textTheme;

    return Dialog(
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
                onTap: () => Navigator.pop(context),
                child: const Icon(Icons.close),
              ),
            ),
            SizedBox(height: constraint.maxHeight * 0.02),
            Text(
              LocaleStrings.forgotPasswordDialogTitle,
              style: textTheme.labelLarge,
            ),
            SizedBox(height: constraint.maxHeight * 0.02),
            Text(
              LocaleStrings.forgotPasswordDialogText,
              style: textTheme.bodyMedium,
            ),
            SizedBox(height: constraint.maxHeight * 0.02),
            PrimaryButton(
              ignoring: false,
              onTap: () => context.go(LoginView.route()),
              color: colorScheme.onBackground,
              height: constraint.maxHeight * 0.06,
              size: constraint,
              child: Center(
                child: Text(
                  LocaleStrings.forgotPasswordDialogBackButton,
                  style: textTheme.labelLarge?.copyWith(
                    color: colorScheme.background,
                  ),
                ),
              ),
            ),
            SizedBox(height: constraint.maxHeight * 0.01),
            PrimaryButton(
              ignoring: false,
              onTap: () {
                context
                    .read<ForgotPasswordBloc>()
                    .add(ResetPassword(email: email));
                Navigator.pop(context);
              },
              color: colorScheme.background,
              height: constraint.maxHeight * 0.06,
              size: constraint,
              child: Center(
                child: Text(
                  LocaleStrings.forgotPasswordDialogResendButton,
                  style: textTheme.labelLarge,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
