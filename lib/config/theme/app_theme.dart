import 'package:cocktail_cosmo_design/core/constants/app_color.dart';
import 'package:flutter/material.dart';

class AppThemes {
  static final ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    scaffoldBackgroundColor: AppColor.backgroudColorApp,
    primaryColor: AppColor.mainBlue,
    appBarTheme: const AppBarTheme(),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: AppColor.backgroudColorApp,
      selectedItemColor: AppColor.mainBlue,
      unselectedItemColor: AppColor.black,
      type: BottomNavigationBarType.fixed,
    ),

    //main page gradient color
    canvasColor: AppColor.black,
    cardColor: AppColor.backgroudColorApp,
    disabledColor: AppColor.grey,
    focusColor: AppColor.mainYellow,
    drawerTheme: DrawerThemeData(backgroundColor: AppColor.backgroudColorApp),
  );
}
