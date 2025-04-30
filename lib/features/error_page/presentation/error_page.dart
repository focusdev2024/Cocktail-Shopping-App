import 'package:cocktail_cosmo_design/core/assets_path/app_images.dart';
import 'package:cocktail_cosmo_design/core/constants/app_dimension.dart';
import 'package:cocktail_cosmo_design/features/error_page/widgets/error_page_text.dart';
import 'package:flutter/material.dart';

class ErrorPage extends StatelessWidget {
  final String errorMessage;

  const ErrorPage({super.key, this.errorMessage = "Something went wrong!"});

  @override
  Widget build(BuildContext context) {
    // You can customize this UI as you need
    return Scaffold(
      body: SizedBox(
        height: AppDimensions.screenHeight(context),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 150.0,
            horizontal: 16.0,
          ),
          child: Stack(
            children: [
              Image.asset(AppImages.errorImage),
              Positioned(top: 300, left: 0, right: 0, child: ErrorPageText()),
            ],
          ),
        ),
      ),
    );
  }
}
