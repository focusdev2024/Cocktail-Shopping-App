import 'package:cocktail_cosmo_design/core/widgets/main_large_text.dart';
import 'package:flutter/material.dart';

class BlueAloneText extends StatelessWidget {
  final String text;
  const BlueAloneText({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        children: [
          MainLargeTextWidget(
            text: text,
            colorDark: false,
            fontSize: 32,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
