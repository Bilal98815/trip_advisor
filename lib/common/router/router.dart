import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:trip_advisor/modules/account/presentation/view/account_view.dart';
import 'package:trip_advisor/modules/bottom_bar/presentation/view/bottom_bar_view.dart';
import 'package:trip_advisor/modules/edit_profile/presentation/view/edit_profile_view.dart';
import 'package:trip_advisor/modules/forgot_password/presentation/view/forgot_password_view.dart';
import 'package:trip_advisor/modules/location_data/presentation/view/location_data_view.dart';
import 'package:trip_advisor/modules/login/presentation/view/login_view.dart';
import 'package:trip_advisor/modules/onboarding/presentation/view/onbaording_view.dart';
import 'package:trip_advisor/modules/plan_trip/presentation/view/plan_trip_view.dart';
import 'package:trip_advisor/modules/profile/presentation/view/profile_view.dart';
import 'package:trip_advisor/modules/review/presentation/view/review_view.dart';
import 'package:trip_advisor/modules/signup/presentation/view/signup_view.dart';
import 'package:trip_advisor/modules/splash/presentation/view/splash_view.dart';
import 'package:trip_advisor/modules/support/presentation/view/support_view.dart';
import 'package:trip_advisor/modules/user_data/presentation/view/user_data_view.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>();
final _shellNavigatorKey = GlobalKey<NavigatorState>();

class AppRouter {
  static final GoRouter _router = GoRouter(
    initialLocation: SplashView.route(),
    navigatorKey: _rootNavigatorKey,
    routes: [
      GoRoute(
        parentNavigatorKey: _rootNavigatorKey,
        path: SplashView.routeName,
        builder: (context, state) => const SplashView(),
      ),
      GoRoute(
        path: OnboardingView.routeName,
        builder: (context, state) => const OnboardingView(),
        routes: [
          GoRoute(
            path: LoginView.routeName,
            builder: (context, state) => LoginView(),
            routes: [
              GoRoute(
                path: ForgotPasswordView.routeName,
                builder: (context, state) => ForgotPasswordView(),
              ),
            ],
          ),
          GoRoute(
            path: SignUpView.routeName,
            builder: (context, state) => SignUpView(),
            routes: [
              GoRoute(
                path: LocationDataView.routeName,
                builder: (context, state) => const LocationDataView(),
                routes: [
                  GoRoute(
                    path: UserDataView.routeName,
                    builder: (context, state) => UserDataView(),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
      ShellRoute(
        navigatorKey: _shellNavigatorKey,
        builder: (context, state, child) => BottomBarView(child: child),
        routes: [
          GoRoute(
            path: '/explore',
            builder: (context, state) => const Center(child: Text('Explore')),
          ),
          GoRoute(
            path: '/search',
            builder: (context, state) => const Center(child: Text('Search')),
          ),
          GoRoute(
            path: PlanTripView.routeName,
            builder: (context, state) => const PlanTripView(),
          ),
          GoRoute(
            path: ReviewView.routeName,
            builder: (context, state) => const ReviewView(),
          ),
          GoRoute(
            path: AccountView.routeName,
            builder: (context, state) => const AccountView(),
            routes: [
              GoRoute(
                  path: ProfileView.routeName,
                  builder: (context, state) => const ProfileView(),
                  routes: [
                    GoRoute(
                      path: EditProfileView.routeName,
                      builder: (context, state) => EditProfileView(),
                    )
                  ]),
              GoRoute(
                path: SupportView.routeName,
                builder: (context, state) => const SupportView(),
              ),
            ],
          ),
        ],
      )
    ],
  );

  static GoRouter get router => _router;
}
