part of 'view.dart';

class BottomBarView extends StatelessWidget {
  BottomBarView({
    super.key,
    required this.child,
    required this.currentRoute,
  });

  final Widget child;
  final String currentRoute;

  final List<Tabs> tabs = Tabs.values.toList();

  int getCurrentIndex() {
    for (int i = 0; i < tabs.length; i++) {
      if (currentRoute.contains(tabs[i].iconTab.route)) {
        return i;
      }
    }
    return 0;
  }

  @override
  Widget build(BuildContext context) {
    final int currentIndex = getCurrentIndex();

    return Scaffold(
      bottomNavigationBar: LayoutBuilder(
        builder: (context, size) {
          return BottomNavigationBar(
            backgroundColor: Colors.black87,
            type: BottomNavigationBarType.fixed,
            currentIndex: currentIndex,
            onTap: (val) => context.go(tabs[val].iconTab.route),
            selectedItemColor: Colors.white,
            unselectedItemColor: Colors.grey.withOpacity(0.7),
            items: List.generate(
              tabs.length,
              (index) => BottomNavigationBarItem(
                icon: NavBarIcon(
                  iconTab: tabs[index].iconTab,
                  isActive: currentIndex == index,
                  size: size,
                ),
                label: tabs[index].iconTab.label,
              ),
            ),
          );
        },
      ),
      body: SafeArea(child: child),
    );
  }
}

class NavBarIcon extends StatelessWidget {
  const NavBarIcon({
    super.key,
    required this.iconTab,
    required this.isActive,
    required this.size,
  });

  final IconTab iconTab;
  final bool isActive;
  final BoxConstraints size;

  @override
  Widget build(BuildContext context) {
    return isActive
        ? Column(
            children: [
              Container(
                width: size.maxWidth * 0.13,
                height: size.maxHeight * 0.003,
                color: Colors.lightGreenAccent,
              ),
              SizedBox(
                height: size.maxHeight * 0.005,
              ),
              Icon(iconTab.icon),
            ],
          )
        : Icon(iconTab.icon);
  }
}
