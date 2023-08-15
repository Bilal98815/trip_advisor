part of 'view.dart';

class PlanTripPage extends StatelessWidget {
  const PlanTripPage({super.key});

  static const routeName = '/plan';
  static String route() => '/plan';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PlanTripBloc(),
      child: const PlanTripView(),
    );
  }
}
