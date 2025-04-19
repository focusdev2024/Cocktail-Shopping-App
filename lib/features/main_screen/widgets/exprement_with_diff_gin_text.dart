import 'package:cocktail_cosmo_design/core/widgets/main_large_text.dart';
import 'package:cocktail_cosmo_design/core/widgets/main_small_text.dart';
import 'package:flutter/material.dart';

class ExperimentWithDiffGinText extends StatelessWidget {
  const ExperimentWithDiffGinText({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        children: [
          MainLargeTextWidget(
            text: 'EXPERIMENT WITH DIFFERENT FLAVOURS',
            colorDark: false,
            fontSize: 32,
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 25.0),
          MainSmallTextWidget(
            text:
                'Create your signature gin cocktails by exploring a variety of exciting ingredients.',
            colorDark: false,
            fontSize: 14,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
