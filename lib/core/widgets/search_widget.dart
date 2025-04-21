import 'package:cocktail_cosmo_design/core/constants/app_dimension.dart';
import 'package:cocktail_cosmo_design/core/widgets/content_small_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

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
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        AppTextFieldWidget(controller: controller),
        SizedBox(width: 10),
        // search button
        ElevatedButton(
          onPressed: onSearch,
          style: ElevatedButton.styleFrom(
            backgroundColor: Theme.of(context).focusColor,
            padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 12.0),
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
            text: AppLocalizations.of(context)!.search,
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
  }) : _controller = controller;

  final TextEditingController _controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: AppDimensions.setWidth(context, 0.6),
      padding: EdgeInsets.symmetric(horizontal: 18.0),
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
