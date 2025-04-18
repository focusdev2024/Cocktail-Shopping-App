import 'package:cocktail_cosmo_design/core/assets_path/app_images.dart';
import 'package:cocktail_cosmo_design/core/constants/app_color.dart';
import 'package:cocktail_cosmo_design/core/constants/app_dimension.dart';
import 'package:cocktail_cosmo_design/core/widgets/main_large_text.dart';
import 'package:cocktail_cosmo_design/core/widgets/main_small_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.backgroudColorApp,
      body: CustomScrollView(
        slivers: <Widget>[
          SliverToBoxAdapter(
            child: Stack(
              children: <Widget>[
                SizedBox(
                  width: AppDimensions.screenWidth(context),
                  height: AppDimensions.setHeight(context, 0.95),
                  child: Image.asset(
                    AppImages.backgroundImage,
                    fit: BoxFit.cover,
                  ),
                ),
                Container(
                  width: AppDimensions.screenWidth(context),
                  height: AppDimensions.setHeight(context, 1.0),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        // ignore: deprecated_member_use
                        AppColor.black.withOpacity(0.5),
                        // ignore: deprecated_member_use
                        AppColor.black.withOpacity(0.1),
                      ],
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 25.0),
                  width: AppDimensions.screenWidth(context),
                  height: AppDimensions.setHeight(context, 0.07),

                  child: Row(children: [Image.asset(AppImages.logo)]),
                ),
                Positioned(
                  top: AppDimensions.setHeight(context, 0.35),
                  left: AppDimensions.setWidth(context, 0.1),
                  child: SizedBox(
                    width: AppDimensions.setWidth(context, 0.8),
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
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
