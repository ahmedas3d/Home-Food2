import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:home_food_delivery/pages/home/home_page.dart';

import '../utils/Colors.dart';
import '../utils/convert.dart';
import '../utils/dimensions.dart';

class DonePage extends StatelessWidget {
  const DonePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              "assets/image/social-contactless-payment-with-mobile-phone.gif",
              height: 250,
              width: 600,
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              "${translateDataBase("تم تأكيد الدفع بنجاح", "𝙋𝙖𝙮𝙢𝙚𝙣𝙩 𝙝𝙖𝙨 𝙗𝙚𝙚𝙣 𝙘𝙤𝙣𝙛𝙞𝙧𝙢𝙚𝙙 𝙨𝙪𝙘𝙘𝙚𝙨𝙨𝙛𝙪𝙡𝙡𝙮")}",
              style:
                  TextStyle(fontSize: Dimensions.font16, color: Colors.black45),
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: AppColors.mainColor,
                  padding: const EdgeInsets.only(right: 120, left: 120) // foreground
                  ),
              onPressed: () {
                Get.to(const HomePage());
              },
              child: Text(
                "${translateDataBase(" تم", "𝘿𝙤𝙣𝙚")}",
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
  }
}
