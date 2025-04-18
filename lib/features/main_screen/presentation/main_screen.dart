import 'package:cocktail_cosmo_design/core/assets_path/app_icons.dart';
import 'package:cocktail_cosmo_design/core/constants/app_dimension.dart';
import 'package:cocktail_cosmo_design/core/widgets/content_small_text.dart';
import 'package:cocktail_cosmo_design/core/widgets/main_large_text.dart';
import 'package:cocktail_cosmo_design/core/widgets/main_small_text.dart';
import 'package:cocktail_cosmo_design/features/main_screen/widgets/appbar_widget.dart';
import 'package:cocktail_cosmo_design/features/main_screen/widgets/background_image.dart';
import 'package:cocktail_cosmo_design/features/main_screen/widgets/gradient_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  void _openDrawer() {}
  final String openDrawerIcon = AppIcons.menuIcon;

  @override
  Widget build(BuildContext context) {
    final String findCocktail = AppLocalizations.of(context)!.findCocktail;
    final String findRecipie = AppLocalizations.of(context)!.findRecipe;
    final String search = AppLocalizations.of(context)!.search;
    return CustomScrollView(
      slivers: <Widget>[
        SliverToBoxAdapter(
          child: Stack(
            children: <Widget>[
              //background image
              BackGroundImage(),
              //main gradient
              GradientColorWidget(),
              //appbar field
              AppBarWidget(
                findCocktail: findCocktail,
                onOpenDrawer: _openDrawer,
                openDrawerIcon: openDrawerIcon,
              ),
              Positioned(
                top: AppDimensions.setHeight(context, 0.35),
                left: AppDimensions.setWidth(context, 0.1),
                child: SizedBox(
                  width: AppDimensions.setWidth(context, 0.85),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      MainLargeTextWidget(
                        text: AppLocalizations.of(context)!.discoveraworld,
                      ),
                      SizedBox(height: 25.0),
                      MainSmallTextWidget(
                        text: AppLocalizations.of(context)!.mainText,
                      ),
                      SizedBox(height: 35.0),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            width: AppDimensions.setWidth(context, 0.6),

                            padding: EdgeInsets.symmetric(
                              horizontal: 18.0,
                              vertical: 10.0,
                            ),
                            decoration: BoxDecoration(
                              color: Theme.of(context).cardColor,
                              borderRadius: BorderRadius.all(
                                Radius.circular(30),
                              ),
                            ),
                            child: ContentSmallTextWidget(
                              text: '$findRecipie ...',
                            ),
                          ),
                          SizedBox(width: 10),
                          Container(
                            width: AppDimensions.setWidth(context, 0.2),
                            alignment: Alignment.center,
                            padding: EdgeInsets.symmetric(
                              horizontal: 8.0,
                              vertical: 10.0,
                            ),
                            decoration: BoxDecoration(
                              color: Theme.of(context).focusColor,
                              borderRadius: BorderRadius.all(
                                Radius.circular(30),
                              ),
                            ),
                            child: ContentSmallTextWidget(text: search),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
