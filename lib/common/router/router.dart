import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:trip_advisor/common/helpers/shared_preferences/shared_preferences.dart';
import 'package:trip_advisor/modules/account/presentation/view/account_view.dart';
import 'package:trip_advisor/modules/bottom_bar/presentation/view/bottom_bar_view.dart';
import 'package:trip_advisor/modules/edit_profile/presentation/view/edit_profile_view.dart';
import 'package:trip_advisor/modules/explore/presentation/view/explore_view.dart';
import 'package:trip_advisor/modules/forgot_password/presentation/view/forgot_password_view.dart';
import 'package:trip_advisor/modules/location_data/presentation/view/location_data_view.dart';
import 'package:trip_advisor/modules/login/presentation/view/login_view.dart';
import 'package:trip_advisor/modules/onboarding/presentation/view/onbaording_view.dart';
import 'package:trip_advisor/modules/plan_trip/presentation/view/plan_trip_view.dart';
import 'package:trip_advisor/modules/profile/presentation/view/profile_view.dart';
import 'package:trip_advisor/modules/review/presentation/view/review_view.dart';
import 'package:trip_advisor/modules/search/presentation/search_view.dart';
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
                name: LocationDataView.routeName,
                builder: (context, state) {
                  final params = state.extra as Map<String, String>;

                  return LocationDataView(
                    email: params['email'] as String,
                    password: params['password'] as String,
                  );
                },
                routes: [
                  GoRoute(
                    path: UserDataView.routeName,
                    name: UserDataView.routeName,
                    builder: (context, state) {
                      final params = state.extra as Map<String, String>;
                      return UserDataView(
                        email: params['email'] as String,
                        password: params['password'] as String,
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
        builder: (context, state, child) => BottomBarView(
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
                  ],),
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
