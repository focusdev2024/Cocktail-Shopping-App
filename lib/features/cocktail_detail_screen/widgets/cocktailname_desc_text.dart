import 'package:cocktail_cosmo_design/core/widgets/main_large_text.dart';
import 'package:cocktail_cosmo_design/core/widgets/main_small_text.dart';
import 'package:flutter/material.dart';

class CocktailNameAndDescText extends StatelessWidget {
  final String cocktailName;
  final String cocktailDesciption;
  const CocktailNameAndDescText({
    super.key,
    required this.cocktailName,
    required this.cocktailDesciption,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          MainLargeTextWidget(
            text: cocktailName,
            colorDark: false,
            fontSize: 32,
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 25.0),
          MainSmallTextWidget(
            text: cocktailDesciption,
            colorDark: false,
            fontSize: 14,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
