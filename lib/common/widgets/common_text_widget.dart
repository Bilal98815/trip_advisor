part of 'widgets.dart';

class CommonText extends StatelessWidget {
  const CommonText({
    required this.text,
    required this.color,
    required this.fontsize,
    required this.fontWeight,
    this.textAlign,
    this.textOverflow,
    super.key,
  });
  final String text;
  final Color color;
  final double fontsize;
  final TextAlign? textAlign;
  final TextOverflow? textOverflow;
  final FontWeight fontWeight;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign ?? TextAlign.center,
      overflow: textOverflow ?? TextOverflow.ellipsis,
      style: TextStyle(
        color: color,
        fontSize: fontsize,
        fontWeight: fontWeight,
      ),
    );
  }
}

class HeadingText extends StatelessWidget {
  const HeadingText({super.key, required this.heading});

  final String heading;

  @override
  Widget build(BuildContext context) {
    return CommonText(
      text: heading,
      color: Colors.white,
      fontsize: 31,
      textAlign: TextAlign.left,
      textOverflow: TextOverflow.clip,
      fontWeight: FontWeight.w800,
    );
  }
}
