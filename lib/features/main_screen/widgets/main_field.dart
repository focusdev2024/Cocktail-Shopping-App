import 'package:cocktail_cosmo_design/core/constants/app_dimension.dart';
import 'package:cocktail_cosmo_design/core/widgets/main_large_text.dart';
import 'package:cocktail_cosmo_design/core/widgets/main_small_text.dart';
import 'package:cocktail_cosmo_design/core/widgets/search_widget.dart';
import 'package:cocktail_cosmo_design/features/main_screen/widgets/main_drawer.dart';
import 'package:cocktail_cosmo_design/features/main_screen/widgets/appbar_widget.dart';
import 'package:cocktail_cosmo_design/features/main_screen/widgets/background_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class MainScreenContent extends StatefulWidget {
  final bool isDrawerOpen;
  final String openDrawerIcon;
  final String closeDrawerIcon;
  final VoidCallback onOpenDrawer;
  final TextEditingController controller;
  final VoidCallback onSearch;
  const MainScreenContent({
    super.key,
    required this.isDrawerOpen,
    required this.openDrawerIcon,
    required this.closeDrawerIcon,
    required this.onOpenDrawer,
    required this.controller,
    required this.onSearch,
  });

  @override
  State<MainScreenContent> createState() => _MainScreenContentState();
}

class _MainScreenContentState extends State<MainScreenContent> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        //background image
        BackGroundImage(),
        //main gradient
        GradientColorWidget(),
        //appbar field
        AppBarWidget(
          onOpenDrawer: widget.onOpenDrawer,
          openDrawerIcon:
              widget.isDrawerOpen
                  ? widget.closeDrawerIcon
                  : widget.openDrawerIcon,
        ),

        //main text field
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
                    SearchWidget(
                      controller: widget.controller,
                      onSearch: widget.onSearch,
                      ingredientsScreen: false,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        //drawer field
        if (widget.isDrawerOpen)
          Positioned.fill(
            child: GestureDetector(
              onTap: widget.onOpenDrawer,
              // ignore: deprecated_member_use
              child: Container(color: Colors.black.withOpacity(0.4)),
            ),
          ),
        AnimatedPositioned(
          duration: const Duration(milliseconds: 300),
          top: 70,
          right: widget.isDrawerOpen ? 0 : -AppDimensions.screenWidth(context),
          bottom: 0,
          width: AppDimensions.screenWidth(context),
          child: Material(
            elevation: 8,
            color: Theme.of(context).drawerTheme.backgroundColor,
            borderRadius: const BorderRadius.only(topLeft: Radius.circular(16)),
            child: CustomDrawer(),
          ),
        ),
      ],
    );
  }
}

class GradientColorWidget extends StatelessWidget {
  const GradientColorWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: AppDimensions.screenWidth(context),
      height: AppDimensions.setHeight(context, 0.95),
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
