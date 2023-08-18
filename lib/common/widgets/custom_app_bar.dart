part of 'widgets.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    super.key,
    this.title = '',
    this.actions,
    this.onBack,
    this.allowBack = true,
  });

  final String title;
  final List<Widget>? actions;
  final VoidCallback? onBack;
  final bool allowBack;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      title: CommonText(
        text: title,
        color: Colors.white,
        fontsize: 17,
        fontWeight: FontWeight.w500,
      ),
      centerTitle: true,
      leading: Padding(
        padding: const EdgeInsets.only(left: 5),
        child: GestureDetector(
          onTap: () => onBack ?? context.pop(),
          child: const Icon(
            Icons.arrow_back_ios_new,
            color: Colors.white,
            size: 20,
          ),
        ),
      ),
      actions: actions,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
