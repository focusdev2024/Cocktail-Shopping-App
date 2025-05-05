import 'package:cocktail_cosmo_design/core/assets_path/app_icons.dart';
import 'package:cocktail_cosmo_design/core/constants/app_dimension.dart';
import 'package:cocktail_cosmo_design/core/widgets/search_widget.dart';
import 'package:cocktail_cosmo_design/features/cocktails_screen/presentation/cocktail_drawer_screen.dart';
import 'package:cocktail_cosmo_design/features/cocktails_screen/widgets/ad_banner_widget.dart';
import 'package:cocktail_cosmo_design/features/cocktails_screen/widgets/based_advansed_filter_buttons.dart';
import 'package:cocktail_cosmo_design/features/cocktails_screen/widgets/cocktail_page_resipies_text.dart';
import 'package:cocktail_cosmo_design/features/cocktails_screen/widgets/cocltail_appbar_widget.dart';
import 'package:cocktail_cosmo_design/core/widgets/drinks_grid_widget.dart';
import 'package:cocktail_cosmo_design/features/cocktails_screen/widgets/selected_foryou_text.dart';
import 'package:cocktail_cosmo_design/features/cocktails_screen/widgets/we_recommend_field.dart';
import 'package:flutter/material.dart';

class CocktailsScreen extends StatefulWidget {
  const CocktailsScreen({super.key});

  @override
  State<CocktailsScreen> createState() => _CocktailsScreenState();
}

class _CocktailsScreenState extends State<CocktailsScreen> {
  final TextEditingController controller = TextEditingController();
  void _activateSearchButton() {
    Navigator.push(
      context,
      PageRouteBuilder(
        pageBuilder:
            (context, animation, secondaryAnimation) => CocktailDrawerScreen(),
      ),
    );
  }

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  void _openDrawer() {
    Navigator.push(
      context,
      PageRouteBuilder(
        transitionDuration: const Duration(milliseconds: 400),
        pageBuilder:
            (context, animation, secondaryAnimation) => CocktailDrawerScreen(),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          final offsetAnimation = Tween<Offset>(
            begin: const Offset(1.0, 0.0),
            end: Offset.zero,
          ).animate(animation);

          return SlideTransition(position: offsetAnimation, child: child);
        },
      ),
    );
  }

  final String openDrawerIcon = AppIcons.menuIcon;

  final List<String> ingredients = [
    "dry vermouth",
    "lemon juice",
    "lemon zest",
    "orange juice",
    "orange zest",
    "sugar syrup",
  ];

  void _weRecommendedClick() {}

  final List<Map<String, dynamic>> drinks = [
    {
      'name': 'Pink Lady',
      'image': 'assets/images/lemon.png',
      'likes': 0,
      'stars': 0,
    },
    {
      'name': 'Eastern Standard',
      'image': 'assets/images/lemon.png',
      'likes': 0,
      'stars': 0,
    },
    {
      'name': 'Clover Club',
      'image': 'assets/images/lemon.png',
      'likes': 0,
      'stars': 0,
    },
    {
      'name': 'Ramos Gin Fizz',
      'image': 'assets/images/lemon.png',
      'likes': 1,
      'stars': 0,
    },
  ];

  final String addBannerImagePath = 'assets/images/lemon.png';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.only(top: 5.0),
              child: CocktailAppBarWidget(
                onOpenDrawer: _openDrawer,
                openDrawerIcon: openDrawerIcon,
                onSearchTap: _openDrawer,
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: SizedBox(height: AppDimensions.setHeight(context, 0.01)),
          ),
          SliverToBoxAdapter(child: CocktailScreenRecipesText()),
          SliverToBoxAdapter(
            child: SizedBox(height: AppDimensions.setHeight(context, 0.01)),
          ),
          SliverToBoxAdapter(
            child: RecommendedCocktailsWidget(
              ingredients: ingredients,
              weRecommendedClick: _weRecommendedClick,
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: FilterButtons(),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: SearchWidget(
                controller: controller,
                onSearch: _activateSearchButton,
              ),
            ),
          ),
          SliverToBoxAdapter(child: DrinksGridWidget(recipes: drinks)),
          SliverToBoxAdapter(
            child: AdBanner(addBannerImagePath: addBannerImagePath),
          ),
          SliverToBoxAdapter(
            child: SizedBox(height: AppDimensions.setHeight(context, 0.05)),
          ),
          SliverToBoxAdapter(child: BlueAloneText(text: 'SELECTED FOR YOU')),
          SliverToBoxAdapter(
            child: SizedBox(height: AppDimensions.setHeight(context, 0.02)),
          ),
          SliverToBoxAdapter(child: DrinksGridWidget(recipes: drinks)),
        ],
      ),
    );
  }
}
