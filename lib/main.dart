import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trip_advisor/modules/forgot_password/data/forgot_password_auth.dart';
import 'package:trip_advisor/modules/forgot_password/domain/repository/forgot_password_repository_imp.dart';
import 'package:trip_advisor/modules/forgot_password/presentation/bloc/forgot_password_bloc.dart';
import 'package:trip_advisor/modules/onboarding/presentation/view/onbaording_view.dart';
import 'package:trip_advisor/modules/user_data/data/user_data_auth.dart';
import 'package:trip_advisor/modules/user_data/domain/repository/user_data_repository_imp.dart';
import 'package:trip_advisor/modules/user_data/presentation/bloc/user_data_bloc.dart';

import 'modules/login/data/login_auth_service.dart';
import 'modules/login/domain/repository/login_repository_imp.dart';
import 'modules/login/presentation/bloc/login_bloc.dart';
import 'modules/signup/data/signup_auth_service.dart';
import 'modules/signup/domain/repository/signup_repository_imp.dart';
import 'modules/signup/presentation/bloc/signup_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

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
          create: (context) => SignupBloc(
            signUpRepository: SignUpRepositoryImp(
              signupAuthService: SignupAuthService(),
            ),
          ),
        ),
        BlocProvider(
          create: (context) => UserDataBloc(
            userDataRepository: UserDataRepositoryImp(
              userDataAuth: UserDataAuth(),
            ),
          ),
        ),
        BlocProvider(
          create: (context) => ForgotPasswordBloc(
            forgotPasswordRepository: ForgotPasswordRepositoryImp(
              forgotPasswordAuth: ForgotPasswordAuth(),
            ),
          ),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const OnboardingView(),
      ),
    );
  }
}
