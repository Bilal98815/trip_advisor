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
          create: (context) => PlanTripBloc(),
        ),
        BlocProvider(
          create: (context) => ReviewBloc(),
        ),
        BlocProvider(
          create: (context) => AccountBloc(
            accountRepository: AccountRepositoryImp(
              accountAuth: AccountAuth(),
            ),
          ),
        ),
        BlocProvider(
          create: (context) => ProfileBloc(
            profileRepository: ProfileRepositoryImp(
              profileAuth: ProfileAuth(),
            ),
          ),
        ),
        BlocProvider(
          create: (context) => EditProfileBloc(
            editProfileRepository:
                EditProfileRepositoryImp(editProfileAuth: EditProfileAuth()),
          ),
        ),
      ],
      child: MaterialApp.router(
        routerConfig: AppRouter.router,
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
      ),
    );
  }
}
