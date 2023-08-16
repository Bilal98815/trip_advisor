part of 'widgets.dart';

class ActionButton extends StatelessWidget {
  const ActionButton({
    required this.size,
    required this.text,
    required this.onTap,
    super.key,
  });
  final BoxConstraints size;
  final String text;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: size.maxWidth * 0.4,
        height: size.maxHeight * 0.06,
        decoration: BoxDecoration(
          color: Colors.black12,
          borderRadius: const BorderRadius.all(Radius.circular(30)),
          border: Border.all(color: Colors.white),
        ),
        child: Center(
          child: CommonText(
            text: text,
            color: Colors.white,
            fontsize: 17,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
    );
  }
}
