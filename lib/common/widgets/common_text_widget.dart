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

class TileTitleText extends StatelessWidget {
  const TileTitleText({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return CommonText(
      textAlign: TextAlign.start,
      text: title,
      color: Colors.white,
      fontsize: 15,
      fontWeight: FontWeight.w500,
    );
  }
}

class TileSubtitleText extends StatelessWidget {
  const TileSubtitleText({super.key, required this.subtitle});

  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return CommonText(
      textAlign: TextAlign.start,
      text: subtitle,
      color: const Color.fromARGB(220, 220, 220, 220),
      fontsize: 13,
      fontWeight: FontWeight.w400,
    );
  }
}
