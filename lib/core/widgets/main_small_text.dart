import 'package:flutter/material.dart';

class MainSmallTextWidget extends StatelessWidget {
  final String text;
  final bool? colorDark;
  final double fontSize;
  final TextAlign textAlign;
  const MainSmallTextWidget({
    super.key,
    required this.text,
    this.colorDark,
    this.fontSize = 16,
    this.textAlign = TextAlign.start,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color:
            (colorDark ?? true)
                ? Theme.of(context).cardColor
                : Theme.of(context).canvasColor,
        fontFamily: 'Inter',
        fontSize: fontSize,
        fontWeight: FontWeight.w500,
      ),
      maxLines: 4,
      overflow: TextOverflow.ellipsis,
      textAlign: textAlign,
      softWrap: true,
    );
  }
}
