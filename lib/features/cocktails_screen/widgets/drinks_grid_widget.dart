import 'package:cocktail_cosmo_design/core/assets_path/app_icons.dart';
import 'package:cocktail_cosmo_design/core/widgets/container_text.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class DrinksGridWidget extends StatefulWidget {
  const DrinksGridWidget({super.key, required this.recipes});

  final List<Map<String, dynamic>> recipes;

  @override
  State<DrinksGridWidget> createState() => _DrinksGridWidgetState();
}

class _DrinksGridWidgetState extends State<DrinksGridWidget> {
  bool _starClick = false;

  //bool _thumbup = false;
  void _toggleStarClick() {
    setState(() {
      _starClick = !_starClick;
    });
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
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
          itemCount: 4,
          physics: NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: crossAxisCount,
            crossAxisSpacing: 15,
            mainAxisSpacing: 15,
            childAspectRatio: aspectRatio,
          ),
          itemBuilder: (context, index) {
            final drink = widget.recipes[index];
            return Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(18),
              ),
              child: Column(
                children: [
                  Expanded(
                    flex: 4,
                    child: ClipRRect(
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(18),
                        topRight: Radius.circular(18),
                      ),
                      child: Image.asset(
                        drink['image'],
                        height: 180,
                        width: double.infinity,
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: Theme.of(context).primaryColor,
                        borderRadius: const BorderRadius.only(
                          bottomLeft: Radius.circular(18),
                          bottomRight: Radius.circular(18),
                        ),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          ContainerTextWidget(item: drink['name'], color: null),
                          const SizedBox(height: 10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  GestureDetector(
                                    onTap: () {}, // _toggleThumbupClick,
                                    child: Image.asset(
                                      AppIcons.thumbupIcon,
                                      color: Theme.of(context).cardColor,
                                      // _thumbup
                                      //     ? Theme.of(
                                      //       context,
                                      //     ).focusColor
                                      //     : Theme.of(
                                      //       context,
                                      //     ).cardColor,
                                      width: 18,
                                    ),
                                  ),
                                  const SizedBox(width: 6),
                                  ContainerTextWidget(
                                    item: '${drink['likes']}',
                                    color: null,
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  GestureDetector(
                                    onTap: _toggleStarClick,
                                    child: Image.asset(
                                      AppIcons.starIcon,
                                      color:
                                          _starClick
                                              ? Theme.of(context).focusColor
                                              : Theme.of(context).cardColor,
                                      width: 18,
                                    ),
                                  ),
                                  const SizedBox(width: 6),
                                  ContainerTextWidget(
                                    item: '${drink['stars']}',
                                    color: null,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
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
