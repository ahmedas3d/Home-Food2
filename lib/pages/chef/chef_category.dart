import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:home_food_delivery/utils/Colors.dart';
import 'package:home_food_delivery/widgets/big_text.dart';
import 'package:home_food_delivery/widgets/small_text.dart';

import '../../utils/convert.dart';

class Categories extends StatelessWidget {
  final String? image;
  final String? type;

  const Categories({super.key, this.image, this.type});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 86,
      width: 65,
      child: Column(
        children: [
          categoriesImage(),
          SizedBox(
            height: 3,
          ),
          categoriesType(),
        ],
      ),
    );
  }

  Widget categoriesImage() {
    return Container(
      height: 60,
      width: 80,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.white,
      ),
      child: Padding(
        padding: EdgeInsets.all(14),
        child: Image.asset(
          image ?? "assets/image/chef.png",
          height: 10,
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Widget categoriesType() {
    return SizedBox(
      child: SmallText(
        text:'${translateDataBase("الشيف","Chef")}',
      ),
    );
  }
}
