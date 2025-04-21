import 'package:cocktail_cosmo_design/core/constants/app_dimension.dart';
import 'package:cocktail_cosmo_design/core/widgets/main_medium_text.dart';
import 'package:flutter/material.dart';

class AdBanner extends StatelessWidget {
  final String addBannerImagePath;

  const AdBanner({super.key, required this.addBannerImagePath});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: AppDimensions.setHeight(context, 0.18),
      margin: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        image: DecorationImage(
          image: AssetImage(addBannerImagePath),
          fit: BoxFit.fill,
          colorFilter: ColorFilter.mode(
            // ignore: deprecated_member_use
            Theme.of(context).canvasColor.withOpacity(0.3),
            BlendMode.darken,
          ),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            AdBannerDirectlyText(),
            const SizedBox(height: 12),
            ElevatedButton(
              onPressed: () {
                // Add navigation logic here
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Theme.of(context).focusColor,
                foregroundColor: Theme.of(context).canvasColor,
                padding: EdgeInsets.symmetric(horizontal: 40.0, vertical: 18.0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
              child: MainMediumTextWidget(
                text: 'Go to the store',
                fontSize: 16,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class AdBannerDirectlyText extends StatelessWidget {
  const AdBannerDirectlyText({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        MainMediumTextWidget(
          text: 'Ad banner directing visitors to your online store',
          colorDark: false,
          fontSize: 22,
          textAlign: TextAlign.start,
        ),
      ],
    );
  }
}
