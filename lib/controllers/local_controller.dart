import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../helper/apptheme.dart';
import '../helper/dependencies.dart';

class LocaleController extends GetxController{
  Locale? language;
  MyServices myServices = Get.find();
  ThemeData appTheme = themeEnglish;

  @override
  void onInit() {
    String? sharedPreLang = myServices.sharedPreferences.getString("lang");
    if (sharedPreLang == "ar") {
      language = const Locale("ar");
      appTheme = themeArabic;
    } else if (sharedPreLang == "en") {
      language = const Locale("en");
      appTheme = themeEnglish;
    } else {
      language = Locale(Get.deviceLocale!.languageCode);
      appTheme = themeEnglish;
    }
    super.onInit();
  }

  void changeLang(String langCode) async {
    Locale locale = Locale(langCode);
    myServices.sharedPreferences.setString("lang", langCode);
    ThemeData appTheme = langCode == "ar" ? themeArabic : themeEnglish;
    Get.changeTheme(appTheme);
    await Get.updateLocale(locale);
  }
}
