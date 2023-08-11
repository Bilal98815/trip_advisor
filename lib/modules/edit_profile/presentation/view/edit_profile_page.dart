part of 'view.dart';

class EditProfilePage extends StatelessWidget {
  const EditProfilePage({super.key, required this.profileBloc});

  final ProfileBloc profileBloc;

  static const routeName = 'edit';
  static String route() => '/account/profile/edit';

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider.value(value: profileBloc),
        BlocProvider(
          create: (context) => EditProfileBloc(
            editProfileRepository: EditProfileRepositoryImp(
              editProfileAuth: EditProfileAuth(),
            ),
          ),
        ),
      ],
      child: EditProfileView(),
    );
  }
}
