import 'package:cocktail_cosmo_design/core/assets_path/app_icons.dart';
import 'package:cocktail_cosmo_design/core/assets_path/app_images.dart';
import 'package:cocktail_cosmo_design/core/constants/app_dimension.dart';
import 'package:cocktail_cosmo_design/core/widgets/content_small_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class CocktailAppBarWidget extends StatelessWidget {
  final String openDrawerIcon;
  final VoidCallback onOpenDrawer;

  const CocktailAppBarWidget({
    super.key,
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
              Image.asset(
                AppImages.logo,
                color: Theme.of(context).primaryColor,
              ),
              GestureDetector(
                onTap: () {},
                child: Container(
                  width: AppDimensions.setWidth(context, 0.4),
                  padding: EdgeInsets.symmetric(
                    horizontal: 8.0,
                    vertical: 10.0,
                  ),
                  decoration: BoxDecoration(
                    color: Theme.of(context).canvasColor,
                    borderRadius: BorderRadius.all(Radius.circular(30)),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      ContentSmallTextWidget(
                        text: AppLocalizations.of(context)!.findCocktail,
                        color: Theme.of(context).cardColor,
                      ),
                      Image.asset(
                        AppIcons.searchIcon,
                        color: Theme.of(context).cardColor,
                      ),
                    ],
                  ),
                ),
              ),
              GestureDetector(
                onTap: onOpenDrawer,
                child: SizedBox(
                  width: AppDimensions.setWidth(context, 0.1),
                  child: Image.asset(
                    openDrawerIcon,
                    color: Theme.of(context).canvasColor,
                    height: 24,
                  ),
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
