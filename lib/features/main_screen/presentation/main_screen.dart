import 'package:cocktail_cosmo_design/core/assets_path/app_icons.dart';
import 'package:cocktail_cosmo_design/core/constants/app_dimension.dart';
import 'package:cocktail_cosmo_design/core/widgets/container_text.dart';
import 'package:cocktail_cosmo_design/features/main_screen/widgets/cocktails_menu.dart';
import 'package:cocktail_cosmo_design/features/main_screen/widgets/exprement_with_diff_gin_text.dart';
import 'package:cocktail_cosmo_design/features/main_screen/widgets/grid_cocktail_field.dart';
import 'package:cocktail_cosmo_design/features/main_screen/widgets/ingredients_selection_field.dart';
import 'package:cocktail_cosmo_design/features/main_screen/widgets/main_field.dart';
import 'package:cocktail_cosmo_design/features/main_screen/widgets/mix_your_gin_text.dart';
import 'package:cocktail_cosmo_design/features/main_screen/widgets/your_cocktail_menutext.dart';
import 'package:flutter/material.dart';

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

  void goToNextPage() {
    // Navigator.push(
    //   context,
    //   MaterialPageRoute(
    //     builder:
    //         (_) => SelectedIngredientsScreen(
    //           selected: selectedIngredients.toList(),
    //         ),
    //   ),
    // );
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
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
            child: SizedBox(height: AppDimensions.setHeight(context, 0.05)),
          ),
          SliverToBoxAdapter(child: HorizontalCardList()),
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
              goToNextPage: goToNextPage,
            ),
          ),
          SliverToBoxAdapter(
            child: SizedBox(height: AppDimensions.setHeight(context, 0.02)),
          ),
          SliverToBoxAdapter(child: ExperimentWithDiffGinText()),
          SliverToBoxAdapter(
            child: SizedBox(
              height: AppDimensions.setHeight(context, 0.78),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: LayoutBuilder(
                      builder: (context, constraints) {
                        int crossAxisCount = constraints.maxWidth > 600 ? 4 : 2;
                        final screenWidth = MediaQuery.of(context).size.width;
                        final itemWidth =
                            (screenWidth - (crossAxisCount - 1) * 16) /
                            crossAxisCount;
                        final itemHeight = itemWidth / 0.9;
                        final aspectRatio = itemWidth / itemHeight;
                        return GridView.builder(
                          padding: const EdgeInsets.symmetric(horizontal: 16.0),
                          shrinkWrap: true,
                          itemCount: 6,
                          physics: NeverScrollableScrollPhysics(),
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: crossAxisCount,
                                crossAxisSpacing: 16,
                                mainAxisSpacing: 16,
                                childAspectRatio: aspectRatio,
                              ),
                          itemBuilder: (context, index) {
                            return CategoryCard(
                              title: categories[index],
                              imagePath: categoriesImage[index],
                            );
                          },
                        );
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Theme.of(context).focusColor,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 34,
                          vertical: 24,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                      onPressed: () {},
                      child: ContainerTextWidget(
                        item: 'Explore More',
                        color: Theme.of(context).canvasColor,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class CategoryCard extends StatelessWidget {
  final String title;
  final String imagePath;
  const CategoryCard({super.key, required this.title, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        image: DecorationImage(image: AssetImage(imagePath), fit: BoxFit.cover),
      ),
      child: Align(
        alignment: Alignment.bottomCenter,
        child: Container(
          width: 200,
          margin: const EdgeInsets.all(8),
          padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 10),

          decoration: BoxDecoration(
            // ignore: deprecated_member_use
            color: Theme.of(context).cardColor.withOpacity(0.9),
            borderRadius: BorderRadius.circular(12),
          ),
          child: ContainerTextWidget(
            item: title,
            color: Theme.of(context).canvasColor,
          ),
        ),
      ),
    );
  }
}
