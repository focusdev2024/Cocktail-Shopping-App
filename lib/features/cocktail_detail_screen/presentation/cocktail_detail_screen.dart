// ignore_for_file: avoid_print

import 'package:cocktail_cosmo_design/core/assets_path/app_icons.dart';
import 'package:cocktail_cosmo_design/core/assets_path/app_images.dart';
import 'package:cocktail_cosmo_design/core/constants/app_dimension.dart';
import 'package:cocktail_cosmo_design/core/widgets/search_widget.dart';
import 'package:cocktail_cosmo_design/core/widgets/youtube_video_reader.dart';
import 'package:cocktail_cosmo_design/features/cocktail_detail_screen/widgets/cocktailname_desc_text.dart';
import 'package:cocktail_cosmo_design/features/cocktails_screen/presentation/cocktail_drawer_screen.dart';

import 'package:cocktail_cosmo_design/features/cocktails_screen/widgets/cocltail_appbar_widget.dart';
import 'package:cocktail_cosmo_design/core/widgets/drinks_grid_widget.dart';
import 'package:cocktail_cosmo_design/features/cocktails_screen/widgets/selected_foryou_text.dart';
import 'package:flutter/material.dart';

class CocktailDeteilScreen extends StatefulWidget {
  const CocktailDeteilScreen({super.key});

  @override
  State<CocktailDeteilScreen> createState() => _CocktailDeteilScreenState();
}

