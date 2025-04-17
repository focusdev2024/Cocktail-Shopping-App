import 'package:cocktail_cosmo_design/config/routes/route_helper.dart';
import 'package:cocktail_cosmo_design/features/error_page/presentation/error_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

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
    return GetMaterialApp(
      //debugShowCheckedModeBanner: false,
      getPages: RouteHelper.routes,
      onGenerateRoute: (RouteSettings settings) {
        return MaterialPageRoute<void>(
          builder: (context) {
            return const ErrorPage();
          },
        );
      },
    );
  }
}
