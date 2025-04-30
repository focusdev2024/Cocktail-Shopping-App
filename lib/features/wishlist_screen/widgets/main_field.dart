import 'package:cocktail_cosmo_design/core/constants/app_dimension.dart';
import 'package:cocktail_cosmo_design/core/widgets/main_large_text.dart';
import 'package:cocktail_cosmo_design/core/widgets/main_small_text.dart';
import 'package:cocktail_cosmo_design/features/cocktails_screen/presentation/cocktail_drawer_screen.dart';
import 'package:cocktail_cosmo_design/features/cocktails_screen/widgets/cocltail_appbar_widget.dart';
import 'package:cocktail_cosmo_design/features/main_screen/widgets/main_drawer.dart';
import 'package:flutter/material.dart';

class WishlistScreenContent extends StatefulWidget {
  final bool isDrawerOpen;
  final String openDrawerIcon;
  final String closeDrawerIcon;
  final VoidCallback onOpenDrawer;

  const WishlistScreenContent({
    super.key,
    required this.isDrawerOpen,
    required this.openDrawerIcon,
    required this.closeDrawerIcon,
    required this.onOpenDrawer,
  });

  @override
  State<WishlistScreenContent> createState() => _WishlistScreenContent();
}

class _WishlistScreenContent extends State<WishlistScreenContent> {
  void _activateSearchButton() {
    Navigator.push(
      context,
      PageRouteBuilder(
        pageBuilder:
            (context, animation, secondaryAnimation) => CocktailDrawerScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        CocktailAppBarWidget(
          onSearchTap: _activateSearchButton,
          onOpenDrawer: widget.onOpenDrawer,
          openDrawerIcon:
              widget.isDrawerOpen
                  ? widget.closeDrawerIcon
                  : widget.openDrawerIcon,
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 1.0,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 90),
              FovouritesPageText(),
              const SizedBox(height: 30),
            ],
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

class FovouritesPageText extends StatelessWidget {
  const FovouritesPageText({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          MainLargeTextWidget(
            text: 'FAVOURITES',
            colorDark: false,
            fontSize: 32,
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 15.0),
          MainSmallTextWidget(
            text: 'Here is a list of selected cocktails.',
            colorDark: false,
            fontSize: 14,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
