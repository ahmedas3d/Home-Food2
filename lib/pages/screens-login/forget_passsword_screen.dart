import 'package:flutter/material.dart';

import '../../utils/convert.dart';

class ForgetPasswordScreen extends StatefulWidget {
  const ForgetPasswordScreen({super.key});

  @override
  State<ForgetPasswordScreen> createState() => _ForgetPasswordScreenState();
}

class _ForgetPasswordScreenState extends State<ForgetPasswordScreen> {
  @override
  Widget build(BuildContext context) {
    return  Text("${translateDataBase("نسيت كلمة المرور", " Forget Password ")}");
  }
}
