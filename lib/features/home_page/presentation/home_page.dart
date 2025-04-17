import 'package:cocktail_cosmo_design/core/assets_path/app_icons.dart';
import 'package:cocktail_cosmo_design/core/constants/app_color.dart';
import 'package:cocktail_cosmo_design/features/book_screen/presentation/book_screen.dart';
import 'package:cocktail_cosmo_design/features/cocktails_screen/presentation/cocktails_screen.dart';
import 'package:cocktail_cosmo_design/features/ingredients_screen/presentation/ingredients_screen.dart';
import 'package:cocktail_cosmo_design/features/main_screen/presentation/home_screen.dart';
import 'package:cocktail_cosmo_design/features/wishlist_screen/presentation/wishlist_screen.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  // List of pages for each bottom navigation item
  final List<Widget> _pages = [
    MainScreen(),
    CocktailsScreen(),
    IngredientsScreen(),
    BookScreen(),
    WishlistScreen(),
  ];

  // Handle the index change
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Home Page with Bottom Navigation')),
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: AppColor.backgroudColorApp,
        selectedItemColor: AppColor.mainBlue,
        unselectedItemColor: AppColor.grey,
        type: BottomNavigationBarType.fixed,
        elevation: 0.0,
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Image.asset(
              AppIcons.mainIcon,
              color: _selectedIndex == 0 ? AppColor.mainBlue : AppColor.grey,
            ),
            label: 'Main',
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              AppIcons.cocktailIcon,
              color: _selectedIndex == 1 ? AppColor.mainBlue : AppColor.grey,
            ),
            label: 'Cocktails',
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              AppIcons.ingredietIcon,
              color: _selectedIndex == 2 ? AppColor.mainBlue : AppColor.grey,
            ),
            label: 'Ingredients',
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              AppIcons.bookIcon,
              color: _selectedIndex == 3 ? AppColor.mainBlue : AppColor.grey,
            ),
            label: 'Book',
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              AppIcons.wishIcon,
              color: _selectedIndex == 4 ? AppColor.mainBlue : AppColor.grey,
            ),
            label: 'Wish-list',
          ),
        ],
      ),
    );
  }
}
