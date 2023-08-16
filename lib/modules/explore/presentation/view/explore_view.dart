part of 'view.dart';

class ExploreView extends StatelessWidget {
  const ExploreView({super.key});

  static const routeName = '/explore';
  static String route() => '/explore';

  @override
  Widget build(BuildContext context) {
    return Center(child: Text(LocaleStrings.exploreTitle));
  }
}
