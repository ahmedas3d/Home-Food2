import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:home_food_delivery/pages/cart/payment_details_view_body.dart';
import 'package:home_food_delivery/utils/dimensions.dart';

import '../../utils/Colors.dart';
import '../../utils/convert.dart';

class PaymentDetailsView extends StatelessWidget {
  const PaymentDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
          ),
          onPressed: () {
            Get.back();
          },
        ),
        elevation: 0,
        backgroundColor: AppColors.mainColor,
        centerTitle: true,
        title: Text(
          '${translateDataBase("بيانات الدفع", "Payment Details")}',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w500,
            fontSize: 24,
          ),
        ),
      ),
      body: const PaymentDetailsViewBody(),
    );
  }
}
