part of 'view.dart';

class TripAdvisorAppView extends StatelessWidget {
  const TripAdvisorAppView({super.key});

  @override
  Widget build(BuildContext context) {
    return EasyLocalization(
      supportedLocales: kSupportedLocales,
      path: kPath,
      fallbackLocale: kFallbackLocale,
      startLocale: kStartingLocale,
      child: Builder(
        builder: (context) {
          return MaterialApp.router(
            localizationsDelegates: context.localizationDelegates,
            supportedLocales: context.supportedLocales,
            locale: context.locale,
            routerConfig: AppRouter().router,
            title: LocaleStrings.appTitle,
            debugShowCheckedModeBanner: false,
            theme: TripAdvisorTheme.light,
            darkTheme: TripAdvisorTheme.dark,
            builder: (context, child) {
              context.setLocale(
                context.select(
                  (PreferencesBloc bloc) => bloc.state.language.language.locale,
                ),
              );
              return AssetProvider(
                assets: Theme.of(context).brightness == Brightness.dark
                    ? DarkThemeAssets()
                    : LightThemeAssets(),
                child: child ?? Container(),
              );
            },
          );
        },
      ),
    );
  }
}
