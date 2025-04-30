import 'package:cocktail_cosmo_design/core/assets_path/app_icons.dart';
import 'package:cocktail_cosmo_design/features/book_screen/widgets/main_field.dart';
import 'package:cocktail_cosmo_design/features/cocktails_screen/presentation/cocktail_drawer_screen.dart';
import 'package:flutter/material.dart';

class BookScreen extends StatefulWidget {
  final Function(int) goToHomePage;
  const BookScreen({super.key, required this.goToHomePage});

  @override
  State<BookScreen> createState() => _BookScreenState();
}

class _BookScreenState extends State<BookScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  bool _isDrawerOpen = false;

  void _openDrawer() {
    setState(() {
      _isDrawerOpen = !_isDrawerOpen;
    });
  }

  void _goToHomePage() {
    widget.goToHomePage(0);
  }

  void _activateSearchButton() {
    Navigator.push(
      context,
      PageRouteBuilder(
        pageBuilder:
            (context, animation, secondaryAnimation) => CocktailDrawerScreen(),
      ),
    );
  }

  final String openDrawerIcon = AppIcons.menuIcon;

  final String closeDrawerIcon = AppIcons.closeIcon;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      body: CustomScrollView(
        slivers: <Widget>[
          SliverToBoxAdapter(
            child: BoookScreenContent(
              isDrawerOpen: _isDrawerOpen,
              openDrawerIcon: openDrawerIcon,
              closeDrawerIcon: closeDrawerIcon,
              onOpenDrawer: _openDrawer,
              goToHomePage: _goToHomePage,
              onSearchTap: _activateSearchButton,
            ),
          ),
        ],
      ),
    );
  }
}
