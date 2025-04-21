import 'package:cocktail_cosmo_design/core/constants/app_dimension.dart';
import 'package:cocktail_cosmo_design/features/cocktails_screen/widgets/cocktail_drawer.dart';
import 'package:cocktail_cosmo_design/features/cocktails_screen/widgets/cocltail_appbar_widget.dart';

import 'package:flutter/material.dart';

class CocktailAppBar extends StatefulWidget {
  final bool isDrawerOpen;
  final String openDrawerIcon;
  final String closeDrawerIcon;
  final VoidCallback onOpenDrawer;

  const CocktailAppBar({
    super.key,
    required this.isDrawerOpen,
    required this.openDrawerIcon,
    required this.closeDrawerIcon,
    required this.onOpenDrawer,
  });

  @override
  State<CocktailAppBar> createState() => _CocktailAppBarState();
}

class _CocktailAppBarState extends State<CocktailAppBar> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        //appbar field
        CocktailAppBarWidget(
          onOpenDrawer: widget.onOpenDrawer,
          openDrawerIcon:
              widget.isDrawerOpen
                  ? widget.closeDrawerIcon
                  : widget.openDrawerIcon,
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
            child: CocktailDrawer(),
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