class _CocktailDeteilScreenState extends State<CocktailDeteilScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final TextEditingController controller = TextEditingController();
  void _activateSearchButton() {
    Navigator.push(
      context,
      PageRouteBuilder(
        pageBuilder:
            (context, animation, secondaryAnimation) => CocktailDrawerScreen(),
      ),
    );
  }

  void _openDrawer() {
    Navigator.push(
      context,
      PageRouteBuilder(
        transitionDuration: const Duration(milliseconds: 400),
        pageBuilder:
            (context, animation, secondaryAnimation) => CocktailDrawerScreen(),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          final offsetAnimation = Tween<Offset>(
            begin: const Offset(1.0, 0.0),
            end: Offset.zero,
          ).animate(animation);

          return SlideTransition(position: offsetAnimation, child: child);
        },
      ),
    );
  }

  final String openDrawerIcon = AppIcons.menuIcon;

  final List<Map<String, dynamic>> drinks = [
    {
      'name': 'Pink Lady',
      'image': 'assets/images/lemon.png',
      'likes': 0,
      'stars': 0,
    },
    {
      'name': 'Eastern Standard',
      'image': 'assets/images/lemon.png',
      'likes': 0,
      'stars': 0,
    },
    {
      'name': 'Clover Club',
      'image': 'assets/images/lemon.png',
      'likes': 0,
      'stars': 0,
    },
    {
      'name': 'Ramos Gin Fizz',
      'image': 'assets/images/lemon.png',
      'likes': 1,
      'stars': 0,
    },
  ];

  final String addBannerImagePath = 'assets/images/lemon.png';

  final List<Map<String, dynamic>> socialButtons = [
    {'icon': AppImages.twitterIcon, 'onTap': () => print('Twitter tapped')},
    {'icon': AppImages.redditIcon, 'onTap': () => print('Reddit tapped')},
    {'icon': AppImages.gmailIcon, 'onTap': () => print('Gmail tapped')},
    {'icon': AppImages.whatsappIcon, 'onTap': () => print('WhatsApp tapped')},
    {'icon': AppImages.linkedInIcon, 'onTap': () => print('LinkedIn tapped')},
    {'icon': AppImages.facebookIcon, 'onTap': () => print('Facebook tapped')},
  ];

  bool isOz = true;

  final Map<String, Map<String, String>> ingredientValues = {
    'gin': {'oz': '2', 'ml': '60'},
    'white dry wine': {'oz': '⅓', 'ml': '10'},
    'vanilla ice cream': {'oz': '1 scoop', 'ml': '1 scoop'},
    'ground nutmeg': {'oz': '1 pinch', 'ml': '1 pinch'},
    'ice cubes': {'oz': 'to taste', 'ml': 'to taste'},
  };

  final List<String> steps = [
    "Add all the ingredients and ice cubes to the shaker. Shake.",
    "Pour the cocktail into a glass using a strainer.",
    "Garnish with nutmeg.",
  ];

  int rating = 0;
  int favorites = 0;

  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController commentController = TextEditingController();

  final Map<int, String> emojiMap = {
    1: '😭',
    2: '😔',
    3: '😳',
    4: '😋',
    5: '😍',
  };

  void submitFeedback() {
    print(
      'Submitted: ${nameController.text}, ${emailController.text}, ${commentController.text}, Rating: $rating',
    );
  }

  @override
  Widget build(BuildContext context) {
    String unit = isOz ? 'oz' : 'ml';
    return SafeArea(
      child: Stack(
        children: <Widget>[
          Scaffold(
            key: _scaffoldKey,
            body: CustomScrollView(
              slivers: [
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 5.0),
                    child: CocktailAppBarWidget(
                      onOpenDrawer: _openDrawer,
                      openDrawerIcon: openDrawerIcon,
                      onSearchTap: _openDrawer,
                    ),
                  ),
                ),
                SliverToBoxAdapter(
                  child: SizedBox(
                    height: AppDimensions.setHeight(context, 0.01),
                  ),
                ),
                SliverToBoxAdapter(
                  child: CocktailNameAndDescText(
                    cocktailName: 'Cocktail Name',
                    cocktailDesciption: 'Cocktail Description',
                  ),
                ),
                SliverToBoxAdapter(
                  child: SizedBox(
                    height: AppDimensions.setHeight(context, 0.01),
                  ),
                ),
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: YoutubeVideoReader(
                      youtubeUrl: 'https://youtu.be/Ggl50H6Z3XM',
                      thumbnailUrl:
                          'https://img.youtube.com/vi/Ggl50H6Z3XM/0.jpg',
                    ),
                  ),
                ),
                SliverToBoxAdapter(
                  child: SizedBox(
                    height: AppDimensions.setHeight(context, 0.01),
                  ),
                ),
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: UserReactioonSection(),
                  ),
                ),
                SliverToBoxAdapter(
                  child: SizedBox(
                    height: AppDimensions.setHeight(context, 0.01),
                  ),
                ),
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Ingredients',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 12),

                        Row(
                          children: [
                            _unitToggle(
                              'oz',
                              isSelected: isOz,
                              onTap: () => setState(() => isOz = true),
                            ),
                            const SizedBox(width: 8),
                            _unitToggle(
                              'ml',
                              isSelected: !isOz,
                              onTap: () => setState(() => isOz = false),
                            ),
                          ],
                        ),
                        const SizedBox(height: 16),

                        _ingredientLine(ingredientValues['gin']![unit]!, 'gin'),
                        _ingredientLine(
                          ingredientValues['vanilla ice cream']![unit]!,
                          'vanilla ice cream',
                        ),
                        _ingredientLine(
                          ingredientValues['white dry wine']![unit]!,
                          'white dry wine',
                        ),
                        _ingredientLine(
                          ingredientValues['ground nutmeg']![unit]!,
                          'ground nutmeg',
                        ),
                        _ingredientLine(
                          ingredientValues['ice cubes']![unit]!,
                          'ice cubes',
                        ),
                      ],
                    ),
                  ),
                ),
                SliverToBoxAdapter(
                  child: SizedBox(
                    height: AppDimensions.setHeight(context, 0.01),
                  ),
                ),
                SliverToBoxAdapter(child: MethodsSection(steps: steps)),
                SliverToBoxAdapter(
                  child: SizedBox(
                    height: AppDimensions.setHeight(context, 0.01),
                  ),
                ),
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Did you like the recipe?",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 16),
                        Text("Save:"),
                        SizedBox(height: 8),
                        Row(
                          children: [
                            ElevatedButton.icon(
                              onPressed: () {
                                setState(() {
                                  if (favorites == 0) {
                                    favorites++;
                                  } else {
                                    favorites--;
                                  }
                                });
                              },
                              label: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Text("Add to favorites"),
                                  SizedBox(width: 10),
                                  Icon(Icons.favorite, color: Colors.red),
                                  SizedBox(width: 5),
                                  Text('$favorites'),
                                ],
                              ),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.white,
                                foregroundColor: Colors.black,
                              ),
                            ),
                            SizedBox(width: 8),
                          ],
                        ),
                        SizedBox(height: 24),
                        Text(
                          "Rate and leave a comment:",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 8),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: List.generate(5, (index) {
                            final int current = index + 1;
                            return GestureDetector(
                              onTap: () {
                                setState(() {
                                  rating = current;
                                });
                              },
                              child: CircleAvatar(
                                radius: 20,
                                backgroundColor:
                                    rating == current
                                        ? Colors.yellow[100]
                                        : Colors.grey[200],
                                child: Text(
                                  rating == current
                                      ? emojiMap[current]!
                                      : '$current',
                                  style: TextStyle(fontSize: 18),
                                ),
                              ),
                            );
                          }),
                        ),
                        SizedBox(height: 16),
                        Divider(color: Colors.grey[300], thickness: 1),
                        SizedBox(height: 16),
                        Row(
                          children: [
                            Text("$rating ", style: TextStyle(fontSize: 18)),
                            Icon(Icons.star, color: Colors.amber),
                          ],
                        ),
                        Text("Rating out of 0 ratings"),
                        SizedBox(height: 16),
                        Row(
                          children: [
                            Expanded(
                              child: TextField(
                                controller: nameController,
                                decoration: InputDecoration(
                                  hintText: "Name",
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(width: 8),
                            Expanded(
                              child: TextField(
                                controller: emailController,
                                decoration: InputDecoration(
                                  hintText: "Email",
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 12),
                        TextField(
                          controller: commentController,
                          maxLines: 3,
                          decoration: InputDecoration(
                            hintText: "Comment",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                        ),
                        SizedBox(height: 16),
                        ElevatedButton(
                          onPressed: submitFeedback,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.yellow,
                            foregroundColor: Colors.black,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                          child: Text("Submit"),
                        ),
                      ],
                    ),
                  ),
                ),
                SliverToBoxAdapter(
                  child: SizedBox(
                    height: AppDimensions.setHeight(context, 0.01),
                  ),
                ),
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Expanded(child: const Divider(thickness: 1)),
                            BlueAloneText(text: 'Hi! I’m Emma!'),
                            Expanded(child: const Divider(thickness: 1)),
                          ],
                        ),
                        const SizedBox(height: 10),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: Image.asset(
                            'assets/images/emma.png',
                            width: 250,
                            fit: BoxFit.cover,
                          ),
                        ),
                        const SizedBox(height: 20),
                        const Text(
                          "Hi my lovelies! My name is Emma and I am a dessert designer, photographer & blogger. Welcome to my indulgent dessert & baking blog where you will find delicious cheat day recipes, show stoppers, dessert mash-ups & creative cakes & bakes.",
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 16, height: 1.5),
                        ),
                        const SizedBox(height: 25),
                        ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.yellow,
                            padding: const EdgeInsets.symmetric(
                              horizontal: 30,
                              vertical: 15,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                          ),
                          child: const Text(
                            "Find out more",
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        const SizedBox(height: 40),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Expanded(child: const Divider(thickness: 1)),
                            BlueAloneText(text: 'Subscribe'),
                            Expanded(child: const Divider(thickness: 1)),
                          ],
                        ),
                        const SizedBox(height: 10),
                        const Text(
                          "Subscribe to my newsletter for new blog posts, photos & tips. Let's stay connected!",
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 16, height: 1.4),
                        ),
                      ],
                    ),
                  ),
                ),
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: SearchWidget(
                      searchText: 'Send',
                      controller: controller,
                      onSearch: _activateSearchButton,
                    ),
                  ),
                ),
                SliverToBoxAdapter(
                  child: SizedBox(
                    height: AppDimensions.setHeight(context, 0.05),
                  ),
                ),
                SliverToBoxAdapter(
                  child: BlueAloneText(text: 'SIMILAR RECIPES'),
                ),
                SliverToBoxAdapter(
                  child: SizedBox(
                    height: AppDimensions.setHeight(context, 0.02),
                  ),
                ),
                SliverToBoxAdapter(child: DrinksGridWidget(recipes: drinks)),
              ],
            ),
          ),
          Positioned(
            right: 8,
            top: AppDimensions.setHeight(context, 0.4),
            child: Column(
              children:
                  socialButtons
                      .map(
                        (item) => Padding(
                          padding: const EdgeInsets.only(bottom: 10),
                          child: _socialIcon(item['icon'], item['onTap']),
                        ),
                      )
                      .toList(),
            ),
          ),
        ],
      ),
    );
  }
}

