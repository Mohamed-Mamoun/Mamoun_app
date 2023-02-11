import 'package:advance_course/Presentation/login/view_mode.dart';
import 'package:advance_course/Presentation/register/register.dart';
import 'package:advance_course/Presentation/resources/color_manager.dart';
import 'package:advance_course/Presentation/resources/font_manager.dart';
import 'package:advance_course/Presentation/resources/strings_manager.dart';
import 'package:advance_course/Presentation/resources/styles_manager.dart';
import 'package:advance_course/Presentation/resources/values_manager.dart';
import 'package:advance_course/Presentation/settings/setting.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<LoginViewModel>(
      init: LoginViewModel(),
      builder: (controller) => Scaffold(
        body: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: Appsize.s28),
            child: SingleChildScrollView(
              child: Form(
                key: controller.formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      AppStrings.login.tr,
                      style: StylesManager().getBoldStyle(
                          color: ColorManager.darkPrimary, fontSize: 35),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    TextFormField(
                      controller: controller.emailCNTL,
                      decoration: InputDecoration(
                          prefixIcon: Icon(
                            Icons.email,
                            color: ColorManager.darkGrey,
                          ),
                          border: InputBorder.none,
                          hintText: AppStrings.email.tr),
                    ),
                    const SizedBox(
                      height: Appsize.s28,
                    ),
                    TextFormField(
                      controller: controller.passCNTL,
                      obscureText: controller.isPasswordShow,
                      decoration: InputDecoration(
                          suffixIcon: IconButton(
                            icon: Icon(
                              controller.suffix,
                              color: ColorManager.darkGrey,
                            ),
                            onPressed: () {
                              controller.changePasswordVisib();
                            },
                          ),
                          prefixIcon: Icon(
                            Icons.lock,
                            color: ColorManager.darkGrey,
                          ),
                          border: InputBorder.none,
                          hintText: AppStrings.password.tr),
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        RoundedLoadingButton(
                            loaderSize: 30,
                            loaderStrokeWidth: 5,
                            borderRadius: 30,
                            color: ColorManager.primary,
                            elevation: 10,
                            controller: controller.buttonCNTL,
                            onPressed: () async {
                              controller.buttonCNTL.start();
                              await Future.delayed(const Duration(seconds: 3));
                              controller.buttonCNTL.stop();
                              await Future.delayed(const Duration(seconds: 2));
                              controller.buttonCNTL.success();
                              await Future.delayed(const Duration(seconds: 2));
                              controller.buttonCNTL.reset();
                            },
                            child: Text(AppStrings.login2.tr))
                      ],
                    ),
                    const SizedBox(
                      height: 35,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          AppStrings.accountDontExist.tr,
                          style: StylesManager().getMediumStyle(
                              color: ColorManager.lightGrey, fontSize: 18),
                        ),
                        TextButton(
                          onPressed: () {
                            Get.to(() => const RegisterView(),
                                transition: Transition.cupertino);
                          },
                          child: Text('  ${AppStrings.signUp.tr}',
                              style: TextStyle(
                                  color: ColorManager.primary,
                                  fontFamily: FontFamilyManager.fontFamily,
                                  fontSize: 18)),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Get.to(() => const SettingsView(),
                transition: Transition.cupertino);
          },
          child: const Icon(Icons.language_outlined),
        ),
      ),
    );
  }
}
