// ignore_for_file: deprecated_member_use

import 'package:cocktail_cosmo_design/core/assets_path/app_icons.dart';
import 'package:cocktail_cosmo_design/core/widgets/container_text.dart';
import 'package:flutter/material.dart';

class HorizontalCardList extends StatefulWidget {
  final VoidCallback? onTap;
  const HorizontalCardList({super.key, this.onTap});

  @override
  State<HorizontalCardList> createState() => _HorizontalCardListState();
}

class _HorizontalCardListState extends State<HorizontalCardList> {
  final PageController _pageController = PageController(viewportFraction: 0.8);
  int _currentIndex = 0;

  final List<Map<String, dynamic>> items = [
    {
      'image': 'assets/images/lemon.png',
      'title': 'Very big and long title name with beautiful words',
      'likes': 46,
      'rating': 4.9,
    },
    {
      'image': 'assets/images/lemon.png',
      'title': 'Tropical Delight with Smooth Taste',
      'likes': 30,
      'rating': 4.7,
    },
    {
      'image': 'assets/images/lemon.png',
      'title': 'Sweet & Sour Perfection',
      'likes': 55,
      'rating': 5.0,
    },
  ];

  bool _starClick = false;
  //bool _thumbup = false;

  void _toggleStarClick() {
    setState(() {
      _starClick = !_starClick;
    });
  }

  // void _toggleThumbupClick() {
  //   setState(() {
  //     _thumbup = !_thumbup;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 400,
          child: PageView.builder(
            controller: _pageController,
            itemCount: items.length,
            onPageChanged: (index) {
              setState(() {
                _currentIndex = index;
              });
            },
            itemBuilder: (context, index) {
              final item = items[index];
              return GestureDetector(
                onTap: widget.onTap,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8.0,
                    vertical: 10.0,
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(18),
                      boxShadow: [
                        BoxShadow(
                          color: Theme.of(
                            context,
                          ).disabledColor.withOpacity(0.2),
                          blurRadius: 10,
                          spreadRadius: 2,
                        ),
                      ],
                    ),
                    child: Column(
                      children: [
                        Expanded(
                          flex: 6,
                          child: ClipRRect(
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(18),
                              topRight: Radius.circular(18),
                            ),
                            child: Image.asset(
                              item['image'],
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
                              children: [
                                Expanded(
                                  flex: 2,
                                  child: ContainerTextWidget(
                                    item: item['title'],
                                    color: null,
                                  ),
                                ),
                                const SizedBox(height: 10),
                                Expanded(
                                  flex: 1,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        children: [
                                          GestureDetector(
                                            onTap:
                                                () {}, // _toggleThumbupClick,
                                            child: Image.asset(
                                              AppIcons.thumbupIcon,
                                              color:
                                                  Theme.of(context).cardColor,
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
                                            item: '${item['likes']}',
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
                                                      ? Theme.of(
                                                        context,
                                                      ).focusColor
                                                      : Theme.of(
                                                        context,
                                                      ).cardColor,
                                              width: 18,
                                            ),
                                          ),
                                          const SizedBox(width: 6),
                                          ContainerTextWidget(
                                            item: '${item['rating']}',
                                            color: null,
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),

        const SizedBox(height: 12),

        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(
            items.length,
            (index) => AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              margin: const EdgeInsets.symmetric(horizontal: 4),
              width: _currentIndex == index ? 10 : 6,
              height: 6,
              decoration: BoxDecoration(
                color:
                    _currentIndex == index
                        ? Theme.of(context).focusColor
                        : Theme.of(context).primaryColor.withOpacity(0.8),
                borderRadius: BorderRadius.circular(3),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
