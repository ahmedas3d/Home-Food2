import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyServices extends GetxService {
  late SharedPreferences sharedPreferences;

  Future<MyServices> init() async {
    sharedPreferences = await SharedPreferences.getInstance();
    return this;
  }
}

initialServices() async {
  await Get.putAsync(() => MyServices().init());
}

//
// Future<void> init() async {
//   final sharedPreferences = await SharedPreferences.getInstance();
//
//   Get.lazyPut(() => sharedPreferences);
//   //Api Client
//   Get.lazyPut(() => ApiClient(appBaseUrl: AppConstants.BASE_URL));
//   //Repos
//   Get.lazyPut(() => PopularProductRepo(apiClient: Get.find()));
//   Get.lazyPut(() => RecommendedProductRepo(apiClient: Get.find()));
//   Get.lazyPut(() => CartRepo(sharedPreferences: Get.find()));
//   Get.lazyPut(() => MyServices());
//
//   //Controllers
//   Get.lazyPut(() => PopularProductController(popularProductRepo: Get.find()));
//   Get.lazyPut(
//           () => RecommendedProductController(recommendedProductRepo: Get.find()));
//   Get.lazyPut(() => CartController(cartRepo: Get.find()));
// }
