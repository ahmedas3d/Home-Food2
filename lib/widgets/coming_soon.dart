import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../utils/Colors.dart';
import '../utils/convert.dart';
import '../utils/dimensions.dart';

class ComingSoon extends StatelessWidget {
  const ComingSoon({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              "assets/image/clap-hand-and-lettering-coming-soon-sticker-3.gif",
              height: 250,
              width: 600,
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              "𝘾𝙤𝙢𝙞𝙣𝙜 𝙎𝙤𝙤𝙣",
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
                Get.back();
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
