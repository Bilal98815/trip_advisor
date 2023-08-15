part of 'view.dart';

class TripAdvisorAppView extends StatelessWidget {
  const TripAdvisorAppView({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      localizationsDelegates: const [],
      supportedLocales: const [Locale('en', 'US'), Locale('en', 'GB')],
      locale: const Locale('en', 'US'),
      routerConfig: AppRouter().router,
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
    );
  }
}
