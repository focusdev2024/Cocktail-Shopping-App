import 'package:cocktail_cosmo_design/core/assets_path/app_icons.dart';
import 'package:cocktail_cosmo_design/features/book_screen/presentation/book_screen.dart';
import 'package:cocktail_cosmo_design/features/cocktails_screen/presentation/cocktails_screen.dart';
import 'package:cocktail_cosmo_design/features/ingredients_screen/presentation/ingredients_screen.dart';
import 'package:cocktail_cosmo_design/features/main_screen/presentation/main_screen.dart';
import 'package:cocktail_cosmo_design/features/wishlist_screen/presentation/wishlist_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    MainScreen(),
    CocktailsScreen(),
    IngredientsScreen(),
    BookScreen(),
    WishlistScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  Widget buildNavIcon(String iconPath, int index) {
    final theme = Theme.of(context).bottomNavigationBarTheme;
    final color =
        _selectedIndex == index
            ? theme.selectedItemColor
            : theme.unselectedItemColor;

    return Image.asset(iconPath, color: color);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        elevation: 0,
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        type: BottomNavigationBarType.fixed,
        selectedItemColor:
            Theme.of(context).bottomNavigationBarTheme.selectedItemColor,
        unselectedItemColor:
            Theme.of(context).bottomNavigationBarTheme.unselectedItemColor,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: buildNavIcon(AppIcons.mainIcon, 0),
            label: AppLocalizations.of(context)!.main,
          ),
          BottomNavigationBarItem(
            icon: buildNavIcon(AppIcons.cocktailIcon, 1),
            label: AppLocalizations.of(context)!.cocktails,
          ),
          BottomNavigationBarItem(
            icon: buildNavIcon(AppIcons.ingredietIcon, 2),
            label: AppLocalizations.of(context)!.ingredients,
          ),
          BottomNavigationBarItem(
            icon: buildNavIcon(AppIcons.bookIcon, 3),
            label: AppLocalizations.of(context)!.book,
          ),
          BottomNavigationBarItem(
            icon: buildNavIcon(AppIcons.wishIcon, 4),
            label: AppLocalizations.of(context)!.wishlist,
          ),
        ],
      ),
    );
  }
}
