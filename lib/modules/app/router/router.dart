import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:trip_advisor/common/common.dart';
import 'package:trip_advisor/modules/account/account.dart';
import 'package:trip_advisor/modules/bottom_bar/bottom_bar.dart';
import 'package:trip_advisor/modules/edit_profile/edit_profile.dart';
import 'package:trip_advisor/modules/explore/explore.dart';
import 'package:trip_advisor/modules/forgot_password/forgot_password.dart';
import 'package:trip_advisor/modules/location_data/location_data.dart';
import 'package:trip_advisor/modules/login/login.dart';
import 'package:trip_advisor/modules/onboarding/onboarding.dart';
import 'package:trip_advisor/modules/plan_trip/plan_trip.dart';
import 'package:trip_advisor/modules/profile/profile.dart';
import 'package:trip_advisor/modules/review/review.dart';
import 'package:trip_advisor/modules/search/search.dart';
import 'package:trip_advisor/modules/signup/signup.dart';
import 'package:trip_advisor/modules/splash/splash.dart';
import 'package:trip_advisor/modules/support/support.dart';
import 'package:trip_advisor/modules/trip_detail/presentation/presentation.dart';
import 'package:trip_advisor/modules/user_data/user_data.dart';
import 'package:trip_advisor/common/helpers/helpers.dart';
import 'package:trip_advisor/modules/modules.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>();
final _shellNavigatorKey = GlobalKey<NavigatorState>();

class AppRouter {
  final GoRouter _router = GoRouter(
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
              ? ExplorePage.route()
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
            path: ExplorePage.routeName,
            builder: (context, state) => const ExplorePage(),
            routes: [
              GoRoute(
                path: TripDetailView.routeName,
                name: TripDetailView.routeName,
                builder: (context, state) {
                  final params = state.extra! as Map<String, TripModel>;
                  return TripDetailView(tripModel: params['tripModel']!);
                },
              ),
            ],
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
                path: PreferencesView.routeName,
                builder: (context, state) => const PreferencesView(),
                routes: [
                  GoRoute(
                    path: LanguagePreferencesView.routeName,
                    builder: (context, state) =>
                        const LanguagePreferencesView(),
                  ),
                  GoRoute(
                    path: CurrencyPreferencesView.routeName,
                    builder: (context, state) =>
                        const CurrencyPreferencesView(),
                  ),
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

  GoRouter get router => _router;

  static Future<bool> isUserAuthenticated(BuildContext context) async {
    final prefs = Preferences();
    final user = await prefs.getSharedPreferenceUser();
    return user.email != null;
  }
}
