part of 'view.dart';

class EditProfilePage extends StatelessWidget {
  const EditProfilePage({super.key});

  static const routeName = 'edit';
  static String route() => '/account/profile/edit';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => EditProfileBloc(
        editProfileRepository: EditProfileRepositoryImp(
          editProfileAuth: EditProfileAuth(),
        ),
      ),
      child: EditProfileView(),
    );
  }
}
