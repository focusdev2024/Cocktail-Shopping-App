import 'package:cocktail_cosmo_design/core/constants/app_dimension.dart';
import 'package:cocktail_cosmo_design/core/widgets/content_small_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SearchWidget extends StatelessWidget {
  final TextEditingController controller;
  final VoidCallback onSearch;
  final bool? ingredientsScreen;
  final String? searchText;

  const SearchWidget({
    super.key,
    required this.controller,
    required this.onSearch,
    this.ingredientsScreen,
    this.searchText,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        AppTextFieldWidget(
          controller: controller,
          ingredientsScreen: ingredientsScreen,
        ),
        SizedBox(width: 20),
        // search button
        ingredientsScreen == true
            ? Container(
              width: 50,
              height: 50,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
                shape: BoxShape.circle,
              ),
              child: IconButton(
                onPressed: onSearch,
                icon: Icon(
                  Icons.filter_list_rounded,
                  color: Theme.of(context).cardColor,
                  size: 30,
                ),
              ),
            )
            : SizedBox(
              height: 45,
              child: ElevatedButton(
                onPressed: onSearch,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Theme.of(context).focusColor,
                  padding: EdgeInsets.symmetric(horizontal: 18.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(30)),
                  ),
                  minimumSize: Size(
                    AppDimensions.setWidth(context, 0.2),
                    0,
                  ), // preserve width

                  alignment: Alignment.center,
                ),
                child: ContentSmallTextWidget(
                  text: searchText ?? AppLocalizations.of(context)!.search,
                ),
              ),
            ),
      ],
    );
  }
}

class AppTextFieldWidget extends StatelessWidget {
  const AppTextFieldWidget({
    super.key,
    required TextEditingController controller,
    this.ingredientsScreen,
  }) : _controller = controller;

  final TextEditingController _controller;
  final bool? ingredientsScreen;

  @override
  Widget build(BuildContext context) {
    return Container(
      width:
          ingredientsScreen == true
              ? AppDimensions.setWidth(context, 0.7)
              : AppDimensions.setWidth(context, 0.6),
      padding: EdgeInsets.symmetric(horizontal: 20.0),
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.all(Radius.circular(30)),
        border: Border.all(color: Theme.of(context).primaryColor, width: 1.0),
      ),
      child: TextField(
        controller: _controller,
        decoration: InputDecoration(
          hintText: '${AppLocalizations.of(context)!.findRecipe} ...',
          border: InputBorder.none,
        ),
        inputFormatters: [
          FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Zа-яА-ЯёЁ\s]')),
          LengthLimitingTextInputFormatter(50),
        ],
        style: const TextStyle(fontSize: 16),
      ),
    );
  }
}
