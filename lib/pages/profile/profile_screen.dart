import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:home_food_delivery/pages/home/home_page.dart';
import 'package:home_food_delivery/pages/profile/address.dart';
import 'package:home_food_delivery/pages/profile/widget/profile_menu.dart';
import 'package:home_food_delivery/pages/screens-login/signin_screen.dart';
import 'package:home_food_delivery/utils/Colors.dart';
import 'package:home_food_delivery/widgets/coming_soon.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

import '../../controllers/local_controller.dart';
import '../../utils/convert.dart';
import '../../utils/dimensions.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
     Get.put(LocaleController());
    return Scaffold(
      appBar: AppBar(
        //leading: IconButton(onPressed: (){}, icon: Icon(LineAwesomeIcons.angle_left),),
        title: Center(
            child: Text(
          "${translateDataBase("الصفحة الشخصية", " Profile ")}",
          style: Theme.of(context).textTheme.headline4,
        )),
      ),
      body: SingleChildScrollView(
        child: GetBuilder<LocaleController>(
          builder: (controller) => Container(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                Stack(children: [
                  SizedBox(
                    width: 120,
                    height: 120,
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(100),
                        child: const Image(
                          image: AssetImage("assets/image/person.jpeg"),
                        )),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: Container(
                      width: 30,
                      height: 30,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        color: AppColors.mainColor,
                      ),
                      child: const Icon(
                        LineAwesomeIcons.alternate_pencil,
                        size: 18.0,
                        color: Colors.black,
                      ),
                    ),
                  )
                ]),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  "${translateDataBase("أحمد أسعد", " Ahmed Asaad ")}",
                  style: Theme.of(context).textTheme.headline4,
                ),
                Text("anaahmedasaad.4@gmail.com",
                    style: Theme.of(context).textTheme.bodyText2),
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                  width: 200,
                  child: ElevatedButton(
                    onPressed: () => Get.to(() => const ComingSoon()),
                    style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.mainColor,
                        side: BorderSide.none,
                        shape: const StadiumBorder()),
                    child: Text(
                        "${translateDataBase("تعديل البيانات", " Edit Profile ")}",
                        style: const TextStyle(color: Colors.white)),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                const Divider(),
                const SizedBox(
                  height: 10,
                ),

                //menu
                ProfileMenuWidget(
                  title: "${translateDataBase("الاعدادات", " Settings ")}",
                  icon: LineAwesomeIcons.cog,
                  onPress: () {
                    Get.to(const ComingSoon());
                  },
                ),
                ProfileMenuWidget(
                  title: "${translateDataBase("العنوان", " My Address ")}",
                  icon: Icons.add_location_alt_outlined,
                  onPress: () {
                    Get.to(const AddressPage());
                  },
                ),
                ProfileMenuWidget(
                  title:
                      "${translateDataBase("إدارة المستخدم", " User Management ")}",
                  icon: LineAwesomeIcons.user_check,
                  onPress: () {
                    Get.to(const ComingSoon());
                  },
                ),
                const Divider(),
                const SizedBox(
                  height: 10,
                ),
                ProfileMenuWidget(
                  title: "${translateDataBase("اللغة", " Languages ")}",
                  icon: LineAwesomeIcons.language,
                  onPress: () {
                    showModalBottomSheet(
                      context: context,
                      builder: (context) => Container(
                        clipBehavior: Clip.antiAlias,
                        decoration: const BoxDecoration(
                            borderRadius: BorderRadius.vertical(
                                top: Radius.circular(30))),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Image.asset(
                              "assets/image/icons8-translation-100.png",
                              height: 150,
                              width: 600,
                            ),
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  foregroundColor: Colors.white,
                                  backgroundColor: AppColors.mainColor,
                                  padding: const EdgeInsets.only(
                                      right: 150, left: 120) // foreground
                                  ),
                              onPressed: () {
                                controller.changeLang("en");
                                Get.forceAppUpdate();
                                Get.appUpdate();
                                Get.to(const HomePage());
                              },
                              child: Text(
                                "${translateDataBase("الانجليزية", "English")}",
                                style: TextStyle(fontSize: Dimensions.font20),
                              ),
                            ),
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  foregroundColor: Colors.white,
                                  backgroundColor: AppColors.mainColor,
                                  padding: const EdgeInsets.only(
                                      right: 155, left: 120) // foreground
                                  ),
                              onPressed: () {
                                controller.changeLang("ar");
                                Get.forceAppUpdate();
                                Get.appUpdate();
                                Get.to(const HomePage());
                              },
                              child: Text(
                                "${translateDataBase("العربية", "Arabic")}",
                                style: TextStyle(fontSize: Dimensions.font20),
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
                ProfileMenuWidget(
                  title: "${translateDataBase("تسجيل الخروج", " Log out ")}",
                  icon: LineAwesomeIcons.alternate_sign_out,
                  textColor: Colors.red,
                  endIcon: false,
                  onPress: () {
                    Get.to(const SignInScreen());
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
