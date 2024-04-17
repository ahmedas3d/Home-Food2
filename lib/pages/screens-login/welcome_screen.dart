import 'package:flutter/material.dart';
import 'package:home_food_delivery/pages/screens-login/signin_screen.dart';
import 'package:home_food_delivery/pages/screens-login/signup_screen.dart';
import 'package:home_food_delivery/pages/theme-login/theme.dart';
import 'package:home_food_delivery/pages/widgets-login/custom_scaffold.dart';
import 'package:home_food_delivery/pages/widgets-login/welcome_button.dart';

import '../../utils/convert.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      child: Column(
        children: [
          Flexible(
              flex: 8,
              child: Container(
                padding: const EdgeInsets.symmetric(
                  vertical: 0,
                  horizontal: 40.0,
                ),
                child: Center(
                  child: RichText(
                    textAlign: TextAlign.center,
                    text:  TextSpan(
                      children: [
                        TextSpan(
                            text: "${translateDataBase("\nمرحبًا بعودتك", " Welcome Back!\n ")}",
                            style: TextStyle(
                              fontSize: 45.0,
                              fontWeight: FontWeight.w600,
                            )),
                        TextSpan(
                            text:
                                "${translateDataBase("\nأدخل التفاصيل الشخصية لحساب العميل الخاص بك", "\nEnter the personal details of your customer account")}",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                              // height: 0,
                            ))
                      ],
                    ),
                  ),
                ),
              )),
          Flexible(
            flex: 1,
            child: Align(
              alignment: Alignment.bottomRight,
              child: Row(
                children: [
                   Expanded(
                    child: WelcomeButton(
                      buttonText: "${translateDataBase("تسجيل الدخول", "Sign in")}",
                      onTap: SignInScreen(),
                      color: Colors.transparent,
                      textColor: Colors.white,
                    ),
                  ),
                  Expanded(
                    child: WelcomeButton(
                      buttonText: "${translateDataBase("انشاء حساب", "Sign up")}",
                      onTap: const SignUpScreen(),
                      color: Colors.white,
                      textColor: lightColorScheme.primary,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
