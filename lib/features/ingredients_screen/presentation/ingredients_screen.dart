import 'package:cocktail_cosmo_design/core/assets_path/app_icons.dart';
import 'package:cocktail_cosmo_design/core/constants/app_dimension.dart';
import 'package:cocktail_cosmo_design/core/widgets/container_text.dart';
import 'package:cocktail_cosmo_design/core/widgets/search_widget.dart';
import 'package:cocktail_cosmo_design/features/cocktails_screen/widgets/cocltail_appbar_widget.dart';
import 'package:cocktail_cosmo_design/features/ingredients_screen/presentation/ingredients_drawer_screen.dart';
import 'package:cocktail_cosmo_design/features/ingredients_screen/widgets/cocktail_page_resipies_text.dart';
import 'package:cocktail_cosmo_design/features/ingredients_screen/widgets/we_recommend_field.dart';
import 'package:flutter/material.dart';

class IngredientsScreen extends StatefulWidget {
  const IngredientsScreen({super.key});

  @override
  State<IngredientsScreen> createState() => IngredientsScreenState();
}

class IngredientsScreenState extends State<IngredientsScreen> {
  final TextEditingController controller = TextEditingController();
  void _activateSearchButton() {
    Navigator.push(
      context,
      PageRouteBuilder(
        transitionDuration: const Duration(milliseconds: 400),
        pageBuilder:
            (context, animation, secondaryAnimation) => IngredientsDrawer(),
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

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  void _openDrawer() {
    Navigator.push(
      context,
      PageRouteBuilder(
        transitionDuration: const Duration(milliseconds: 400),
        pageBuilder:
            (context, animation, secondaryAnimation) => IngredientsDrawer(),
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

  final List<String> ingredients = [
    "dry vermouth",
    "lemon juice",
    "lemon zest",
    "orange juice",
    "orange zest",
    "sugar syrup",
  ];

  void _weRecommendedClick() {}

  final List<String> alphabetList = List.generate(
    26,
    (index) => String.fromCharCode(65 + index),
  );
  final Map<String, List<String>> categorizedIngredients = {
    'A': [
      'absinthe',
      'advocaat liqueur',
      'angostura bitters',
      'apricot',
      'apricot liqueur',
      'apricot slice for garnish',
      'aromatic red wine',
      'aromatised white wine',
    ],
    'B': [
      'basil sprig for decoration',
      'bénédictine liqueur',
      'blackberry liqueur',
      'blueberries',
      'brandy',
      'brut champagne',
    ],
    'C': [
      'campari',
      'coconut cream',
      'cranberry juice',
      'curaçao',
      'cucumber slices',
    ],
    'D': ['dry vermouth', 'dark rum', 'demerara syrup', 'drambuie'],
    'E': ['elderflower liqueur', 'egg white', 'espresso', 'egg yolk'],
    'F': ['falernum', 'fresh mint', 'fresh lime juice', 'frangelico'],
    'G': ['gin', 'grapefruit juice', 'ginger beer', 'grenadine'],
    'H': [
      'honey syrup',
      'hibiscus syrup',
      'hazelnut liqueur',
      'herbal bitters',
    ],
    'I': ['ice cubes', 'irish cream', 'italian amaro', 'iced tea'],
    'J': [
      'jagermeister',
      'jasmine tea',
      'juniper berries',
      'jack daniel’s whiskey',
    ],
    'K': ['kahlúa', 'kumquat slices', 'kirsch', 'kefir'],
    'L': ['lemon juice', 'lime zest', 'licorice root', 'lychee liqueur'],
    'M': ['mint leaves', 'maraschino liqueur', 'maple syrup', 'mezcal'],
    'N': ['nutmeg', 'navel orange juice', 'nectarines', 'nigella seeds'],
    'O': ['orange bitters', 'orgeat syrup', 'olive brine', 'orange zest'],
    'P': [
      'pineapple juice',
      'peach schnapps',
      'passion fruit puree',
      'pomegranate seeds',
    ],
    'Q': [
      'quince syrup',
      'quassia bark',
      'quik chocolate syrup',
      'quince liqueur',
    ],
    'R': ['raspberry liqueur', 'rose water', 'rum', 'rosemary sprig'],
    'S': ['simple syrup', 'sugar cube', 'soda water', 'strawberry puree'],
    'T': ['tequila', 'tonic water', 'triple sec', 'tamarind paste'],
    'U': [
      'umbrellini liqueur',
      'ugli fruit juice',
      'uva di troia wine',
      'unsweetened cocoa',
    ],
    'V': ['vodka', 'vanilla extract', 'vermouth', 'violet syrup'],
    'W': ['whiskey', 'white rum', 'watermelon juice', 'walnut bitters'],
    'X': [
      'xocolatl mole bitters',
      'xanthan gum',
      'xigua juice (chinese watermelon)',
      'xérès (sherry)',
    ],
    'Y': ['yellow chartreuse', 'yuzu juice', 'yerba mate', 'yogurt'],
    'Z': ['zinfandel wine', 'zest of lemon', 'zabaglione', 'zatar spice'],
  };

  final List<String> alphabet = List.generate(
    26,
    (i) => String.fromCharCode(65 + i),
  );
  String selectedLetter = 'All';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.only(top: 5.0),
              child: CocktailAppBarWidget(
                onOpenDrawer: _openDrawer,
                openDrawerIcon: openDrawerIcon,
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: SizedBox(height: AppDimensions.setHeight(context, 0.01)),
          ),
          SliverToBoxAdapter(child: IngredientsScreenText()),
          SliverToBoxAdapter(
            child: SizedBox(height: AppDimensions.setHeight(context, 0.01)),
          ),
          SliverToBoxAdapter(
            child: RecommendedIngredientsWidget(
              ingredients: ingredients,
              weRecommendedClick: _weRecommendedClick,
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: SearchWidget(
                controller: controller,
                onSearch: _activateSearchButton,
                ingredientsScreen: true,
              ),
            ),
          ),
          //chose letters field
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Wrap(
                alignment: WrapAlignment.center,
                spacing: 8,
                runSpacing: 8,
                children: [
                  GestureDetector(
                    onTap: () => setState(() => selectedLetter = 'All'),
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 8,
                      ),
                      decoration: BoxDecoration(
                        color:
                            selectedLetter == 'All'
                                ? Theme.of(context).focusColor
                                : Colors.transparent,
                        borderRadius: BorderRadius.circular(20),
                      ),

                      child: ContainerTextWidget(
                        item: 'All',
                        color:
                            selectedLetter == 'All'
                                ? Theme.of(context).canvasColor
                                : Theme.of(context).primaryColor,
                      ),
                    ),
                  ),
                  ...alphabetList.map(
                    (letter) => GestureDetector(
                      onTap: () => setState(() => selectedLetter = letter),
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 8,
                        ),
                        decoration: BoxDecoration(
                          color:
                              selectedLetter == letter
                                  ? Theme.of(context).focusColor
                                  : Colors.transparent,

                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: ContainerTextWidget(
                          item: letter,
                          color:
                              selectedLetter == letter
                                  ? Theme.of(context).canvasColor
                                  : Theme.of(context).primaryColor,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(child: SizedBox(height: 16)),
          //show results field
          if (selectedLetter == 'All') ...[
            for (final entry in categorizedIngredients.entries)
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 8,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        entry.key,
                        style: TextStyle(
                          color: Theme.of(context).primaryColor,
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Wrap(
                        spacing: 8,
                        runSpacing: 8,
                        children:
                            entry.value.map((item) {
                              return Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 12,
                                  vertical: 8,
                                ),
                                decoration: BoxDecoration(
                                  color: Theme.of(context).cardColor,
                                  border: Border.all(
                                    color: Theme.of(context).focusColor,
                                  ),
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Text(
                                  item,
                                  style: const TextStyle(fontSize: 16),
                                ),
                              );
                            }).toList(),
                      ),
                    ],
                  ),
                ),
              ),
          ] else if (categorizedIngredients[selectedLetter] != null) ...[
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Wrap(
                  spacing: 8,
                  runSpacing: 8,
                  children:
                      categorizedIngredients[selectedLetter]!.map((item) {
                        return Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 12,
                            vertical: 8,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(color: Colors.yellow.shade700),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Text(
                            item,
                            style: const TextStyle(fontSize: 16),
                          ),
                        );
                      }).toList(),
                ),
              ),
            ),
          ] else ...[
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Text('No ingredients for "$selectedLetter"'),
              ),
            ),
          ],
        ],
      ),
    );
  }
}
