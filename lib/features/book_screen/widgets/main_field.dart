import 'package:cocktail_cosmo_design/core/constants/app_dimension.dart';
import 'package:cocktail_cosmo_design/core/widgets/content_small_text.dart';
import 'package:cocktail_cosmo_design/core/widgets/main_medium_text.dart';
import 'package:cocktail_cosmo_design/features/cocktails_screen/widgets/cocltail_appbar_widget.dart';
import 'package:cocktail_cosmo_design/features/main_screen/widgets/main_drawer.dart';
import 'package:flutter/material.dart';

class BoookScreenContent extends StatefulWidget {
  final bool isDrawerOpen;
  final String openDrawerIcon;
  final String closeDrawerIcon;
  final VoidCallback onOpenDrawer;
  final VoidCallback goToHomePage;
  final VoidCallback onSearchTap;

  const BoookScreenContent({
    super.key,
    required this.isDrawerOpen,
    required this.openDrawerIcon,
    required this.closeDrawerIcon,
    required this.onOpenDrawer,
    required this.goToHomePage,
    required this.onSearchTap,
  });

  @override
  State<BoookScreenContent> createState() => _BoookScreenContent();
}

class _BoookScreenContent extends State<BoookScreenContent> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        CocktailAppBarWidget(
          onOpenDrawer: widget.onOpenDrawer,
          onSearchTap: widget.onSearchTap,
          openDrawerIcon:
              widget.isDrawerOpen
                  ? widget.closeDrawerIcon
                  : widget.openDrawerIcon,
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 1.0,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                PageUnderConstructionText(),
                const SizedBox(height: 30),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Theme.of(context).focusColor,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 44,
                      vertical: 20,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  onPressed: widget.goToHomePage,
                  child: ContentSmallTextWidget(text: 'Back to Home'),
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

class PageUnderConstructionText extends StatelessWidget {
  const PageUnderConstructionText({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          MainMediumTextWidget(
            text: 'PAGE IS UNDER CONSTRUCTION',
            colorDark: true,
            fontSize: 32,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
