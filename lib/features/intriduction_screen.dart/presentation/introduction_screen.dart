import 'package:cocktail_cosmo_design/core/assets_path/app_images.dart';
import 'package:cocktail_cosmo_design/core/constants/app_dimension.dart';
import 'package:cocktail_cosmo_design/core/widgets/main_large_text.dart';
import 'package:cocktail_cosmo_design/core/widgets/main_small_text.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:get/get.dart';

class IntroScreen extends StatefulWidget {
  const IntroScreen({super.key});

  @override
  State<IntroScreen> createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  final PageController _controller = PageController();
  int _currentPage = 0;

  final List<String> _imagePaths = [
    AppImages.intro1,
    AppImages.intro2,
    AppImages.intro3,
    AppImages.intro4,
    AppImages.intro5,
  ];

  void _finishIntro() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isFirstLaunch', false);
    Get.offAllNamed('/home'); // Change route if needed
  }

  void _previousSlide() {
    if (_currentPage > 0) {
      _controller.previousPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> slides = [
      // Slide 1
      Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(AppImages.intro1, fit: BoxFit.cover),
          Container(
            color: Colors.black.withOpacity(0.3),
            padding: const EdgeInsets.all(26.0),
            child: SizedBox(),
          ),
          Positioned(
            top: AppDimensions.setHeight(context, 0.55),
            left: 40,
            right: 20,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  MainLargeTextWidget(text: 'WELCOME!'),
                  SizedBox(height: 25.0),
                  MainSmallTextWidget(
                    text:
                        'Discover 100 incredible gin cocktails - with step-by-step video guides, expert tips, and effortless mixology at your fingertips.',
                  ),
                  SizedBox(height: 35.0),
                ],
              ),
            ),
          ),
        ],
      ),

      // Slide 2
      Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(AppImages.intro2, fit: BoxFit.cover),

          Positioned(
            top: AppDimensions.setHeight(context, 0.07),
            left: 40,
            right: 40,
            child: Center(
              child: Column(
                children: [
                  MainLargeTextWidget(
                    text: 'CHOOSE YOUR INGREDIENTS!',
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 25.0),
                  MainSmallTextWidget(
                    text:
                        'Find cocktails with your favourite flavours - from classic citrus to bold, unexpected twists!',
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 35.0),
                ],
              ),
            ),
          ),
        ],
      ),

      // Slide 3
      Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(AppImages.intro3, fit: BoxFit.cover),
          Positioned(
            top: AppDimensions.setHeight(context, 0.025),
            left: 40,
            right: 40,
            child: Center(
              child: Column(
                children: [
                  MainLargeTextWidget(
                    text: 'QUICK & EASY OR SOMETHING FANCY?',
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 25.0),
                  MainSmallTextWidget(
                    text:
                        'Filter recipes to match your mood - simple serves in minutes or intricate creations to impress.',
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 35.0),
                ],
              ),
            ),
          ),
        ],
      ),

      // Slide 4
      Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(AppImages.intro4, fit: BoxFit.cover),
          Positioned(
            top: AppDimensions.setHeight(context, 0.07),
            left: 40,
            right: 40,
            child: Center(
              child: Column(
                children: [
                  MainLargeTextWidget(
                    text: 'SHAKE IT UP WITH EASY!',
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 25.0),
                  MainSmallTextWidget(
                    text:
                        'Follow our expert bartender in easy-to-follow videos - just mix, shake, and enjoy the perfect cocktail.',
                    textAlign: TextAlign.center,
                  ),

                  SizedBox(height: 35.0),
                ],
              ),
            ),
          ),
        ],
      ),

      // Slide 5
      Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(AppImages.intro5, fit: BoxFit.cover),
          Positioned(
            top: AppDimensions.setHeight(context, 0.07),
            left: 40,
            right: 40,
            child: Center(
              child: Column(
                children: [
                  MainLargeTextWidget(
                    text: 'TRY SOMETHING NEW!',
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 25.0),
                  MainSmallTextWidget(
                    text:
                        'Discover unique flavours with our expert recommendations - the perfect way to elevate your gin cocktails!',
                    textAlign: TextAlign.center,
                  ),

                  SizedBox(height: 35.0),
                ],
              ),
            ),
          ),
        ],
      ),
    ];
    return Scaffold(
      body: Stack(
        children: [
          PageView.builder(
            controller: _controller,
            itemCount: _imagePaths.length,
            onPageChanged: (index) {
              setState(() => _currentPage = index);
            },
            itemBuilder: (context, index) {
              return slides[index];
            },
          ),

          // Dot Indicator
          Positioned(
            bottom: 80,
            left: 0,
            right: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(_imagePaths.length, (index) {
                return AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  margin: const EdgeInsets.symmetric(horizontal: 4),
                  width: 10,
                  height: 10,
                  decoration: BoxDecoration(
                    color:
                        _currentPage == index
                            ? Theme.of(context).primaryColor
                            : Theme.of(context).focusColor,
                    shape: BoxShape.circle,
                  ),
                );
              }),
            ),
          ),

          Positioned(
            bottom: 30,
            left: 20,
            right: 20,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                if (_currentPage > 0)
                  ElevatedButton(
                    onPressed: _previousSlide,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white.withOpacity(0.8),
                      foregroundColor: Colors.black,
                    ),
                    child: const Text('Previous'),
                  ),
                ElevatedButton(
                  onPressed: _finishIntro,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Theme.of(context).primaryColor,
                    foregroundColor: Theme.of(context).focusColor,
                  ),
                  child: const Text('Finish'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