class MethodsSection extends StatelessWidget {
  const MethodsSection({super.key, required this.steps});

  final List<String> steps;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Method',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 16),
          ...List.generate(steps.length, (index) {
            return Padding(
              padding: const EdgeInsets.only(bottom: 12.0),
              child: Text(
                '${index + 1}. ${steps[index]}',
                style: TextStyle(fontSize: 16),
              ),
            );
          }),
        ],
      ),
    );
  }
}

class UserReactioonSection extends StatelessWidget {
  const UserReactioonSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
                borderRadius: BorderRadius.circular(30),
              ),
              child: Row(
                children: [
                  Icon(
                    Icons.star,
                    color: Theme.of(context).focusColor,
                    size: 20,
                  ),
                  SizedBox(width: 4),
                  Text(
                    '0',
                    style: TextStyle(
                      color: Theme.of(context).cardColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            Row(
              children: [
                Icon(Icons.remove_red_eye_outlined, color: Colors.grey),
                SizedBox(width: 4),
                Text('10', style: TextStyle(color: Colors.grey)),
                SizedBox(width: 10),
              ],
            ),
          ],
        ),
        const SizedBox(height: 12),

        const SizedBox(height: 12),

        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _iconButton(context, Icons.thumb_up_alt_outlined, '0'),
            _iconButton(context, Icons.chat_bubble_outline, '0'),
            _iconButton(context, Icons.print, ''),
            _iconButton(context, Icons.favorite_border, ''),
          ],
        ),
      ],
    );
  }
}

