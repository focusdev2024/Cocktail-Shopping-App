import 'package:cocktail_cosmo_design/core/assets_path/app_icons.dart';
import 'package:cocktail_cosmo_design/core/constants/app_dimension.dart';
import 'package:cocktail_cosmo_design/features/cocktail_detail_screen/presentation/cocktail_detail_screen.dart';
import 'package:cocktail_cosmo_design/features/cocktails_screen/presentation/cocktail_drawer_screen.dart';
import 'package:cocktail_cosmo_design/features/main_screen/widgets/cocktails_menu.dart';
import 'package:cocktail_cosmo_design/features/main_screen/widgets/exprement_with_diff_gin_text.dart';
import 'package:cocktail_cosmo_design/features/main_screen/widgets/gin_categories.dart';
import 'package:cocktail_cosmo_design/features/main_screen/widgets/grid_cocktail_field.dart';
import 'package:cocktail_cosmo_design/features/main_screen/widgets/ingredients_selection_field.dart';
import 'package:cocktail_cosmo_design/features/main_screen/widgets/main_field.dart';
import 'package:cocktail_cosmo_design/features/main_screen/widgets/mix_your_gin_text.dart';
import 'package:cocktail_cosmo_design/features/main_screen/widgets/popular_cocktails_day_text.dart';
import 'package:cocktail_cosmo_design/features/main_screen/widgets/your_cocktail_menutext.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  final Function(int) onTabChange;
  const MainScreen({super.key, required this.onTabChange});

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

  void _activateSearchButton() {
    Navigator.push(
      context,
      PageRouteBuilder(
        pageBuilder:
            (context, animation, secondaryAnimation) => CocktailDrawerScreen(),
      ),
    );
  }

  final List<String> ingredients = [
    'tonic',
    'lemon',
    'lime',
    'cucumber',
    'basil',
    'ginger',
    'orange',
    'mint',
    'pepper',
  ];

  final Set<String> selectedIngredients = {};

  void toggleSelection(String ingredient) {
    setState(() {
      if (selectedIngredients.contains(ingredient)) {
        selectedIngredients.remove(ingredient);
      } else {
        selectedIngredients.add(ingredient);
      }
    });
  }

  void viewAllIngredients() {
    widget.onTabChange(2);
  }

  final List<String> categories = [
    "Citrus",
    "Herbs & Spices",
    "Syrups",
    "Ice Variations",
    "Fruits & Juices",
    "Sparkling & Tonic",
  ];

  final List<String> categoriesImage = [
    "assets/images/category.png",
    "assets/images/category.png",
    "assets/images/category.png",
    "assets/images/category.png",
    "assets/images/category.png",
    "assets/images/category.png",
  ];
  final List<String> recipiesTitle = [
    "58+ Recipes",
    "72+ Recipes",
    "85+ Recipes",
    "90+ Recipes",
    "63+ Recipes",
    "77+ Recipes",
  ];

  // void _categoryTap() {
  //   // Navigator.push(
  //   //   context,
  //   //   MaterialPageRoute(
  //   //     builder: (_) => const CategoryScreen(),
  //   //   ),
  //   // );
  // }

  void _cocktailDeteilScreen() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => const CocktailDeteilScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      key: _scaffoldKey,
      body: CustomScrollView(
        slivers: <Widget>[
          SliverToBoxAdapter(
            child: MainScreenContent(
              isDrawerOpen: _isDrawerOpen,
              openDrawerIcon: openDrawerIcon,
              closeDrawerIcon: closeDrawerIcon,
              onOpenDrawer: _openDrawer,
              controller: _controller,
              onSearch: _activateSearchButton,
            ),
          ),
          SliverToBoxAdapter(
            child: SizedBox(height: AppDimensions.setHeight(context, 0.05)),
          ),
          SliverToBoxAdapter(child: ResponsiveGrid()),

          SliverToBoxAdapter(
            child: SizedBox(height: AppDimensions.setHeight(context, 0.05)),
          ),
          SliverToBoxAdapter(child: YourCocktailMenuText()),

          SliverToBoxAdapter(
            child: HorizontalCardList(onTap: _cocktailDeteilScreen),
          ),
          SliverToBoxAdapter(
            child: SizedBox(height: AppDimensions.setHeight(context, 0.05)),
          ),
          SliverToBoxAdapter(child: MixYourGinText()),
          SliverToBoxAdapter(
            child: SizedBox(height: AppDimensions.setHeight(context, 0.02)),
          ),
          SliverToBoxAdapter(
            child: IngredientSelectionWidget(
              ingredients: ingredients,
              selectedIngredients: selectedIngredients,
              toggleSelection: toggleSelection,
              goToNextPage: viewAllIngredients,
            ),
          ),
          SliverToBoxAdapter(
            child: SizedBox(height: AppDimensions.setHeight(context, 0.04)),
          ),
          SliverToBoxAdapter(child: ExperimentWithDiffGinText()),
          SliverToBoxAdapter(
            child: GinCategoriesWidget(
              categories: categories,
              categoriesImage: categoriesImage,
              recipiesTitle: recipiesTitle,
              ontap: _cocktailDeteilScreen,
            ),
          ),

          SliverToBoxAdapter(
            child: SizedBox(height: AppDimensions.setHeight(context, 0.02)),
          ),
          SliverToBoxAdapter(child: PopularCocktailsDayText()),
          SliverToBoxAdapter(
            child: SizedBox(height: AppDimensions.setHeight(context, 0.02)),
          ),
          SliverToBoxAdapter(
            child: HorizontalCardList(onTap: _cocktailDeteilScreen),
          ),
          SliverToBoxAdapter(
            child: SizedBox(height: AppDimensions.setHeight(context, 0.02)),
          ),
        ],
      ),
    );
  }
}
