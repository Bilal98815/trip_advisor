import 'package:go_router/go_router.dart';
import 'package:trip_advisor/modules/bottom_bar/presentation/view/bottom_bar_view.dart';
import 'package:trip_advisor/modules/forgot_password/presentation/view/forgot_password_view.dart';
import 'package:trip_advisor/modules/location_data/presentation/view/location_data_view.dart';
import 'package:trip_advisor/modules/login/presentation/view/login_view.dart';
import 'package:trip_advisor/modules/onboarding/presentation/view/onbaording_view.dart';
import 'package:trip_advisor/modules/signup/presentation/view/signup_view.dart';
import 'package:trip_advisor/modules/splash/presentation/view/splash_view.dart';
import 'package:trip_advisor/modules/user_data/presentation/view/user_data_view.dart';

class AppRouter {
  static final GoRouter _router = GoRouter(
    initialLocation: '/',
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const SplashView(),
        routes: [
          GoRoute(
            path: 'onboarding',
            builder: (context, state) => const OnboardingView(),
            routes: [
              GoRoute(
                path: 'login',
                builder: (context, state) => LoginView(),
                routes: [
                  GoRoute(
                    path: 'forgotPassword',
                    builder: (context, state) => ForgotPasswordView(),
                  ),
                ],
              ),
              GoRoute(
                path: 'signup',
                builder: (context, state) => SignUpView(),
                routes: [
                  GoRoute(
                    path: 'locationData',
                    builder: (context, state) => const LocationDataView(),
                    routes: [
                      GoRoute(
                        path: 'userData',
                        builder: (context, state) => UserDataView(),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
          GoRoute(
            path: 'bottomBar',
            builder: (context, state) => BottomBarView(),
          ),
        ],
      ),
    ],
  );

  static GoRouter get router => _router;
}