Widget _socialIcon(String socialMediaIcon, VoidCallback onTap) {
  return GestureDetector(
    onTap: onTap,
    child: CircleAvatar(
      radius: 20,
      child: ClipOval(
        child: Image.asset(
          socialMediaIcon,
          width: 40,
          height: 40,
          fit: BoxFit.fill,
        ),
      ),
    ),
  );
}

Widget _iconButton(BuildContext context, IconData icon, String text) {
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
    decoration: BoxDecoration(
      // ignore: deprecated_member_use
      color: Theme.of(context).disabledColor.withOpacity(0.2),
      borderRadius: BorderRadius.circular(30),
    ),
    child: Row(
      children: [
        Icon(icon, size: 20, color: Theme.of(context).primaryColor),
        if (text.isNotEmpty) ...[
          const SizedBox(width: 4),
          Text(text, style: TextStyle(color: Theme.of(context).primaryColor)),
        ],
      ],
    ),
  );
}

Widget _unitToggle(
  String label, {
  required bool isSelected,
  required VoidCallback onTap,
}) {
  return GestureDetector(
    onTap: onTap,
    child: Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
      decoration: BoxDecoration(
        color: isSelected ? Colors.yellow : Colors.transparent,
        border: Border.all(color: Colors.yellow),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        label,
        style: const TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.bold,
        ),
      ),
    ),
  );
}

Widget _ingredientLine(String amount, String ingredient) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 6),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Text(amount, style: const TextStyle(fontSize: 16)),
        const SizedBox(width: 6),
        const Expanded(child: Divider(thickness: 1, color: Colors.black)),
        const SizedBox(width: 6),
        Expanded(
          flex: 2,
          child: Text(
            ingredient,
            style: const TextStyle(fontSize: 16),
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    ),
  );
}
