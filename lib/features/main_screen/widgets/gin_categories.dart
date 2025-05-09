import 'package:cocktail_cosmo_design/core/assets_path/app_icons.dart';
import 'package:cocktail_cosmo_design/core/constants/app_dimension.dart';
import 'package:cocktail_cosmo_design/core/widgets/container_grey_small_text.dart';
import 'package:cocktail_cosmo_design/core/widgets/container_text.dart';
import 'package:flutter/material.dart';

class GinCategoriesWidget extends StatelessWidget {
  const GinCategoriesWidget({
    super.key,
    required this.categories,
    required this.categoriesImage,
    required this.recipiesTitle,
    this.ontap,
  });

  final List<String> categories;
  final List<String> recipiesTitle;
  final List<String> categoriesImage;
  final VoidCallback? ontap;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        int crossAxisCount = constraints.maxWidth > 600 ? 4 : 2;
        final screenHeight = AppDimensions.screenHeight(context);
        final screenWidth = AppDimensions.screenWidth(context);
        final desiredItemHeight = screenHeight * 0.27;
        final desiredItemWidth = screenWidth / crossAxisCount;
        final childAspectRatio = desiredItemWidth / desiredItemHeight;

        return GridView.builder(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          shrinkWrap: true,
          itemCount: 6,
          physics: NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: crossAxisCount,
            crossAxisSpacing: 5,
            mainAxisSpacing: 16,
            childAspectRatio: childAspectRatio,
          ),
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: ontap,
              child: CategoryCard(
                title: categories[index],
                imagePath: categoriesImage[index],
                recipiesTitle: recipiesTitle[index],
                onTap: ontap,
              ),
            );
          },
        );
      },
    );
  }
}

class CategoryCard extends StatelessWidget {
  final String title;
  final String recipiesTitle;
  final String imagePath;
  final VoidCallback? onTap;

  const CategoryCard({
    super.key,
    required this.title,
    required this.imagePath,
    required this.recipiesTitle,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 150,
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              image: DecorationImage(
                image: AssetImage(imagePath),
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ContainerTextWidget(
                      item: title,
                      color: Theme.of(context).canvasColor,
                    ),
                    const SizedBox(height: 5),
                    ContainerGreySmallTextWidget(
                      item: recipiesTitle,
                      color: Theme.of(context).disabledColor,
                    ),
                  ],
                ),
              ),
              GestureDetector(
                onTap: onTap,
                child: Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    color: Theme.of(context).focusColor,
                    shape: BoxShape.circle,
                  ),
                  child: Image.asset(AppIcons.nextIcon),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
