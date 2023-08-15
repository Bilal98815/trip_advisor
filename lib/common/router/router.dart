// ignore_for_file: avoid_classes_with_only_static_members

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:trip_advisor/common/helpers/shared_preferences/shared_preferences.dart';
import 'package:trip_advisor/modules/account/account.dart';
import 'package:trip_advisor/modules/bottom_bar/bottom_bar.dart';

import 'package:trip_advisor/modules/edit_profile/edit_profile.dart';
import 'package:trip_advisor/modules/explore/explore.dart';
import 'package:trip_advisor/modules/forgot_password/forgot_password.dart';
import 'package:trip_advisor/modules/location_data/location_data.dart';
import 'package:trip_advisor/modules/login/login.dart';
import 'package:trip_advisor/modules/onboarding/presentation/view/onboarding_view.dart';
import 'package:trip_advisor/modules/plan_trip/presentation/view/view.dart';
import 'package:trip_advisor/modules/profile/presentation/view/view.dart';
import 'package:trip_advisor/modules/review/presentation/view/view.dart';
import 'package:trip_advisor/modules/search/presentation/search_view.dart';
import 'package:trip_advisor/modules/signup/presentation/view/view.dart';
import 'package:trip_advisor/modules/splash/presentation/view/splash_view.dart';
import 'package:trip_advisor/modules/support/presentation/view/support_view.dart';
import 'package:trip_advisor/modules/user_data/presentation/view/view.dart';

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
        builder: (context, state) {
          return const SplashView();
        },
        redirect: (context, state) async {
          final bool userAuthenticated = await isUserAuthenticated(context);
          return userAuthenticated
              ? ExploreView.route()
              : OnboardingView.route();
        },
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
                path: ForgotPasswordPage.routeName,
                builder: (context, state) => const ForgotPasswordPage(),
              ),
            ],
          ),
          GoRoute(
            path: SignUpPage.routeName,
            builder: (context, state) => const SignUpPage(),
            routes: [
              GoRoute(
                path: LocationDataPage.routeName,
                name: LocationDataPage.routeName,
                builder: (context, state) {
                  final params = state.extra! as Map<String, String>;
                  return LocationDataPage(
                    email: params['email']!,
                    password: params['password']!,
                  );
                },
                routes: [
                  GoRoute(
                    path: UserDataPage.routeName,
                    name: UserDataPage.routeName,
                    builder: (context, state) {
                      final params = state.extra! as Map<String, String>;
                      return UserDataPage(
                        email: params['email']!,
                        password: params['password']!,
                      );
                    },
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
      ShellRoute(
        navigatorKey: _shellNavigatorKey,
        builder: (context, state, child) => BottomBarPage(
          currentRoute: state.matchedLocation,
          child: child,
        ),
        routes: [
          GoRoute(
            path: ExploreView.routeName,
            builder: (context, state) => const ExploreView(),
          ),
          GoRoute(
            path: SearchView.routeName,
            builder: (context, state) => const SearchView(),
          ),
          GoRoute(
            path: PlanTripPage.routeName,
            builder: (context, state) => const PlanTripPage(),
          ),
          GoRoute(
            path: ReviewPage.routeName,
            builder: (context, state) => const ReviewPage(),
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
                    path: EditProfilePage.routeName,
                    builder: (context, state) => const EditProfilePage(),
                  )
                ],
              ),
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

  static Future<bool> isUserAuthenticated(BuildContext context) async {
    final prefs = Preferences();
    final user = await prefs.getSharedPreferenceUser();
    return user.email != null;
  }
}
