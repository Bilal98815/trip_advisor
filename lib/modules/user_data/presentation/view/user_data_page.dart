part of 'view.dart';

class UserDataPage extends StatelessWidget {
  const UserDataPage({super.key, required this.email, required this.password});

  final String email;
  final String password;

  static const routeName = 'userData';
  static String route() => '/onboarding/signup/locationData/userData';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => UserDataBloc(
        userDataRepository: UserDataRepositoryImp(
          userDataAuth: UserDataAuth(),
        ),
      ),
      child: UserDataView(email: email, password: password),
    );
  }
}
