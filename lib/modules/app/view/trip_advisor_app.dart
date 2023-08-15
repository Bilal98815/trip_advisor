part of 'view.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late final Localization _localization;

  @override
  void initState() {
    super.initState();
    _localization = EasyLocalizationPackage();
  }

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider.value(
      value: _localization,
      child: MultiBlocProvider(
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
        ],
        child: const TripAdvisorAppView(),
      ),
    );
  }
}
