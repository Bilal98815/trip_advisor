part of 'view.dart';

class BottomBarPage extends StatelessWidget {
  const BottomBarPage({
    super.key,
    required this.child,
    required this.currentRoute,
  });

  final Widget child;
  final String currentRoute;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProfileBloc(
        profileRepository: ProfileRepositoryImp(
          profileAuth: ProfileAuth(),
        ),
      ),
      child: BottomBarView(currentRoute: currentRoute, child: child),
    );
  }
}
