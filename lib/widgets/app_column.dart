import 'package:flutter/material.dart';
import 'package:home_food_delivery/utils/Colors.dart';
import 'package:home_food_delivery/utils/dimensions.dart';
import 'package:home_food_delivery/widgets/big_text.dart';
import 'package:home_food_delivery/widgets/icon_and_text_widget.dart';
import 'package:home_food_delivery/widgets/small_text.dart';
import '../utils/convert.dart';

class AppColumn extends StatelessWidget {
  final String text;

  const AppColumn({required this.text, super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        BigText(
          text: text,
          size: Dimensions.font20,
        ),
        Row(
          children: [
            Wrap(
              children: List.generate(5, (index) {
                return Icon(
                  Icons.star,
                  color: AppColors.mainColor,
                  size: 18,
                );
              }),
            ),
            const SizedBox(
              width: 10,
            ),
            SmallText(text: '4.5'),
            const SizedBox(
              width: 10,
            ),
            SmallText(text: '1250'),
            const SizedBox(
              width: 10,
            ),
            SmallText(text: "${translateDataBase("تعليقات", "Comments")}")
          ],
        ),
        //comments section
        SizedBox(
          height: Dimensions.height15,
        ),
        //time and distance
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconAndTextWidget(
                icon: Icons.circle_sharp,
                text: "${translateDataBase("طبيعي", "Normal")}",
                iconColor: AppColors.iconColor1),
            IconAndTextWidget(
                icon: Icons.location_on,
                text: "${translateDataBase("1.7 كم", "1.7KM")}",
                iconColor: AppColors.mainColor),
            IconAndTextWidget(
                icon: Icons.access_time_filled_rounded,
                text: "${translateDataBase("35 دقيقه", "35min")}",
                iconColor: AppColors.iconColor2)
          ],
        )
      ],
    );
  }
}
