import 'package:cocktail_cosmo_design/core/widgets/main_large_text.dart';
import 'package:cocktail_cosmo_design/core/widgets/main_small_text.dart';
import 'package:flutter/material.dart';

class YourCocktailMenuText extends StatelessWidget {
  const YourCocktailMenuText({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        children: [
          MainLargeTextWidget(
            text: 'YOUR COCKTAIL MENU FOR TODAY',
            colorDark: false,
            fontSize: 32,
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 25.0),
          MainSmallTextWidget(
            text:
                'Every day is different—just like every cocktail should be! Discover a fresh selection of gin-based delights curated just for you.',
            colorDark: true,
            fontSize: 14,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
