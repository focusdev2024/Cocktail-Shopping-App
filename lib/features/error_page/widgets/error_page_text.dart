import 'package:cocktail_cosmo_design/core/widgets/main_large_text.dart';
import 'package:cocktail_cosmo_design/core/widgets/main_small_text.dart';
import 'package:flutter/material.dart';

class ErrorPageText extends StatelessWidget {
  const ErrorPageText({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        children: [
          MainLargeTextWidget(
            text: 'SOMETHING\'S WENT WRONG',
            colorDark: false,
            fontSize: 32,
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 25.0),
          MainSmallTextWidget(
            text: 'This page no longer exists or has never existed.',
            colorDark: false,
            fontSize: 14,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
