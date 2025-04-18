import 'package:cocktail_cosmo_design/core/constants/app_dimension.dart';
import 'package:cocktail_cosmo_design/core/widgets/content_small_text.dart';
import 'package:cocktail_cosmo_design/features/main_screen/widgets/app_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SearchWidget extends StatelessWidget {
  final TextEditingController controller;
  final VoidCallback onSearch;

  const SearchWidget({
    super.key,
    required this.controller,
    required this.onSearch,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        AppTextFieldWidget(controller: controller),
        SizedBox(width: 10),
        // search button
        Container(
          width: AppDimensions.setWidth(context, 0.2),
          alignment: Alignment.center,
          padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 12.0),
          decoration: BoxDecoration(
            color: Theme.of(context).focusColor,
            borderRadius: BorderRadius.all(Radius.circular(30)),
          ),
          child: GestureDetector(
            onTap: onSearch,
            child: ContentSmallTextWidget(
              text: AppLocalizations.of(context)!.search,
            ),
          ),
        ),
      ],
    );
  }
}
