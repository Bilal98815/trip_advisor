part of 'view.dart';

class ExplorePage extends StatelessWidget {
  const ExplorePage({super.key});

  static const routeName = '/explore';

  static String route() => '/explore';

  @override
  Widget build(BuildContext context) {
    return const ExploreView();
  }
}
