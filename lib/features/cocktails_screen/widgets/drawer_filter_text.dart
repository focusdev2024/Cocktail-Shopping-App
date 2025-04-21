import 'package:cocktail_cosmo_design/core/assets_path/app_icons.dart';
import 'package:cocktail_cosmo_design/core/widgets/main_medium_text.dart';
import 'package:flutter/material.dart';

class DrawerFilterText extends StatelessWidget {
  DrawerFilterText({super.key});

  final String closeDrawerIcon = AppIcons.closeIcon;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Row(
        children: [
          Expanded(
            flex: 4,
            child: MainMediumTextWidget(
              text: 'FILTER',
              colorDark: true,
              fontSize: 32,
              textAlign: TextAlign.center,
            ),
          ),
          Expanded(
            flex: 1,
            child: GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Image.asset(
                closeDrawerIcon,
                color: Theme.of(context).canvasColor,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
