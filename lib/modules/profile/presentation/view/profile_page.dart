part of 'view.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  static const routeName = 'profile';
  static String route() => '/account/profile';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProfileBloc(
        profileRepository: ProfileRepositoryImp(
          profileAuth: ProfileAuth(),
        ),
      ),
      child: const ProfileView(),
    );
  }
}
