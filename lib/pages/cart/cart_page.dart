import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:home_food_delivery/controllers/cart_controller.dart';
import 'package:home_food_delivery/controllers/popular_product_controller.dart';
import 'package:home_food_delivery/controllers/recommended_product_controller.dart';
import 'package:home_food_delivery/pages/cart/payment_details.dart';
import 'package:home_food_delivery/pages/home/main_food_page.dart';
import 'package:home_food_delivery/routes/route_helper.dart';
import 'package:home_food_delivery/utils/Colors.dart';
import 'package:home_food_delivery/utils/app_constants.dart';
import 'package:home_food_delivery/utils/dimensions.dart';
import 'package:home_food_delivery/widgets/app_icon.dart';
import 'package:home_food_delivery/widgets/big_text.dart';
import 'package:home_food_delivery/widgets/small_text.dart';

import '../../utils/convert.dart';

class CartPage extends StatelessWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            top: Dimensions.height20 * 3,
            left: Dimensions.width20,
            right: Dimensions.width20,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {
                    Get.toNamed(RouteHelper.getInitial());
                  },
                  child: AppIcon(
                    icon: Icons.arrow_back_ios,
                    iconColor: Colors.white,
                    backgroundColor: AppColors.mainColor,
                    iconSize: Dimensions.iconSize24,
                  ),
                ),
                SizedBox(width: Dimensions.width20 * 5),
                GestureDetector(
                  onTap: () {
                    Get.toNamed(RouteHelper.getInitial());
                  },
                  child: AppIcon(
                    icon: Icons.home_outlined,
                    iconColor: Colors.white,
                    backgroundColor: AppColors.mainColor,
                    iconSize: Dimensions.iconSize24,
                  ),
                ),
                AppIcon(
                  icon: Icons.shopping_cart,
                  iconColor: Colors.white,
                  backgroundColor: AppColors.mainColor,
                  iconSize: Dimensions.iconSize24,
                )
              ],
            ),
          ),
          Positioned(
            top: Dimensions.height20 * 5,
            left: Dimensions.width20,
            right: Dimensions.width20,
            bottom: 0,
            child: Container(
              margin: EdgeInsets.only(top: Dimensions.height15),
              child: GetBuilder<CartController>(
                builder: (cartController) {
                  var _cartList = cartController.getItems;
                  return ListView.builder(
                    itemCount: _cartList.length,
                    itemBuilder: (_, index) {
                      return Container(
                        width: double.maxFinite,
                        height: Dimensions.height20 * 5,
                        child: Row(
                          children: [
                            GestureDetector(
                              onTap: () {
                                var popularIndex =
                                    Get.find<PopularProductController>()
                                        .popularProductList
                                        .indexOf(_cartList[index].product!);
                                if (popularIndex >= 0) {
                                  Get.toNamed(RouteHelper.getPopularFood(
                                      popularIndex, "cartpage"));
                                } else {
                                  var recommendedIndex =
                                      Get.find<RecommendedProductController>()
                                          .recommendedProductList
                                          .indexOf(_cartList[index].product!);
                                  Get.toNamed(RouteHelper.getRecommendedFood(
                                      recommendedIndex, "cartpage"));
                                }
                              },
                              child: Container(
                                width: Dimensions.height20 * 5,
                                height: Dimensions.height20 * 5,
                                margin: EdgeInsets.only(
                                    bottom: Dimensions.height10),
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: NetworkImage(
                                      AppConstants.BASE_URL +
                                          AppConstants.UPLOAD_URL +
                                          cartController.getItems[index].img!,
                                    ),
                                  ),
                                  borderRadius: BorderRadius.circular(
                                      Dimensions.radius20),
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            SizedBox(width: Dimensions.width10),
                            Expanded(
                              child: Container(
                                height: Dimensions.height20 * 5,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Expanded(
                                      child: BigText(
                                        text:
                                            cartController.getItems[index].name!,
                                        color: Colors.black87,
                                      ),
                                    ),
                                    SmallText(text: '${translateDataBase("حار", "Spicy")}'),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        BigText(
                                          text:
                                              "${cartController.getItems[index].price.toString()} \L\E",
                                          color: Colors.redAccent,
                                        ),
                                        Container(
                                          padding: EdgeInsets.all(
                                              Dimensions.width10),
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(
                                                Dimensions.radius20),
                                            color: Colors.white,
                                          ),
                                          child: Row(
                                            children: [
                                              GestureDetector(
                                                onTap: () {
                                                  cartController.addItem(
                                                      _cartList[index].product!,
                                                      -1);
                                                },
                                                child: Icon(
                                                  Icons.remove,
                                                  color: AppColors.signColor,
                                                ),
                                              ),
                                              SizedBox(
                                                  width:
                                                      Dimensions.width10 / 2),
                                              BigText(
                                                  text: _cartList[index]
                                                      .quantity
                                                      .toString()),
                                              SizedBox(
                                                  width:
                                                      Dimensions.width10 / 2),
                                              GestureDetector(
                                                onTap: () {
                                                  cartController.addItem(
                                                      _cartList[index].product!,
                                                      1);
                                                },
                                                child: Icon(
                                                  Icons.add,
                                                  color: AppColors.signColor,
                                                ),
                                              ),
                                            ],
                                          ),
                                        )
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: GetBuilder<CartController>(
        builder: (cartController) {
          return Container(
            height: Dimensions.bottomHeightBar,
            padding: EdgeInsets.all(Dimensions.width20),
            decoration: BoxDecoration(
              color: AppColors.buttonBackgroundColor,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(Dimensions.radius20 * 2),
                topRight: Radius.circular(Dimensions.radius20 * 2),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: EdgeInsets.all(Dimensions.width10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(Dimensions.radius20),
                    color: Colors.white,
                  ),
                  child: Row(
                    children: [
                      SizedBox(width: Dimensions.width20 / 2),
                      BigText(
                        text: '${translateDataBase("الاجمالي", "Total: ")}',
                        color: Colors.black45,
                      ),
                      BigText(
                        text: cartController.totalAmount.toString() + " \L\E",
                      ),
                      SizedBox(width: Dimensions.width20 / 2),
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Get.to(const PaymentDetailsView());
                  },
                  child: Container(
                    padding: EdgeInsets.all(Dimensions.width10),
                    child: BigText(
                      text: '${translateDataBase("الدفع", "Check Out")}',
                      color: Colors.white,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(Dimensions.radius20),
                      color: AppColors.mainColor,
                    ),
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
