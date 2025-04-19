import 'package:flutter/material.dart';

class ContainerTextWidget extends StatelessWidget {
  const ContainerTextWidget({
    super.key,
    required this.item,
    required this.color,
  });

  final String item;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Text(
      item,
      style: TextStyle(
        fontWeight: FontWeight.bold,
        color: color ?? Theme.of(context).cardColor,
        fontFamily: 'Inter',
      ),
      maxLines: 2,
      overflow: TextOverflow.ellipsis,
    );
  }
}
