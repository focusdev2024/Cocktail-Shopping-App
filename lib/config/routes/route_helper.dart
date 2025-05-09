import 'package:cocktail_cosmo_design/features/home_page/presentation/home_page.dart';
import 'package:cocktail_cosmo_design/features/intriduction_screen.dart/presentation/introduction_screen.dart';
import 'package:get/get.dart';

class RouteHelper {
  static const String initialRoute = '/';
  static const String introductionRoute = '/introduction';

  static String getInitialRoute() => initialRoute;
  static String getIntroductionRoute() => introductionRoute;

  static List<GetPage> routes = [
    GetPage(
      name: initialRoute,
      page: () => const HomePage(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: introductionRoute,
      page: () => const IntroScreen(),
      transition: Transition.fadeIn,
    ),
  ];
}
