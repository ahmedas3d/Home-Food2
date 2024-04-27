import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:home_food_delivery/pages/cart/cart_page.dart';
import 'package:home_food_delivery/pages/food/popular_food_detail.dart';
import 'package:home_food_delivery/pages/food/recommended_food_detail.dart';
import 'package:home_food_delivery/pages/home/home_page.dart';
import 'package:home_food_delivery/pages/intro_onboarding/intro_onboarding.dart';
import 'package:home_food_delivery/pages/screens-login/welcome_screen.dart';
import 'package:home_food_delivery/pages/splash/splash_page.dart';

class RouteHelper {
  static const String introOnboarding = "/intro-onboarding";
  static const String welcomeScreen = "/welcome-screen";
  static const String splashPage = "/splash-page";
  static const String initial = "/main-food-page";
  static const String popularFood = "/popular-food";
  static const String recommendedFood = "/recommended-food";
  static const String cartPage = "/cart-page";

  static String getIntroOnboarding() => '$introOnboarding';

  static String getWelcomeScreen() => '$welcomeScreen';

  static String getSplashPage() => '$splashPage';

  static String getInitial() => '$initial';

  static String getPopularFood(int pageId, String page) =>
      '$popularFood?pageId=$pageId&page=$page';

  static String getRecommendedFood(int pageId, String page) =>
      '$recommendedFood?pageId=$pageId&page=$page';

  static String getCartPage() => '$cartPage';

  static List<GetPage> routes = [
    GetPage(name: introOnboarding, page: () => const FoodIntroOnBoarding()),
    GetPage(name: welcomeScreen, page: () => const WelcomeScreen()),
    GetPage(name: splashPage, page: () => const SplashScreen()),
    GetPage(name: initial, page: (() => const HomePage())),
    GetPage(
      name: popularFood,
      page: () {
        var pageId = Get.parameters['pageId'];
        var page = Get.parameters["page"];
        return PopularFoodDetail(pageId: int.parse(pageId!), page: page!);
      },
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: recommendedFood,
      page: () {
        var pageId = Get.parameters['pageId'];
        var page = Get.parameters["page"];
        return RecommenededFoodDetail(pageId: int.parse(pageId!), page: page!);
      },
      transition: Transition.fadeIn,
    ),
    GetPage(
        name: cartPage,
        page: () {
          return const CartPage();
        },
        transition: Transition.fadeIn)
  ];
}
