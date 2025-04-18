import 'package:cocktail_cosmo_design/core/assets_path/app_icons.dart';
import 'package:cocktail_cosmo_design/core/constants/app_dimension.dart';
import 'package:cocktail_cosmo_design/core/widgets/main_large_text.dart';
import 'package:cocktail_cosmo_design/core/widgets/main_small_text.dart';
import 'package:cocktail_cosmo_design/features/main_screen/widgets/app_drawer.dart';
import 'package:cocktail_cosmo_design/features/main_screen/widgets/appbar_widget.dart';
import 'package:cocktail_cosmo_design/features/main_screen/widgets/background_image.dart';
import 'package:cocktail_cosmo_design/features/main_screen/widgets/cocktails_menu.dart';
import 'package:cocktail_cosmo_design/features/main_screen/widgets/gradient_color.dart';
import 'package:cocktail_cosmo_design/features/main_screen/widgets/grid_field.dart';
import 'package:cocktail_cosmo_design/features/main_screen/widgets/search_field.dart';
import 'package:cocktail_cosmo_design/features/main_screen/widgets/your_cocktail_menutext.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final TextEditingController _controller = TextEditingController();
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  bool _isDrawerOpen = false;
  void _openDrawer() {
    setState(() {
      _isDrawerOpen = !_isDrawerOpen;
    });
  }

  final String openDrawerIcon = AppIcons.menuIcon;
  final String closeDrawerIcon = AppIcons.closeIcon;

  void _activateSearchButton() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      key: _scaffoldKey,
      body: CustomScrollView(
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
                  onOpenDrawer: _openDrawer,
                  openDrawerIcon:
                      _isDrawerOpen ? closeDrawerIcon : openDrawerIcon,
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
                              controller: _controller,
                              onSearch: _activateSearchButton,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                //drawer field
                if (_isDrawerOpen)
                  Positioned.fill(
                    child: GestureDetector(
                      onTap: _openDrawer,
                      // ignore: deprecated_member_use
                      child: Container(color: Colors.black.withOpacity(0.4)),
                    ),
                  ),
                AnimatedPositioned(
                  duration: const Duration(milliseconds: 300),
                  top: 70,
                  right:
                      _isDrawerOpen ? 0 : -AppDimensions.screenWidth(context),
                  bottom: 0,
                  width: AppDimensions.screenWidth(context),
                  child: Material(
                    elevation: 8,
                    color: Theme.of(context).drawerTheme.backgroundColor,
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(16),
                    ),
                    child: CustomDrawer(),
                  ),
                ),
              ],
            ),
          ),
          SliverToBoxAdapter(child: SizedBox(height: 60)),
          SliverToBoxAdapter(child: ResponsiveGrid()),
          SliverToBoxAdapter(child: SizedBox(height: 40)),
          SliverToBoxAdapter(child: YourCocktailMenuText()),
          SliverToBoxAdapter(child: SizedBox(height: 40)),
          SliverToBoxAdapter(child: HorizontalCardList()),
        ],
      ),
    );
  }
}
