import 'package:flutter/material.dart';
import 'package:home_food_delivery/pages/home/food_page_body.dart';
import 'package:home_food_delivery/utils/Colors.dart';
import 'package:home_food_delivery/utils/dimensions.dart';
import 'package:home_food_delivery/widgets/big_text.dart';
import 'package:home_food_delivery/widgets/small_text.dart';

import '../../utils/convert.dart';

class MainFoodPage extends StatelessWidget {
  const MainFoodPage({super.key});

  get color => null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          //Showing the header
          Container(
            child: Container(
              margin: EdgeInsets.only(
                  top: Dimensions.height45, bottom: Dimensions.height15),
              padding: EdgeInsets.only(
                  left: Dimensions.width20, right: Dimensions.width20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      BigText(
                          color: AppColors.mainColor, size: 25, text: '${translateDataBase("مصر", "Egypt")}'),
                      Row(
                        children: [
                          SmallText(text:'${translateDataBase("الاسماعيليه", "Ismailia")}', color: Colors.black54),
                        ],
                      )
                    ],
                  ),
                  Center(
                    child: Container(
                      width: Dimensions.width45,
                      height: Dimensions.height45,
                      child: Icon(Icons.search,
                          color: Colors.white, size: Dimensions.iconSize24),
                      decoration: BoxDecoration(
                        borderRadius:
                            BorderRadius.circular(Dimensions.radius15),
                        color: AppColors.mainColor,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          //Showing The Body
          Expanded(
              child: SingleChildScrollView(
            child: FoodPageBody(),
          )),
        ],
      ),
    );
  }
}
