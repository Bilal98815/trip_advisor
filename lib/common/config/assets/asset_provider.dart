part of 'assets.dart';

class AssetProvider extends InheritedWidget {
  const AssetProvider({super.key, required super.child, required this.assets});

  final Assets assets;

  static AssetProvider of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<AssetProvider>()!;
  }

  @override
  bool updateShouldNotify(covariant AssetProvider oldWidget) {
    return assets != oldWidget.assets;
  }
}
