import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trip_advisor/common/router/router.dart';
import 'package:trip_advisor/modules/account/data/account_auth.dart';
import 'package:trip_advisor/modules/account/domain/repository/account_repository_imp.dart';
import 'package:trip_advisor/modules/account/presentation/bloc/account_bloc.dart';
import 'package:trip_advisor/modules/edit_profile/data/edit_profile_auth.dart';
import 'package:trip_advisor/modules/edit_profile/domain/repository/edit_profile_repository_imp.dart';
import 'package:trip_advisor/modules/edit_profile/presentation/bloc/edit_profile_bloc.dart';
import 'package:trip_advisor/modules/forgot_password/data/forgot_password_auth.dart';
import 'package:trip_advisor/modules/forgot_password/domain/repository/forgot_password_repository_imp.dart';
import 'package:trip_advisor/modules/forgot_password/presentation/bloc/forgot_password_bloc.dart';
import 'package:trip_advisor/modules/location_data/data/location_data_auth.dart';
import 'package:trip_advisor/modules/location_data/domain/repository/location_data_repository_imp.dart';
import 'package:trip_advisor/modules/location_data/presentation/bloc/location_data_bloc.dart';
import 'package:trip_advisor/modules/login/data/login_auth_service.dart';
import 'package:trip_advisor/modules/login/domain/repository/login_repository_imp.dart';
import 'package:trip_advisor/modules/login/presentation/bloc/login_bloc.dart';
import 'package:trip_advisor/modules/plan_trip/presentation/bloc/plan_trip_bloc.dart';
import 'package:trip_advisor/modules/profile/data/profile_auth.dart';
import 'package:trip_advisor/modules/profile/domain/repository/profile_repository_imp.dart';
import 'package:trip_advisor/modules/profile/presentation/bloc/profile_bloc.dart';
import 'package:trip_advisor/modules/review/presentation/bloc/review_bloc.dart';
import 'package:trip_advisor/modules/signup/data/signup_auth_service.dart';
import 'package:trip_advisor/modules/signup/domain/repository/signup_repository_imp.dart';
import 'package:trip_advisor/modules/signup/presentation/bloc/signup_bloc.dart';
import 'package:trip_advisor/modules/user_data/data/user_data_auth.dart';
import 'package:trip_advisor/modules/user_data/domain/repository/user_data_repository_imp.dart';
import 'package:trip_advisor/modules/user_data/presentation/bloc/user_data_bloc.dart';

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
        BlocProvider(
          create: (context) => LocationDataBloc(
            locationDataRepository: LocationDataRepositoryImp(
              locationDataAuth: LocationDataAuth(),
            ),
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
