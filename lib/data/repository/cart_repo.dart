import 'dart:convert';

import 'package:get/get.dart';
import 'package:home_food_delivery/helper/dependencies.dart';
import 'package:home_food_delivery/models/cart_model.dart';
import 'package:home_food_delivery/utils/app_constants.dart';

class CartRepo {
  MyServices myServices = Get.find();

  List<String> cart = [];
  List<String> cartHistory = [];

  void addToCartList(List<CartModel> cartList) {
    //sharedPreferences.remove(AppConstants.CART_LIST);
    //sharedPreferences.remove(AppConstants.CART_HISTORY_LIST);
    var time = DateTime.now().toString();
    cart = [];

    cartList.forEach((element) {
      element.time = time;
      return cart.add(jsonEncode(element));
    });
    myServices.sharedPreferences.setStringList(AppConstants.CART_LIST, cart);
    //print(sharedPreferences.getStringList(AppConstants.CART_LIST));
    //getCartList();
  }

  List<CartModel> getCartList() {
    List<String> carts = [];
    if (myServices.sharedPreferences.containsKey(AppConstants.CART_LIST)) {
      carts = myServices.sharedPreferences.getStringList(AppConstants.CART_LIST)!;
      print("inside getCartList" + carts.toString());
    }
    List<CartModel> cartList = [];

    carts.forEach(
        (element) => cartList.add(CartModel.fromJson(jsonDecode(element))));

    return cartList;
  }

  List<CartModel> getCartHistoryList() {
    if (myServices.sharedPreferences.containsKey(AppConstants.CART_HISTORY_LIST)) {
      //cartHistory=[];
      cartHistory =
          myServices.sharedPreferences.getStringList(AppConstants.CART_HISTORY_LIST)!;
    }
    List<CartModel> cartListHistory = [];
    cartHistory.forEach((element) =>
        cartListHistory.add(CartModel.fromJson(jsonDecode(element))));
    return cartListHistory;
  }

  void addToCartHistoryList(List<CartModel> getItems) {
    if (myServices.sharedPreferences.containsKey(AppConstants.CART_HISTORY_LIST)) {
      cartHistory =
          myServices.sharedPreferences.getStringList(AppConstants.CART_HISTORY_LIST)!;
    }
    for (int i = 0; i < cart.length; i++) {
      print("history list " + cart[i]);
      cartHistory.add(cart[i]);
    }
    removeCart();
    myServices.sharedPreferences.setStringList(
        AppConstants.CART_HISTORY_LIST, cartHistory);
    print("The Length of History List is " +
        getCartHistoryList().length.toString());
    for (int j = 0; j < getCartHistoryList().length; j++) {
      print("The Time for The Order is " +
          getCartHistoryList()[j].time.toString());
    }
  }

  void removeCart() {
    cart = [];
    myServices.sharedPreferences.remove(AppConstants.CART_LIST);
  }
}
