part of 'view.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  static const routeName = '/';
  static String route() => '/';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: Colors.black87,
        child: Container(
          width: 30,
          height: 30,
          padding: const EdgeInsets.all(110.0),
          child: CircleAvatar(
            maxRadius: 0.5,
            backgroundColor: Colors.white,
            child: Padding(
              padding: const EdgeInsets.all(50.0),
              child: Image.asset(AssetProvider.of(context).assets.owlLogo),
            ),
          ),
        ),
      ),
    );
  }
}
