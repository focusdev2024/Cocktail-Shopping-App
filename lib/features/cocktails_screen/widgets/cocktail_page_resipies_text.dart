import 'package:cocktail_cosmo_design/core/widgets/main_large_text.dart';

import 'package:flutter/material.dart';

class CocktailScreenRecipesText extends StatelessWidget {
  const CocktailScreenRecipesText({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          MainLargeTextWidget(
            text: 'Recipes',
            colorDark: false,
            fontSize: 32,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
