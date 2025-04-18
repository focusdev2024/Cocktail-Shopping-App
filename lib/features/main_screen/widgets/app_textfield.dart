import 'package:cocktail_cosmo_design/core/constants/app_dimension.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

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
