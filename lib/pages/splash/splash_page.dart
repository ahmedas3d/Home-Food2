import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:home_food_delivery/routes/route_helper.dart';
import 'package:home_food_delivery/utils/Colors.dart';
import 'package:home_food_delivery/widgets/big_text.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  late Animation<double> animation;
  late AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 2))
          ..forward();
    animation = CurvedAnimation(parent: controller, curve: Curves.linear);
    Timer(const Duration(seconds: 3),
        () => Get.offNamed(RouteHelper.getIntroOnboarding()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ScaleTransition(
              scale: animation,
              child: Center(
                  child: Image.asset(
                "assets/image/Chef-pana.png",
                width: 250,
              ))),
          Center(
            child: BigText(
              text: "𝓣𝓱𝓮 𝓑𝓮𝓼𝓽 𝓕𝓸𝓸𝓭",
              size: 50,
              color: AppColors.mainColor,
            ),
          )
        ],
      ),
    );
  }
}
