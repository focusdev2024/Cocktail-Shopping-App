import 'package:cocktail_cosmo_design/core/assets_path/app_images.dart';
import 'package:cocktail_cosmo_design/core/constants/app_dimension.dart';
import 'package:flutter/material.dart';

class BackGroundImage extends StatelessWidget {
  const BackGroundImage({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: AppDimensions.screenWidth(context),
      height: AppDimensions.setHeight(context, 0.95),
      child: Image.asset(AppImages.backgroundImage, fit: BoxFit.fill),
    );
  }
}
