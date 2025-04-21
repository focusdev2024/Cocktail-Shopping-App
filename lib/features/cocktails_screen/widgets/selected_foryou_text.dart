import 'package:cocktail_cosmo_design/core/widgets/main_large_text.dart';
import 'package:flutter/material.dart';

class SelectedForYouText extends StatelessWidget {
  const SelectedForYouText({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        children: [
          MainLargeTextWidget(
            text: 'SELECTED FOR YOU',
            colorDark: false,
            fontSize: 32,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
