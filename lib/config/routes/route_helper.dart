import 'package:cocktail_cosmo_design/features/home_page/presentation/home_page.dart';
import 'package:get/get.dart';

class RouteHelper {
  //Route names
  static const String initialRoute = '/';
  static const String splashScreen = '/splashScreen';
  static const String introductionScreen = '/introductionScreen';
  static const String searchScreen = '/searchScreen';
  static const String categoryViewScreen = '/categoryViewScreen';
  static const String productViewScreen = '/productViewScreen';
  static const String locationViewScreen = '/locationViewScreen';
  static const String securityPrivacyScreen = '/securityPrivacyScreen';
  static const String aboutUsScreen = '/aboutUsScreen';

  //Route path getters
  static String getInitialRoute() => initialRoute;
  static String getIntroductionScreen() => introductionScreen;
  static String getSplashScreen() => splashScreen;

  //Routes list
  static List<GetPage> routes = [
    GetPage(
      name: initialRoute,
      page: () => HomePage(),
      transition: Transition.fadeIn,
    ),
  ];
}
