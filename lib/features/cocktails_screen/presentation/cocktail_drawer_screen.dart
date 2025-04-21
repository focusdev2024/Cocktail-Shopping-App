import 'package:cocktail_cosmo_design/core/constants/app_dimension.dart';
import 'package:cocktail_cosmo_design/core/widgets/main_small_text.dart';
import 'package:cocktail_cosmo_design/core/widgets/search_widget.dart';
import 'package:cocktail_cosmo_design/features/cocktails_screen/widgets/drawer_filter_text.dart';
import 'package:flutter/material.dart';

class CocktailDrawerScreen extends StatefulWidget {
  const CocktailDrawerScreen({super.key});

  @override
  CocktailDrawerScreenState createState() => CocktailDrawerScreenState();
}

class CocktailDrawerScreenState extends State<CocktailDrawerScreen> {
  final TextEditingController controller = TextEditingController();
  void _activateSearchButton() {}

  final Map<String, List<String>> filterCategories = {
    "Unexpected": ["KusChoice", "Quirky"],
    "Spices and Herbs": [
      "basil sprig",
      "ground nutmeg",
      "mint",
      "rosemary sprig",
      "spices & herbs",
      "star anise",
      "vanilla extract",
    ],
    "Citrus & citrus derivatives": [
      "lemon",
      "lemon slice",
      "lemon zest",
      "lime slice",
      "lime zest",
      "orange",
      "orange slice",
      "orange zest",
    ],
    "Fruits": [
      "pineapple",
      "strawberry",
      "blueberry",
      "blackberry",
      "raspberry",
      "banana slice",
      "apple slice",
      "cherry",
    ],
    "Syrups & Sweeteners": [
      "simple syrup",
      "honey",
      "maple syrup",
      "agave syrup",
      "grenadine",
      "caramel syrup",
      "chocolate syrup",
    ],
    "Dairy & Creams": [
      "milk",
      "heavy cream",
      "whipped cream",
      "condensed milk",
      "coconut cream",
    ],
    "Bitters & Enhancers": [
      "angostura bitters",
      "orange bitters",
      "chocolate bitters",
      "aromatic bitters",
    ],
    "Garnishes": [
      "sugar rim",
      "salt rim",
      "cinnamon stick",
      "umbrella",
      "mint sprig",
      "citrus twist",
    ],
    "Ice Types": ["crushed ice", "ice cubes", "shaved ice", "clear ice"],
  };

  late Map<String, Set<String>> selectedFilters;

  @override
  void initState() {
    super.initState();
    resetFilters();
  }

  void resetFilters() {
    selectedFilters = {for (var key in filterCategories.keys) key: <String>{}};
  }

  void toggleFilter(String category, String value) {
    setState(() {
      if (selectedFilters[category]!.contains(value)) {
        selectedFilters[category]!.remove(value);
      } else {
        selectedFilters[category]!.add(value);
      }
    });
  }

  bool isSelected(String category, String value) {
    return selectedFilters[category]!.contains(value);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          CustomScrollView(
            slivers: <Widget>[
              SliverToBoxAdapter(child: SizedBox(height: 10)),
              SliverToBoxAdapter(child: DrawerFilterText()),
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: SearchWidget(
                    controller: controller,
                    onSearch: _activateSearchButton,
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: SingleChildScrollView(
                  physics: NeverScrollableScrollPhysics(),
                  padding: const EdgeInsets.all(12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children:
                        filterCategories.entries.map((entry) {
                          final category = entry.key;
                          final values = entry.value;
                          return Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 10.0,
                            ),
                            child: Container(
                              width: double.infinity,
                              margin: const EdgeInsets.only(bottom: 10),
                              decoration: BoxDecoration(
                                color: Theme.of(context).cardColor,
                                borderRadius: const BorderRadius.all(
                                  Radius.circular(20),
                                ),
                                border: Border.all(
                                  color: Theme.of(context).primaryColor,
                                  width: 0.8,
                                ),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(12.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    MainSmallTextWidget(
                                      text: category,
                                      colorDark: false,
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    const SizedBox(height: 10),
                                    Wrap(
                                      spacing: 8,
                                      runSpacing: 8,
                                      children:
                                          values.map((value) {
                                            final selected = isSelected(
                                              category,
                                              value,
                                            );
                                            return GestureDetector(
                                              onTap:
                                                  () => toggleFilter(
                                                    category,
                                                    value,
                                                  ),
                                              child: Container(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                      horizontal: 10,
                                                      vertical: 5,
                                                    ),
                                                decoration: BoxDecoration(
                                                  color:
                                                      selected
                                                          ? Theme.of(
                                                            context,
                                                          ).focusColor
                                                          : Theme.of(
                                                            context,
                                                          ).disabledColor
                                                          // ignore: deprecated_member_use
                                                          .withOpacity(0.3),
                                                  borderRadius:
                                                      const BorderRadius.all(
                                                        Radius.circular(20),
                                                      ),
                                                ),
                                                child: MainSmallTextWidget(
                                                  text: value,
                                                  colorDark: false,
                                                ),
                                              ),
                                            );
                                          }).toList(),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        }).toList(),
                  ),
                ),
              ),
            ],
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: SizedBox(
              width: double.infinity,
              height: 150,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: OutlinedButton(
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 15.0),
                        backgroundColor: Theme.of(context).cardColor,
                        shape: RoundedRectangleBorder(
                          side: BorderSide(
                            color: Theme.of(context).primaryColor,
                            width: 1.5,
                          ),
                          borderRadius: const BorderRadius.all(
                            Radius.circular(30),
                          ),
                        ),
                        minimumSize: Size(
                          AppDimensions.setWidth(context, 0.9),
                          0,
                        ), // preserve width
                        alignment: Alignment.center,
                      ),

                      onPressed: () {
                        setState(() {
                          resetFilters();
                        });
                      },
                      child: MainSmallTextWidget(
                        text: 'Reset',
                        colorDark: false,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 15.0),
                        backgroundColor: Theme.of(context).primaryColor,

                        shape: RoundedRectangleBorder(
                          borderRadius: const BorderRadius.all(
                            Radius.circular(30),
                          ),
                        ),
                        minimumSize: Size(
                          AppDimensions.setWidth(context, 0.9),
                          0,
                        ), // preserve width
                        alignment: Alignment.center,
                      ),
                      onPressed: () {
                        // // Handle filter submission
                        // print("Selected filters: $selectedFilters");
                      },
                      child: MainSmallTextWidget(
                        text: 'Show results',
                        colorDark: true,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
