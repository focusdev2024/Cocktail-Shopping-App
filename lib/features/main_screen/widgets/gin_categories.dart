import 'package:cocktail_cosmo_design/core/constants/app_dimension.dart';
import 'package:cocktail_cosmo_design/core/widgets/container_text.dart';
import 'package:flutter/material.dart';

class GinCategoriesWidget extends StatelessWidget {
  const GinCategoriesWidget({
    super.key,
    required this.categories,
    required this.categoriesImage,
  });

  final List<String> categories;
  final List<String> categoriesImage;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
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
                    (screenWidth - (crossAxisCount - 1) * 16) / crossAxisCount;
                final itemHeight = itemWidth / 0.9;
                final aspectRatio = itemWidth / itemHeight;
                return GridView.builder(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  shrinkWrap: true,
                  itemCount: 6,
                  physics: NeverScrollableScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
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
