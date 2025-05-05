import 'package:cocktail_cosmo_design/core/assets_path/app_icons.dart';
import 'package:cocktail_cosmo_design/core/constants/app_dimension.dart';
import 'package:flutter/material.dart';

class ResponsiveGrid extends StatelessWidget {
  ResponsiveGrid({super.key});

  final List<RecipeItem> recipes = [
    RecipeItem(
      title: '100 Gin Recipes',
      description: 'A handpicked selection of classic and creative cocktails.',
      imagePath: AppIcons.listIcon,
    ),
    RecipeItem(
      title: 'Perfect for Home Bartenders',
      description:
          'Whether you\'re a beginner or an expert, our recipes make mixology easy',
      imagePath: AppIcons.homeIcon,
    ),
    RecipeItem(
      title: 'Authentic Photos & Videos',
      description: 'Real drinks, real ingredients, real inspiration.',
      imagePath: AppIcons.cameraIcon,
    ),
    RecipeItem(
      title: 'Quality Guaranteed',
      description:
          'Every recipe is tested and crafted by mixology professionals.',
      imagePath: AppIcons.medalIcon,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        int crossAxisCount = constraints.maxWidth > 600 ? 4 : 2;
        final screenHeight = AppDimensions.screenHeight(context);
        final screenWidth = AppDimensions.screenWidth(context);
        final desiredItemHeight = screenHeight * 0.25;
        final desiredItemWidth = screenWidth / crossAxisCount;
        final childAspectRatio = desiredItemWidth / desiredItemHeight;
        return GridView.builder(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          shrinkWrap: true,
          itemCount: 4,
          physics: NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: crossAxisCount,
            crossAxisSpacing: 16,
            mainAxisSpacing: 16,
            childAspectRatio: childAspectRatio,
          ),
          itemBuilder: (context, index) {
            final item = recipes[index];
            return Container(
              padding: EdgeInsets.all(8),

              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 70,
                    height: 70,
                    padding: EdgeInsets.all(10.0),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: Theme.of(context).primaryColor,
                      shape: BoxShape.circle,
                    ),
                    child: Image.asset(item.imagePath),
                  ),
                  SizedBox(height: 10.0),
                  Text(
                    item.title,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                  SizedBox(height: 5.0),
                  Expanded(
                    child: Text(
                      item.description,
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }
}

class RecipeItem {
  final String title;
  final String description;
  final String imagePath;

  RecipeItem({
    required this.title,
    required this.description,
    required this.imagePath,
  });
}
