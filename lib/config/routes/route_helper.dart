import 'package:cocktail_cosmo_design/features/home_page/presentation/home_page.dart';
import 'package:get/get.dart';

class RouteHelper {
  //Route names
  static const String initialRoute = '/';

  //Route path getters
  static String getInitialRoute() => initialRoute;

  //Routes list
  static List<GetPage> routes = [
    GetPage(
      name: initialRoute,
      page: () => HomePage(),
      transition: Transition.fadeIn,
    ),
  ];
}
