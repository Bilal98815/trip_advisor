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
            languagePreferencesRepository: PreferencesRepositoryImp(
              preferencesAuth: PreferencesAuth(),
            ),
          )..add(PreferencesGetPreferences()),
        ),
      ],
      child: const TripAdvisorAppView(),
    );
  }
}
