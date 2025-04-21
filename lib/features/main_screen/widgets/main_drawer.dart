import 'package:cocktail_cosmo_design/core/widgets/content_small_text.dart';
import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class CustomDrawer extends StatelessWidget {
  final void Function()? onTapHome;
  final void Function()? onTapCocktails;
  final void Function()? onTapIngredients;
  final void Function()? onTapBook;
  final void Function()? onTapWishlist;

  const CustomDrawer({
    super.key,
    this.onTapHome,
    this.onTapCocktails,
    this.onTapIngredients,
    this.onTapBook,
    this.onTapWishlist,
  });

  Widget _buildMenuItem(
    BuildContext context,
    String title, {
    VoidCallback? onTap,
    bool showArrow = false,
  }) {
    return Column(
      children: [
        ListTile(
          title: ContentSmallTextWidget(text: title),
          trailing:
              showArrow ? const Icon(Icons.arrow_forward_ios, size: 16) : null,
          onTap: onTap,
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0),
          child: DottedLine(
            direction: Axis.horizontal,
            lineLength: double.infinity,
            lineThickness: 1.0,
            dashLength: 4.0,
            dashColor: Theme.of(context).canvasColor,
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 20),
            _buildMenuItem(
              context,
              AppLocalizations.of(context)!.cocktails,
              onTap: onTapCocktails,
              showArrow: true,
            ),
            _buildMenuItem(
              context,
              AppLocalizations.of(context)!.ingredients,
              onTap: onTapIngredients,
              showArrow: true,
            ),
            _buildMenuItem(
              context,
              AppLocalizations.of(context)!.book,
              onTap: onTapBook,
            ),
            _buildMenuItem(
              context,
              AppLocalizations.of(context)!.wishlist,
              onTap: onTapWishlist,
            ),
          ],
        ),
      ),
    );
  }
}
