import 'package:flutter/material.dart';

class MainMediumTextWidget extends StatelessWidget {
  final String text;
  final bool? colorDark;
  final double fontSize;
  final TextAlign textAlign;
  const MainMediumTextWidget({
    super.key,
    required this.text,
    this.colorDark,
    this.fontSize = 40,
    this.textAlign = TextAlign.start,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,

      style: TextStyle(
        color:
            (colorDark ?? true)
                ? Theme.of(context).canvasColor
                : Theme.of(context).cardColor,
        fontFamily: 'Playfair',
        fontSize: fontSize,
        fontWeight: FontWeight.w500,
        height: 1.2,
      ),
      maxLines: 4,
      overflow: TextOverflow.ellipsis,
      textAlign: textAlign,
      softWrap: true,
    );
  }
}
