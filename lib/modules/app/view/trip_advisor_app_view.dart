part of 'view.dart';

class TripAdvisorAppView extends StatelessWidget {
  const TripAdvisorAppView({super.key});

  @override
  Widget build(BuildContext context) {
    final localizationPackage = RepositoryProvider.of<Localization>(context);

    return MaterialApp.router(
      localizationsDelegates:
          localizationPackage.localizationDelegates(context),
      supportedLocales: localizationPackage.supportedLocales,
      locale: localizationPackage.locale(context),
      routerConfig: AppRouter().router,
      title: localizationPackage.translation('name'),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
    );
  }
}
