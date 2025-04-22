import 'package:flutter/material.dart';

class IngredientFilterWidget extends StatefulWidget {
  const IngredientFilterWidget({super.key});

  @override
  IngredientFilterWidgetState createState() => IngredientFilterWidgetState();
}

class IngredientFilterWidgetState extends State<IngredientFilterWidget> {
  final List<String> alphabet = List.generate(
    26,
    (index) => String.fromCharCode(65 + index),
  );
  final Map<String, List<String>> ingredientsByLetter = {
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
    'B': ['basil sprig for decoration'],
    // Add more letters and their items as needed
  };

  String selectedLetter = 'All';

  List<String> get filteredIngredients {
    if (selectedLetter == 'All') {
      return ingredientsByLetter.values.expand((list) => list).toList();
    } else {
      return ingredientsByLetter[selectedLetter] ?? [];
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Wrap(
          alignment: WrapAlignment.center,
          spacing: 8,
          runSpacing: 8,
          children: [
            ChoiceChip(
              label: Text('All'),
              selected: selectedLetter == 'All',
              onSelected: (_) => setState(() => selectedLetter = 'All'),
            ),
            ...alphabet.map(
              (letter) => ChoiceChip(
                label: Text(letter),
                selected: selectedLetter == letter,
                onSelected: (_) => setState(() => selectedLetter = letter),
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),
        Expanded(
          child: ListView(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            children:
                filteredIngredients
                    .map(
                      (item) => Container(
                        margin: const EdgeInsets.symmetric(vertical: 4),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 8,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(color: Colors.yellow.shade700),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Text(item, style: const TextStyle(fontSize: 16)),
                      ),
                    )
                    .toList(),
          ),
        ),
      ],
    );
  }
}
