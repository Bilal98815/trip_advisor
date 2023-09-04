part of 'view.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => LoginBloc(
            loginRepository:
                LoginRepositoryImp(loginAuthService: LoginAuthService()),
          ),
        ),
        BlocProvider(
          create: (context) => AccountBloc(
            accountRepository: AccountRepositoryImp(
              accountAuth: AccountAuth(),
            ),
          ),
        ),
        BlocProvider(
          create: (context) => PreferencesBloc(
            preferencesRepository: PreferencesRepositoryImp(
              preferencesAPI: PreferencesFirebaseAPI(),
            ),
          )..add(PreferencesGetPreferences()),
        ),
        BlocProvider(
          create: (context) => ExploreBloc(
            prefs: Preferences(),
            exploreRepository: ExploreRepositoryImp(
              exploreAuth: ExploreAuth(firestore: FirebaseFirestore.instance),
            ),
          )..add(GetTripsEvent()),
        ),
      ],
      child: const TripAdvisorAppView(),
    );
  }
}
