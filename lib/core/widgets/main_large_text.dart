import 'package:flutter/material.dart';

class MainLargeTextWidget extends StatelessWidget {
  final String text;
  const MainLargeTextWidget({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,

      style: TextStyle(
        color: Colors.white,
        fontFamily: 'Playfair',
        fontSize: 40,
        fontWeight: FontWeight.bold,
        height: 1.2,
      ),
      maxLines: 4,
      overflow: TextOverflow.ellipsis,
      textAlign: TextAlign.start,
      softWrap: true,
    );
  }
}
