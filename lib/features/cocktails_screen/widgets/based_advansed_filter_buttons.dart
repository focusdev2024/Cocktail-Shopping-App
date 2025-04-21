import 'package:cocktail_cosmo_design/core/constants/app_dimension.dart';
import 'package:cocktail_cosmo_design/core/widgets/content_small_text.dart';
import 'package:flutter/material.dart';

class FilterButtons extends StatelessWidget {
  const FilterButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        FilterButton(label: "Based filter", onTap: () {}),
        SizedBox(width: 16),
        FilterButton(label: "Advanced filter", onTap: () {}),
      ],
    );
  }
}

class FilterButton extends StatelessWidget {
  final String label;
  final VoidCallback? onTap;

  const FilterButton({super.key, required this.label, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onTap,
      style: ElevatedButton.styleFrom(
        backgroundColor: Theme.of(context).focusColor,
        foregroundColor: Theme.of(context).canvasColor,
        padding: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
        minimumSize: Size(
          AppDimensions.setWidth(context, 0.43),
          0,
        ), // width fixed, height flexible
        alignment: Alignment.center,
      ),
      child: ContentSmallTextWidget(text: label),
    );
  }
}
