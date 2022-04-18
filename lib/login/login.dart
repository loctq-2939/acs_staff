import 'package:acs_staff/login/login.controller.dart';
import 'package:acs_staff/styles/acs_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginScreen extends GetWidget<LoginController> {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            backgroundColor: ACSColors.background,
            body: Container(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: SingleChildScrollView(
                reverse: true,
                child: Form(
                  key: controller.loginFormKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      SizedBox(
                        width: 200,
                        height: 150,
                        child: Image.asset('assets/images/logo.png'),
                      ),
                      const SizedBox(height: 0),
                      const Text(
                        'Xin chào thành viên của ACS',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 30,
                            color: ACSColors.primary),
                      ),
                      const SizedBox(height: 30),
                      const Text(
                        'Tên tài khoản',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: ACSColors.primary),
                      ),
                      const SizedBox(height: 12),
                      TextFormField(
                        controller: controller.userNameController,
                        validator: controller.validator,
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                        ),
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8)),
                            hintText: 'Nhập tên tài khoản',
                            labelStyle: TextStyle(
                                color: Color(0xf888888), fontSize: 15)),
                      ),
                      const SizedBox(height: 20),
                      const Text(
                        'Mật khẩu',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: ACSColors.primary),
                      ),
                      const SizedBox(height: 12),
                      TextFormField(
                        obscureText: true,
                        controller: controller.passwordController,
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                        ),
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8)),
                            hintText: 'Nhập mật khẩu',
                            labelStyle: TextStyle(
                                color: Color(0xf888888), fontSize: 15)),
                      ),
                      const SizedBox(height: 40),
                      SizedBox(
                        width: double.infinity,
                        height: 46,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: ACSColors.primary,
                            shape: const RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(8))),
                          ),
                          onPressed: () => controller.login(),
                          child: const Text(
                            'Đăng nhập',
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            )));
  }
}
