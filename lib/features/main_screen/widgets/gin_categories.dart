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
    required void Function() onTap,
  });

  final List<String> categories;
  final List<String> recipiesTitle;
  final List<String> categoriesImage;
  final VoidCallback? ontap;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: AppDimensions.setHeight(context, 0.85),
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
                final itemHeight = itemWidth / 0.8;
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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: 150,
          width: 200,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            shape: BoxShape.rectangle,
            image: DecorationImage(
              image: AssetImage(imagePath),
              fit: BoxFit.fill,
            ),
          ),
        ),
        SizedBox(height: 5),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ContainerTextWidget(
                  item: title,
                  color: Theme.of(context).canvasColor,
                ),
                SizedBox(height: 10),
                ContainerGreySmallTextWidget(
                  item: recipiesTitle,
                  color: Theme.of(context).disabledColor,
                ),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
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
        SizedBox(height: 5),
      ],
    );
  }
}
