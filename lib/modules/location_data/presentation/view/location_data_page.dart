part of 'view.dart';

class LocationDataPage extends StatelessWidget {
  const LocationDataPage({
    super.key,
    required this.email,
    required this.password,
  });

  final String email;
  final String password;

  static const routeName = 'locationData';
  static String route() => '/onboarding/signup/locationData';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LocationDataBloc(
        locationDataRepository: LocationDataRepositoryImp(
          locationDataAuth: LocationDataAuth(),
        ),
      ),
      child: LocationDataView(email: email, password: password),
    );
  }
}
