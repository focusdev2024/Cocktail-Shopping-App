import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:cocktail_cosmo_design/config/routes/route_helper.dart';
import 'package:cocktail_cosmo_design/config/theme/app_theme.dart';
import 'package:cocktail_cosmo_design/features/error_page/presentation/error_page.dart';
import 'package:cocktail_cosmo_design/features/home_page/presentation/home_page.dart';
import 'package:cocktail_cosmo_design/features/intriduction_screen.dart/presentation/introduction_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final prefs = await SharedPreferences.getInstance();
  final bool isFirstLaunch = prefs.getBool('isFirstLaunch') ?? true;
  runApp(CocktailCosmo(isFirstLaunch: isFirstLaunch));
}

class CocktailCosmo extends StatefulWidget {
  final bool isFirstLaunch;
  const CocktailCosmo({super.key, required this.isFirstLaunch});

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
            home: widget.isFirstLaunch ? const IntroScreen() : const HomePage(),
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
