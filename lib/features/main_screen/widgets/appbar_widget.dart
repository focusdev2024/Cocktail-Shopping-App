import 'package:cocktail_cosmo_design/core/assets_path/app_icons.dart';
import 'package:cocktail_cosmo_design/core/assets_path/app_images.dart';
import 'package:cocktail_cosmo_design/core/constants/app_dimension.dart';
import 'package:cocktail_cosmo_design/core/widgets/content_small_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class AppBarWidget extends StatelessWidget {
  final String openDrawerIcon;
  final VoidCallback onOpenDrawer;
  final bool? appTransparest;
  final VoidCallback? onSearchTap;

  const AppBarWidget({
    super.key,
    required this.openDrawerIcon,
    required this.onOpenDrawer,
    this.appTransparest = true,
    this.onSearchTap,
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
                color:
                    appTransparest == true
                        ? Theme.of(context).cardColor
                        : Theme.of(context).primaryColor,
              ),
              GestureDetector(
                onTap: onSearchTap,
                child: Container(
                  width: AppDimensions.setWidth(context, 0.4),
                  padding: EdgeInsets.symmetric(
                    horizontal: 8.0,
                    vertical: 10.0,
                  ),
                  decoration: BoxDecoration(
                    color:
                        appTransparest == true
                            ? Theme.of(context).cardColor
                            : Theme.of(context).canvasColor,
                    borderRadius: BorderRadius.all(Radius.circular(30)),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      ContentSmallTextWidget(
                        text: AppLocalizations.of(context)!.findCocktail,
                        color:
                            appTransparest == true
                                ? Theme.of(context).canvasColor
                                : Theme.of(context).cardColor,
                      ),
                      Image.asset(
                        AppIcons.searchIcon,
                        color:
                            appTransparest == true
                                ? Theme.of(context).canvasColor
                                : Theme.of(context).cardColor,
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
                    color:
                        appTransparest == true
                            ? Theme.of(context).cardColor
                            : Theme.of(context).canvasColor,
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
