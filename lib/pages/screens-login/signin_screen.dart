import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:home_food_delivery/pages/home/home_page.dart';
import 'package:home_food_delivery/pages/screens-login/signup_screen.dart';
import 'package:home_food_delivery/pages/theme-login/theme.dart';
import 'package:home_food_delivery/pages/widgets-login/custom_scaffold.dart';
import 'package:home_food_delivery/utils/Colors.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:url_launcher/url_launcher_string.dart';

import '../../utils/convert.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final _formSignInKey = GlobalKey<FormState>();
  bool rememberPassword = true;

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
                child: Form(
                  key: _formSignInKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "${translateDataBase("مرحبًا بعودتك", " Welcome back ")}",
                        style: TextStyle(
                          fontSize: 30.0,
                          fontWeight: FontWeight.w900,
                          color: lightColorScheme.primary,
                        ),
                      ),
                      const SizedBox(
                        height: 40.0,
                      ),
                      TextFormField(
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "${translateDataBase("الرجاء إدخال البريد الإلكتروني", " Please enter Email ")}";
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          label: Text("${translateDataBase("البريد الالكتروني", " Email ")}"),
                          hintText: "${translateDataBase("ادخل البريد الالكتروني", " Enter Email ")}",
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
                      TextFormField(
                        obscureText: true,
                        obscuringCharacter: '*',
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "${translateDataBase("الرجاء إدخال كلمة المرور", " Please enter Password ")}";
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          label: Text("${translateDataBase(" كلمة المرور", "  Password ")}"),
                          hintText: "${translateDataBase("ادخل كلمة المرور", "  Enter Password ")}",
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
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Checkbox(
                                value: rememberPassword,
                                onChanged: (bool? value) {
                                  setState(() {
                                    rememberPassword = value!;
                                  });
                                },
                                activeColor: lightColorScheme.primary,
                              ),
                               Text(
                                "${translateDataBase("تذكرنى", "  Remember me ")}",
                                style: const TextStyle(
                                  color: Colors.black45,
                                ),
                              ),
                            ],
                          ),
                          GestureDetector(
                            child: Text(
                              "${translateDataBase("هل نسيت كلمة المرور؟", "  Forget password? ")}",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: lightColorScheme.primary,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 25.0,
                      ),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () {
                            if (_formSignInKey.currentState!.validate() &&
                                rememberPassword) {
                              //ScaffoldMessenger.of(context).showSnackBar(
                                //const SnackBar(
                                 // content: Text('Processing Data'),
                                //),
                              //);
                              Get.to(const HomePage());
                            } else if (!rememberPassword) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                 SnackBar(
                                    content: Text("${translateDataBase("يرجى الموافقة على معالجة البيانات الشخصية", "Please agree to the processing of personal data")}")),
                              );
                            }
                          },
                          child:  Text("${translateDataBase("تسجيل الدخول", "log in")}"),
                        ),
                      ),
                      const SizedBox(
                        height: 25.0,
                      ),
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
                        height: 25.0,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          IconButton(
                            onPressed: () async{
                              const url = "https://www.facebook.com/ahmed.asaad.3434/";
                              await launchUrlString(url);
                            },
                            icon: Icon(
                            TeenyIcons.facebook,
                            color: AppColors.blueColor,
                          ),
                          ),
                          IconButton(onPressed: () async{
                            const url = "";
                            await launchUrlString(url);
                          },
                            icon: Icon(
                            TeenyIcons.twitter,
                            color: AppColors.mainBlueColor,
                          ),),
                          IconButton(
                            onPressed: () async{
                              const url = "";
                              await launchUrlString(url);
                            },
                            icon: Icon(
                            TeenyIcons.google,
                            color: AppColors.mainColor,
                          ),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 25.0,
                      ),
                      // don't have an account
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                           Text(
                             "${translateDataBase("ليس لديك حساب؟", "Don\'t have an account?")}",
                            style: const TextStyle(
                              color: Colors.black45,
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (e) => const SignUpScreen(),
                                ),
                              );
                            },
                            child: Text(
                              "${translateDataBase("انشاء حساب", "Sign up")}",
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
