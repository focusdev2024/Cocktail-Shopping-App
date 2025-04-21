import 'package:flutter/material.dart';

class ContentSmallTextWidget extends StatelessWidget {
  final String text;
  final Color? color;
  const ContentSmallTextWidget({super.key, required this.text, this.color});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: color ?? Theme.of(context).canvasColor,
        fontFamily: 'Inter',
        fontSize: 16,
        fontWeight: FontWeight.w500,
      ),
      maxLines: 4,
      overflow: TextOverflow.ellipsis,
      textAlign: TextAlign.justify,
      softWrap: true,
    );
  }
}
