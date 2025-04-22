import 'package:cocktail_cosmo_design/core/widgets/content_small_text.dart';
import 'package:cocktail_cosmo_design/core/widgets/main_medium_text.dart';
import 'package:flutter/material.dart';

class RecommendedIngredientsWidget extends StatelessWidget {
  const RecommendedIngredientsWidget({
    super.key,
    required this.ingredients,
    this.weRecommendedClick,
  });

  final List<String> ingredients;
  final VoidCallback? weRecommendedClick;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        margin: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
        decoration: BoxDecoration(
          color: Theme.of(context).cardColor,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            WeRecommendUsingText(),
            SizedBox(height: 15),
            Wrap(
              spacing: 20,
              runSpacing: 10,
              children:
                  ingredients.map((ingredient) {
                    return GestureDetector(
                      onTap: weRecommendedClick,
                      child: Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 8,
                        ),
                        decoration: BoxDecoration(
                          color: Theme.of(context).primaryColor,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: ContentSmallTextWidget(
                          text: ingredient,
                          color: Theme.of(context).cardColor,
                        ),
                      ),
                    );
                  }).toList(),
            ),
          ],
        ),
      ),
    );
  }
}

class WeRecommendUsingText extends StatelessWidget {
  const WeRecommendUsingText({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          MainMediumTextWidget(
            text: 'We  recommend using:',
            colorDark: true,
            fontSize: 22,
            textAlign: TextAlign.start,
          ),
        ],
      ),
    );
  }
}
