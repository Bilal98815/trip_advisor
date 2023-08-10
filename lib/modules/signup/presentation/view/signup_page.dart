part of 'view.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  static const routeName = 'signup';
  static String route() => '/onboarding/signup';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SignupBloc(
        signUpRepository: SignUpRepositoryImp(
          signupAuthService: SignupAuthService(),
        ),
      ),
      child: SignUpView(),
    );
  }
}
