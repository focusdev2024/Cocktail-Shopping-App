import 'package:cocktail_cosmo_design/features/home_page/presentation/home_page.dart';
import 'package:cocktail_cosmo_design/features/intriduction_screen.dart/presentation/introduction_screen.dart';
import 'package:get/get.dart';

class RouteHelper {
  //Route names
  static const String initialRoute = '/';
  static const String introductionRoute = '/introduction';

  //Route path getters
  static String getInitialRoute() => initialRoute;
  static String getIntroductionRoute() => introductionRoute;

  //Routes list
  static List<GetPage> routes = [
    GetPage(
      name: initialRoute,
      page: () => HomePage(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: introductionRoute,
      page: () => IntroScreen(),
      transition: Transition.fadeIn,
    ),
  ];
}
