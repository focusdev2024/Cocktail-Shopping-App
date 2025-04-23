import 'package:cocktail_cosmo_design/core/assets_path/app_icons.dart';
import 'package:cocktail_cosmo_design/features/book_screen/widgets/main_field.dart';
import 'package:flutter/material.dart';

class BookScreen extends StatefulWidget {
  const BookScreen({super.key});

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
            ),
          ),
        ],
      ),
    );
  }
}
