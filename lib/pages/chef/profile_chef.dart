import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:home_food_delivery/controllers/recommended_product_controller.dart';
import 'package:home_food_delivery/models/all_models.dart';
import 'package:home_food_delivery/routes/route_helper.dart';
import 'package:home_food_delivery/utils/Colors.dart';
import 'package:home_food_delivery/utils/dimensions.dart';
import 'package:home_food_delivery/widgets/big_text.dart';
import 'package:home_food_delivery/widgets/icon_and_text_widget.dart';
import 'package:home_food_delivery/widgets/small_text.dart';
import 'package:intl/intl.dart';

import '../../utils/convert.dart';

class ProfileChef extends StatelessWidget {
  ProfileChef({super.key});

  final TextEditingController _Textcontroller = TextEditingController();
  final TextEditingController mycontroller = TextEditingController();
  final TextEditingController timeHour = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 0,
        systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: AppColors.mainColor,
            statusBarIconBrightness: Brightness.light),
      ),
      body: ListView(
        children: [
          Stack(
            children: [
              Container(
                height: 350.0,
                width: double.infinity,
              ),
              Container(
                height: 200.0,
                width: double.infinity,
                child: Image.asset(
                  fit: BoxFit.cover,
                  "assets/image/cover1.jpeg",
                ),
              ),
              Align(
                alignment: AlignmentDirectional.topStart,
                child: IconButton(
                  icon: const Icon(Icons.arrow_back_ios),
                  onPressed: () {
                    Get.back();
                  },
                  color: Colors.white,
                ),
              ),
              Positioned(
                top: 125.0,
                left: 15.0,
                right: 15.0,
                child: Material(
                  elevation: 3.0,
                  borderRadius: BorderRadius.circular(7.0),
                  child: Container(
                    height: 200.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(7.0),
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              Positioned(
                top: 75.0,
                left: (MediaQuery.of(context).size.width / 2 - 50.0),
                child: Container(
                  height: 100.0,
                  width: 100.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50.0),
                    image: const DecorationImage(
                      image: AssetImage('assets/image/chef.jpeg'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              Positioned(
                top: 190.0,
                left: (MediaQuery.of(context).size.width / 2) - 75.0,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    BigText(text: '${translateDataBase("أحمد أسعد", "Ahmed Asaad")}'),
                    const SizedBox(
                      height: 7.0,
                    ),
                    Text('${translateDataBase("الاسماعيليه", "Ismailia")}'),
                    const SizedBox(height: 10.0),
                    Row(
                      children: [
                        Wrap(
                          children: List.generate(5, (index) {
                            return Icon(
                              Icons.star,
                              color: AppColors.mainColor,
                              size: 25,
                            );
                          }),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        SmallText(text: '4.5'),
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
          Container(
            padding: const EdgeInsets.only(
              left: 15.0,
              right: 15.0,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                BigText(text: '${translateDataBase("الاعمال", "Works")}'),
              ],
            ),
          ),
          const SizedBox(
            height: 10.0,
          ),
          GetBuilder<RecommendedProductController>(
              builder: (recommendedProduct) {
            return ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: 3,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      Get.toNamed(
                          RouteHelper.getRecommendedFood(index, '${translateDataBase("الرئيسية", "Home")}'));
                    },
                    child: Container(
                      margin: EdgeInsets.only(
                          left: Dimensions.width20,
                          right: Dimensions.width20,
                          bottom: Dimensions.height10),
                      child: Row(
                        children: [
                          //Image Section
                          Container(
                            width: Dimensions.listViewImgSize,
                            height: Dimensions.listViewImgSize,
                            decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.circular(Dimensions.radius20),
                                color: Colors.white38,
                                image: const DecorationImage(
                                    fit: BoxFit.cover,
                                    image: AssetImage(
                                        "assets/image/food11.jpeg"))),
                          ),
                          //Text Container
                          Expanded(
                            child: Container(
                              height: Dimensions.listViewTextContSize,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(
                                  topRight:
                                      Radius.circular(Dimensions.radius20),
                                  bottomRight:
                                      Radius.circular(Dimensions.radius20),
                                ),
                                color: Colors.white,
                              ),
                              child: Padding(
                                padding: EdgeInsets.only(
                                    left: Dimensions.width10,
                                    right: Dimensions.width10),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    BigText(text: '${translateDataBase("الدجاج والخضروات", "Chicken and vegetables")}'),
                                    SizedBox(
                                      height: Dimensions.height10,
                                    ),
                                    SmallText(
                                        text:'${translateDataBase("بخصائص مصرية", "With Egypt Characteristics")}'),
                                    SizedBox(
                                      height: Dimensions.height10,
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
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                });
          }),
          //textBox
          Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: TextFormField(
                    controller: _Textcontroller,
                    minLines: 2,
                    maxLines: 5,
                    //keyboardType: TextInputType.multiline,
                    decoration:  InputDecoration(
                        hintText: '${translateDataBase("ادخل رسالة هنا", "Enter A Message Here")}',
                        hintStyle: const TextStyle(color: Colors.grey),
                        border: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        )),
                  ),
                ),
                //time
                CustomFormAuth(
                  color: Colors.black12,
                  hinttext: '${translateDataBase("ادخل الوقت", "Entry Time")}',
                  label: '${translateDataBase("أدخل الوقت", "Entry Time")}',
                  iconData: Icons.access_time_filled,
                  mycontroller: timeHour,
                  valid: (val) {
                    if (val!.isEmpty) {
                      return  "${translateDataBase("ليس التاريخ", "Not Date")}";
                    }
                    return null;
                  },
                  onTapFull: () async {
                    TimeOfDay? pickedTime = await showTimePicker(
                      context: context,
                      initialTime: TimeOfDay.now(),
                      builder: (context, child) {
                        return Theme(
                          data: ThemeData(
                            useMaterial3: true,
                            primaryColor: Colors.white,
                          ),
                          child: child!,
                        );
                      },
                    );
                    if (pickedTime != null) {
                      DateTime parsedTime = DateTime(
                          DateTime.now().year,
                          DateTime.now().month,
                          DateTime.now().day,
                          pickedTime.hour,
                          pickedTime.minute);
                      String formattedTime = DateFormat.jm().format(parsedTime);
                      timeHour.text = formattedTime;
                    } else {
                      print("Time is not selected");
                    }
                  },
                  isNamber: false,
                ),
                const SizedBox(
                  height: 10,
                ),
                //Data
                CustomFormAuth(
                    hinttext: "${translateDataBase("تاريخ بدء العقد", "Contract start date")}",
                    label: "${translateDataBase("تاريخ بدء العقد", "Contract start date")}",
                    iconData: Icons.calendar_month,
                    mycontroller: mycontroller,
                    valid: (val) {
                      if (val!.isEmpty) {
                        return "${translateDataBase("ليس ساعة", "Not Hour")}";
                      }
                      return null;
                    },
                    onTapFull: () async {
                      DateTime? start = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(2000),
                        lastDate: DateTime(2200),
                      );
                      if (start != null) {
                        mycontroller.text =
                            DateFormat('yyyy-MM-dd').format(start);
                      }
                    },
                    isNamber: false),
                const SizedBox(
                  height: 15,
                ),
                ElevatedButton.icon(
                  onPressed: () {
                    showModalBottomSheet(
                      context: context,
                      builder: (context) => Container(
                        clipBehavior: Clip.antiAlias,
                        decoration: const BoxDecoration(
                            borderRadius: BorderRadius.vertical(
                                top: Radius.circular(30))),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Image.asset(
                              "assets/image/Animation - 1713992273789.gif",
                              height: 250,
                              width: 600,
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Text(
                              "${translateDataBase("يتم مراجعة طلبك", "𝙔𝙤𝙪𝙧 𝙧𝙚𝙦𝙪𝙚𝙨𝙩 𝙞𝙨 𝙗𝙚𝙞𝙣𝙜 𝙧𝙚𝙫𝙞𝙚𝙬𝙚𝙙")}",
                              style: TextStyle(
                                  fontSize: Dimensions.font16,
                                  color: Colors.black45),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  foregroundColor: Colors.white,
                                  backgroundColor: AppColors.mainColor,
                                  padding: const EdgeInsets.only(
                                      right: 120, left: 120) // foreground
                                  ),
                              onPressed: () {
                                Get.back();
                              },
                              child: Text(
                                "${translateDataBase("تم", "𝘿𝙤𝙣𝙚")}",
                                style: TextStyle(fontSize: Dimensions.font20),
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                  label: Text("${translateDataBase("حجز", "Booking")}"),
                  icon: const Icon(Icons.done),
                ),
                const SizedBox(
                  height: 15,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
