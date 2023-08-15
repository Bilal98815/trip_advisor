part of 'view.dart';

class ReviewPage extends StatelessWidget {
  const ReviewPage({super.key});

  static const routeName = '/review';
  static String route() => '/review';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ReviewBloc(),
      child: const ReviewView(),
    );
  }
}
