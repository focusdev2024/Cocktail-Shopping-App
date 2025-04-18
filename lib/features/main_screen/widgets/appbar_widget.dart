import 'package:cocktail_cosmo_design/core/assets_path/app_icons.dart';
import 'package:cocktail_cosmo_design/core/assets_path/app_images.dart';
import 'package:cocktail_cosmo_design/core/constants/app_dimension.dart';
import 'package:cocktail_cosmo_design/core/widgets/content_small_text.dart';
import 'package:cocktail_cosmo_design/core/widgets/main_small_text.dart';
import 'package:flutter/material.dart';

class AppBarWidget extends StatelessWidget {
  final String findCocktail;
  final String openDrawerIcon;
  final VoidCallback onOpenDrawer;

  const AppBarWidget({
    super.key,
    required this.findCocktail,
    required this.openDrawerIcon,
    required this.onOpenDrawer,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 25.0),
      width: AppDimensions.screenWidth(context),
      height: AppDimensions.setHeight(context, 0.09),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.asset(AppImages.logo),
              GestureDetector(
                onTap: () {},
                child: Container(
                  width: AppDimensions.setWidth(context, 0.4),
                  padding: EdgeInsets.symmetric(
                    horizontal: 8.0,
                    vertical: 10.0,
                  ),
                  decoration: BoxDecoration(
                    color: Theme.of(context).cardColor,
                    borderRadius: BorderRadius.all(Radius.circular(30)),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      ContentSmallTextWidget(text: findCocktail),
                      Image.asset(
                        AppIcons.searchIcon,
                        color: Theme.of(context).canvasColor,
                      ),
                    ],
                  ),
                ),
              ),
              GestureDetector(
                onTap: onOpenDrawer,
                child: Image.asset(
                  openDrawerIcon,
                  color: Theme.of(context).cardColor,
                ),
              ),
            ],
          ),
          Divider(color: Theme.of(context).disabledColor, thickness: 1),
        ],
      ),
    );
  }
}
