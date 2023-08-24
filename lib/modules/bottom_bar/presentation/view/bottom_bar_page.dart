part of 'view.dart';

class BottomBarPage extends StatefulWidget {
  const BottomBarPage({
    super.key,
    required this.child,
    required this.currentRoute,
  });

  final Widget child;
  final String currentRoute;

  @override
  State<BottomBarPage> createState() => _BottomBarPageState();
}

class _BottomBarPageState extends State<BottomBarPage> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProfileBloc(
        profileRepository: ProfileRepositoryImp(
          profileAuth: ProfileAuth(),
        ),
      ),
      child:
          BottomBarView(currentRoute: widget.currentRoute, child: widget.child),
    );
  }
}
