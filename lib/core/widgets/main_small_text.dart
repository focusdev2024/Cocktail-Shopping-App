import 'package:flutter/material.dart';

class MainSmallTextWidget extends StatelessWidget {
  final String text;
  const MainSmallTextWidget({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: Colors.white,
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
