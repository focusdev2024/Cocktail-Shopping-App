import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:cocktail_cosmo_design/config/routes/route_helper.dart';
import 'package:cocktail_cosmo_design/config/theme/app_theme.dart';
import 'package:cocktail_cosmo_design/features/error_page/presentation/error_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

Future<void> main() async {
  runApp(CocktailCosmo());
}

class CocktailCosmo extends StatefulWidget {
  const CocktailCosmo({super.key});

  @override
  State<CocktailCosmo> createState() => _CocktailCosmoState();
}

class _CocktailCosmoState extends State<CocktailCosmo> {
  @override
  Widget build(BuildContext context) {
    return AdaptiveTheme(
      light: AppThemes.lightTheme,
      //dark: AppThemes.darkTheme,
      initial: AdaptiveThemeMode.light,
      builder:
          (theme, lightTheme) => GetMaterialApp(
            debugShowCheckedModeBanner: false,
            localizationsDelegates: AppLocalizations.localizationsDelegates,
            supportedLocales: AppLocalizations.supportedLocales,
            theme: theme,
            darkTheme: lightTheme,
            getPages: RouteHelper.routes,
            onGenerateRoute: (RouteSettings settings) {
              return MaterialPageRoute<void>(
                builder: (context) {
                  return const ErrorPage();
                },
              );
            },
          ),
    );
  }
}
