import 'package:cocktail_cosmo_design/core/widgets/container_text.dart';
import 'package:flutter/material.dart';

class IngredientSelectionWidget extends StatefulWidget {
  final List<String> ingredients;
  final Set selectedIngredients;
  final void Function(String ingredient) toggleSelection;
  final VoidCallback goToNextPage;
  const IngredientSelectionWidget({
    super.key,
    required this.ingredients,
    required this.selectedIngredients,
    required this.toggleSelection,
    required this.goToNextPage,
  });

  @override
  State<IngredientSelectionWidget> createState() =>
      _IngredientSelectionWidgetState();
}

class _IngredientSelectionWidgetState extends State<IngredientSelectionWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
      child: Column(
        children: [
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children:
                widget.ingredients.map((item) {
                  final isSelected = widget.selectedIngredients.contains(item);
                  return GestureDetector(
                    onTap: () => widget.toggleSelection(item),
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 10,
                      ),
                      decoration: BoxDecoration(
                        color:
                            isSelected
                                ? Theme.of(context).focusColor
                                : Theme.of(
                                  context,
                                  // ignore: deprecated_member_use
                                ).disabledColor.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: ContainerTextWidget(
                        item: item,
                        color: Theme.of(context).canvasColor,
                      ),
                    ),
                  );
                }).toList(),
          ),
          SizedBox(height: 30),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Theme.of(context).focusColor,
              padding: const EdgeInsets.symmetric(horizontal: 34, vertical: 15),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
            ),
            onPressed: widget.goToNextPage,
            child: ContainerTextWidget(
              item: 'View All Ingredients',
              color: Theme.of(context).canvasColor,
            ),
          ),
        ],
      ),
    );
  }
}
