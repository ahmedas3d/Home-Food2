import 'package:get/get.dart';
import '../helper/dependencies.dart';

translateDataBase(ar, en) {
  MyServices myServices = Get.find();
  if (myServices.sharedPreferences.getString("lang") == "ar") {
    return ar;
  } else {
    return en;
  }
}
