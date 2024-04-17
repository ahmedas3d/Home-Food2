import 'package:flutter/material.dart';
import 'package:home_food_delivery/main.dart';
import 'package:home_food_delivery/pages/screens-login/welcome_screen.dart';
import 'package:intro_screen_onboarding_flutter/introduction.dart';
import 'package:intro_screen_onboarding_flutter/introscreenonboarding.dart';

import '../../utils/convert.dart';


class FoodIntroOnBoarding extends StatelessWidget {
  const FoodIntroOnBoarding({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: '',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: TestScreen(),
    );
  }
}

class TestScreen extends StatelessWidget {
  final List<Introduction> list = [
    Introduction(
      title: "${translateDataBase("عملية تحضير الطعام", " Food processing ")}",
      subTitle: "${translateDataBase("تصفح القائمة واطلب مباشرة من التطبيق", " Browse the menu and order directly from the application ")}",
      imageUrl: 'assets/image/Chef-cuate.png',
    ),
    Introduction(
      title:  "${translateDataBase("توصيل سريع", " Delivery ")}",
      subTitle: "${translateDataBase("سيتم جمع طلبك على الفور", " Your order will be immediately collected and ")}",
      imageUrl: 'assets/image/Take-Away-cuate.png',
    ),
    Introduction(
      title: "${translateDataBase("السرعة في التحضير", " Speed In Preparing ")}",
      subTitle: "${translateDataBase("احصل على خدمة التوصيل عند باب منزلك واستمتع بالطعام", " Pick up delivery at your door and enjoy groceries ")}",
      imageUrl: 'assets/image/Chef-pana.png',
    ),
    Introduction(
      title: "${translateDataBase("النهاية", " Finish ")}",
      subTitle: "${translateDataBase("تصفح القائمة واطلب مباشرة من التطبيق", " Browse the menu and order directly from the application ")}",
      imageUrl: 'assets/image/Take-Away-amico.png',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return IntroScreenOnboarding(
      introductionList: list,
      onTapSkipButton: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const WelcomeScreen(),
          ), //MaterialPageRoute
        );
      },
    );
  }
}
