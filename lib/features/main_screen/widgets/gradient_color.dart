import 'package:cocktail_cosmo_design/core/constants/app_dimension.dart';
import 'package:flutter/material.dart';

class GradientColorWidget extends StatelessWidget {
  const GradientColorWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: AppDimensions.screenWidth(context),
      height: AppDimensions.setHeight(context, 1.0),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            // ignore: deprecated_member_use
            Theme.of(context).canvasColor.withOpacity(0.5),
            // ignore: deprecated_member_use
            Theme.of(context).canvasColor.withOpacity(0.1),
          ],
        ),
      ),
    );
  }
}
