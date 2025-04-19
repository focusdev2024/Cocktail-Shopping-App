import 'package:cocktail_cosmo_design/core/assets_path/app_icons.dart';
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
        final screenWidth = MediaQuery.of(context).size.width;
        final itemWidth =
            (screenWidth - (crossAxisCount - 1) * 16) / crossAxisCount;
        final itemHeight = itemWidth / 0.9;
        final aspectRatio = itemWidth / itemHeight;
        return GridView.builder(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          shrinkWrap: true,
          itemCount: 4,
          physics: NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: crossAxisCount,
            crossAxisSpacing: 16,
            mainAxisSpacing: 16,
            childAspectRatio: aspectRatio,
          ),
          itemBuilder: (context, index) {
            final item = recipes[index];
            return SizedBox(
              child: Column(
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
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                  SizedBox(height: 5.0),
                  Text(item.description),
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
