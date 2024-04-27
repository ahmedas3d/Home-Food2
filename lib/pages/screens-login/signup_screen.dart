import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:home_food_delivery/pages/screens-login/signin_screen.dart';
import 'package:home_food_delivery/pages/theme-login/theme.dart';
import 'package:home_food_delivery/pages/widgets-login/custom_scaffold.dart';
import 'package:home_food_delivery/utils/Colors.dart';
import 'package:icons_plus/icons_plus.dart';

import '../../utils/convert.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _formSignupKey = GlobalKey<FormState>();
  bool agreePersonalData = true;

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      child: Column(
        children: [
          const Expanded(
            flex: 1,
            child: SizedBox(
              height: 10,
            ),
          ),
          Expanded(
            flex: 7,
            child: Container(
              padding: const EdgeInsets.fromLTRB(25.0, 50.0, 25.0, 20.0),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40.0),
                  topRight: Radius.circular(40.0),
                ),
              ),
              child: SingleChildScrollView(
                // get started form
                child: Form(
                  key: _formSignupKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      // get started text
                      Text(
                        "${translateDataBase("البداية", "Get Started")}",
                        style: TextStyle(
                          fontSize: 30.0,
                          fontWeight: FontWeight.w900,
                          color: lightColorScheme.primary,
                        ),
                      ),
                      const SizedBox(
                        height: 40.0,
                      ),
                      // full name
                      TextFormField(
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "${translateDataBase("الرجاء إدخال الاسم بالكامل", "Please enter Full name")}";
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          label:  Text("${translateDataBase("الاسم بالكامل", "Full Name")}"),
                          hintText: "${translateDataBase("ادخل الاسم بالكامل", "Enter Full Name")}",
                          hintStyle: const TextStyle(
                            color: Colors.black26,
                          ),
                          border: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: Colors.black12, // Default border color
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: Colors.black12, // Default border color
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 25.0,
                      ),
                      // email
                      TextFormField(
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "${translateDataBase("رجاء ادخل البريد الالكتروني", "Please enter Email")}";
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          label:  Text("${translateDataBase("البريد الالكتروني", "Email")}"),
                          hintText: "${translateDataBase("ادخل البريد الالكتروني", "Enter Email")}",
                          hintStyle: const TextStyle(
                            color: Colors.black26,
                          ),
                          border: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: Colors.black12, // Default border color
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: Colors.black12, // Default border color
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 25.0,
                      ),
                      // password
                      TextFormField(
                        obscureText: true,
                        obscuringCharacter: '*',
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "${translateDataBase("الرجاء إدخال كلمة المرور", "Please enter Password")}";
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          label:  Text("${translateDataBase("كلمة المرور", "Password")}"),
                          hintText: "${translateDataBase("ادخل كلمة المرور", "Enter Password")}",
                          hintStyle: const TextStyle(
                            color: Colors.black26,
                          ),
                          border: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: Colors.black12, // Default border color
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: Colors.black12, // Default border color
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 25.0,
                      ),
                      // i agree to the processing
                      Row(
                        children: [
                          Checkbox(
                            value: agreePersonalData,
                            onChanged: (bool? value) {
                              setState(() {
                                agreePersonalData = value!;
                              });
                            },
                            activeColor: lightColorScheme.primary,
                          ),
                           Text(
                            "${translateDataBase("أوافق على معالجة", "I agree to the processing of ")}",
                            style: const TextStyle(
                              color: Colors.black45,
                            ),
                          ),
                          Text(
                            "${translateDataBase("بيانات شخصية", "Personal data")}",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: lightColorScheme.primary,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 25.0,
                      ),
                      // signup button
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () {
                            if (_formSignupKey.currentState!.validate() &&
                                agreePersonalData) {
                              //ScaffoldMessenger.of(context).showSnackBar(
                                //const SnackBar(
                                //  content: Text('Processing Data'),
                                //),
                              //);
                              Get.to(const SignInScreen());
                            } else if (!agreePersonalData) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                 SnackBar(
                                    content: Text(
                                        "${translateDataBase("يرجى الموافقة على معالجة البيانات الشخصية", "Please agree to the processing of personal data")}")),
                              );
                            }
                          },
                          child:  Text("${translateDataBase("انشاء حساب", "Sign up")}"),
                        ),
                      ),

                      const SizedBox(
                        height: 30.0,
                      ),
                      // sign up divider
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                            child: Divider(
                              thickness: 0.7,
                              color: Colors.grey.withOpacity(0.5),
                            ),
                          ),
                           Padding(
                            padding: const EdgeInsets.symmetric(
                              vertical: 0,
                              horizontal: 10,
                            ),
                            child: Text(
                              "${translateDataBase("قم بتسجيل الدخول من خلال", "Sign up with")}",
                              style: const TextStyle(
                                color: Colors.black45,
                              ),
                            ),
                          ),
                          Expanded(
                            child: Divider(
                              thickness: 0.7,
                              color: Colors.grey.withOpacity(0.5),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 30.0,
                      ),
                      // sign up social media logo
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Icon(
                            TeenyIcons.facebook,
                            color: AppColors.blueColor,
                          ),
                          Icon(
                            TeenyIcons.twitter,
                            color: AppColors.mainBlueColor,
                          ),
                          Icon(
                            TeenyIcons.google,
                            color: AppColors.mainColor,
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 25.0,
                      ),
                      // already have an account
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                           Text(
                             "${translateDataBase("هل لديك حساب؟", "Already have an account?")}",
                            style: const TextStyle(
                              color: Colors.black45,
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (e) => const SignInScreen(),
                                ),
                              );
                            },
                            child: Text(
                              "${translateDataBase("تسجيل الدخول", "Sign in")}",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: lightColorScheme.primary,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 20.0,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
