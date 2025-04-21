import 'package:cocktail_cosmo_design/core/assets_path/app_icons.dart';
import 'package:cocktail_cosmo_design/core/constants/app_dimension.dart';
import 'package:cocktail_cosmo_design/features/cocktails_screen/widgets/ad_banner_widget.dart';
import 'package:cocktail_cosmo_design/features/cocktails_screen/widgets/based_advansed_filter_buttons.dart';
import 'package:cocktail_cosmo_design/features/cocktails_screen/widgets/cocktail_appbar.dart';
import 'package:cocktail_cosmo_design/features/cocktails_screen/widgets/cocktail_page_resipies_text.dart';
import 'package:cocktail_cosmo_design/features/cocktails_screen/widgets/drinks_grid_widget.dart';
import 'package:cocktail_cosmo_design/features/cocktails_screen/widgets/selected_foryou_text.dart';
import 'package:cocktail_cosmo_design/features/cocktails_screen/widgets/we_recommend_field.dart';
import 'package:cocktail_cosmo_design/features/main_screen/widgets/main_field.dart';
import 'package:flutter/material.dart';

class CocktailsScreen extends StatefulWidget {
  const CocktailsScreen({super.key});

  @override
  State<CocktailsScreen> createState() => _CocktailsScreenState();
}

class _CocktailsScreenState extends State<CocktailsScreen> {
  final TextEditingController controller = TextEditingController();
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  bool _isDrawerOpen = false;

  void _openDrawer() {
    setState(() {
      _isDrawerOpen = !_isDrawerOpen;
    });
  }

  final String openDrawerIcon = AppIcons.menuIcon;
  final String closeDrawerIcon = AppIcons.closeIcon;

  final List<String> ingredients = [
    "dry vermouth",
    "lemon juice",
    "lemon zest",
    "orange juice",
    "orange zest",
    "sugar syrup",
  ];

  void _weRecommendedClick() {
    // Navigator.push(
    //   context,
    //   MaterialPageRoute(
    //     builder: (context) => IngredientDetailScreen(ingredient: ingredient),
    //   ),
    // );
  }

  void _activateSearchButton() {}

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
              child: CocktailAppBar(
                isDrawerOpen: _isDrawerOpen,
                openDrawerIcon: openDrawerIcon,
                closeDrawerIcon: closeDrawerIcon,
                onOpenDrawer: _openDrawer,
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
            child: RecommendedIngredientsWidget(
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
          SliverToBoxAdapter(child: SelectedForYouText()),
          SliverToBoxAdapter(
            child: SizedBox(height: AppDimensions.setHeight(context, 0.02)),
          ),
          SliverToBoxAdapter(child: DrinksGridWidget(recipes: drinks)),
        ],
      ),
    );
  }
}
