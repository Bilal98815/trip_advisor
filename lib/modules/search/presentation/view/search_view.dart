part of 'view.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  static const routeName = '/search';
  static String route() => '/search';

  @override
  Widget build(BuildContext context) {
    return const Center(child: Text('Search'));
  }
}
