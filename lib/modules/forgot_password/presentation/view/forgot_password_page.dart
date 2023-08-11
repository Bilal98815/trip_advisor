part of 'view.dart';

class ForgotPasswordPage extends StatelessWidget {
  const ForgotPasswordPage({super.key});

  static const routeName = 'forgotPassword';
  static String route() => '/onboarding/login/forgotPassword';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ForgotPasswordBloc(
        forgotPasswordRepository: ForgotPasswordRepositoryImp(
          forgotPasswordAuth: ForgotPasswordAuth(),
        ),
      ),
      child: ForgotPasswordView(),
    );
  }
}
