import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:home_food_delivery/controllers/popular_product_controller.dart';
import 'package:home_food_delivery/controllers/recommended_product_controller.dart';
import 'package:home_food_delivery/pages/splash/splash_page.dart';
import 'package:home_food_delivery/routes/route_helper.dart';
import 'package:home_food_delivery/utils/app_constants.dart';
import 'controllers/local_controller.dart';
import 'data/api/api_client.dart';
import 'data/repository/popular_product_repo.dart';
import 'data/repository/recommended_product_repo.dart';
import 'helper/dependencies.dart';
import 'helper/model.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initialServices();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    LocaleController controller = Get.put(LocaleController());
    return GetMaterialApp(
      translations: MyTranslation(),
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        home: const SplashScreen(),
        locale: controller.language,
        theme: controller.appTheme,
        initialBinding: MyBinding(),

        //initialRoute: RouteHelper.getInitial(),
        getPages: RouteHelper.routes);
  }
}




class MyBinding extends Bindings {
@override
void dependencies() {
  Get.lazyPut(() => ApiClient(appBaseUrl: AppConstants.BASE_URL));
//Repos
  Get.lazyPut(() => PopularProductRepo(apiClient: Get.find()));
  Get.lazyPut(() => RecommendedProductRepo(apiClient: Get.find()));
  // Get.lazyPut(() => CartRepo(sharedPreferences: Get.find()));
//Controllers
  Get.lazyPut(() => PopularProductController(popularProductRepo: Get.find()));
  Get.lazyPut(
          () => RecommendedProductController(recommendedProductRepo: Get.find()));
  // Get.lazyPut(() => CartController(cartRepo: Get.find()));
}
}
