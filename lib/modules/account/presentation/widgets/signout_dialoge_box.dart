part of 'widgets.dart';

class SignoutDialogBox extends StatelessWidget {
  const SignoutDialogBox({required this.size, super.key});
  final BoxConstraints size;

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    final ColorScheme colorScheme = Theme.of(context).colorScheme;

    return Dialog(
      backgroundColor: colorScheme.primaryContainer,
      surfaceTintColor: colorScheme.background,
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(height: size.maxHeight * 0.01),
            Align(
              alignment: Alignment.centerLeft,
              child: InkWell(
                onTap: () => context.pop(),
                child: Icon(Icons.close, color: colorScheme.onBackground),
              ),
            ),
            SizedBox(height: size.maxHeight * 0.02),
            Text(LocaleStrings.signoutDialogText, style: textTheme.bodyMedium),
            SizedBox(height: size.maxHeight * 0.04),
            PrimaryButton(
              ignoring: false,
              onTap: () {
                context.read<AccountBloc>().add(SignOutEvent());
                Navigator.pop(context);
              },
              color: colorScheme.onBackground,
              height: size.maxHeight * 0.06,
              size: size,
              child: Center(
                child: Text(
                  LocaleStrings.signoutDialogButton,
                  style: textTheme.displayMedium
                      ?.copyWith(color: colorScheme.background),
                ),
              ),
            ),
            SizedBox(height: size.maxHeight * 0.02),
          ],
        ),
      ),
    );
  }
}
