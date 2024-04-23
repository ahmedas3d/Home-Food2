import 'package:flutter/material.dart';
import 'package:home_food_delivery/utils/Colors.dart';

import '../../utils/convert.dart';


class Orders extends StatelessWidget {
  const Orders({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.white,
        backgroundColor: AppColors.mainColor,
        title:  Center(child: Text("${translateDataBase("طلبات", " Orders ")}")),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/image/Animation - 1713816007366.gif', // Replace with your image path
              width: 200,
              height: 200,
            ),
            const SizedBox(height: 20),
             Text(
              "${translateDataBase("طلبات", " Orders ")}",
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
