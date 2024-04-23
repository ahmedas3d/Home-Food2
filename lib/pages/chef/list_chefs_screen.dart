import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:home_food_delivery/pages/chef/profile_chef.dart';
import 'package:home_food_delivery/pages/chef/user_chefs.dart';
import 'package:home_food_delivery/utils/Colors.dart';
import 'package:home_food_delivery/widgets/big_text.dart';

import '../../utils/convert.dart';

class ListChefsScreen extends StatelessWidget {
  const ListChefsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: BigText(
          text: '${translateDataBase("الشيف", "Chef")}',
          color: Colors.white,
        ),
        backgroundColor: AppColors.mainColor,
      ),
      body: ListView.separated(
        itemCount: chefs.length,
        padding: EdgeInsets.symmetric(vertical: 20),
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            onTap: () {
              Get.to(ProfileChef());
            },
            horizontalTitleGap: 20,
            contentPadding: const EdgeInsets.symmetric(horizontal: 18),
            leading: CircleAvatar(
              radius: 30,
              backgroundImage: AssetImage(
                chefs[index].image,
              ),
            ),
            title: Text(
              chefs[index].name,
              style: TextStyle(fontSize: 18),
            ),
            subtitle: Text(chefs[index].location),
          );
        },
        separatorBuilder: (BuildContext context, int index) => const SizedBox(
          height: 10,
        ),
      ),
    );
  }
}

Widget getItem(int index) {
  return Container(
    margin: const EdgeInsets.all(6),
    alignment: Alignment.center,
    height: 100,
    color: AppColors.mainColor,
    child: Text(
      'Item $index',
      style: const TextStyle(fontSize: 20),
    ),
  );
}
