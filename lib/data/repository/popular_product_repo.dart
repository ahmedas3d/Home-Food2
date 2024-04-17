import 'package:get/get.dart';
import 'package:home_food_delivery/data/api/api_client.dart';
import 'package:home_food_delivery/utils/app_constants.dart';

class PopularProductRepo extends GetxService {
  final ApiClient apiClient;

  PopularProductRepo({required this.apiClient});

  Future<Response> getPopularProductList() async {
    return await apiClient.getData(AppConstants.POPPULAR_PRODUCT_URI);
  }
}
