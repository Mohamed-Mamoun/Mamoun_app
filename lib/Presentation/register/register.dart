import 'package:advance_course/Presentation/register/view_model.dart';
import 'package:advance_course/Presentation/resources/color_manager.dart';
import 'package:advance_course/Presentation/resources/font_manager.dart';
import 'package:advance_course/Presentation/resources/strings_manager.dart';
import 'package:advance_course/Presentation/resources/styles_manager.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({super.key});

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<RegisterViewModel>(
      init: RegisterViewModel(),
      builder: (controller) => Scaffold(
        body: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 28),
            child: SingleChildScrollView(
              child: Form(
                key: controller.formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      AppStrings.signUp.tr,
                      style: StylesManager().getBoldStyle(
                          color: ColorManager.darkPrimary, fontSize: 35),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    TextFormField(
                      controller: controller.nameCNTL,
                      decoration: InputDecoration(
                          prefixIcon: Icon(
                            Icons.person,
                            color: ColorManager.darkGrey,
                          ),
                          border: InputBorder.none,
                          hintText: AppStrings.name.tr),
                    ),
                    const SizedBox(
                      height: 28,
                    ),
                    TextFormField(
                      controller: controller.phoneCNTL,
                      decoration: InputDecoration(
                          prefixIcon: Icon(
                            Icons.phone,
                            color: ColorManager.darkGrey,
                          ),
                          border: InputBorder.none,
                          hintText: AppStrings.phone.tr),
                    ),
                    const SizedBox(
                      height: 28,
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
                      height: 28,
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
                          AppStrings.accountExist.tr,
                          style: StylesManager().getMediumStyle(
                              color: ColorManager.lightGrey, fontSize: 18),
                        ),
                        TextButton(
                          onPressed: () {
                            Get.back();
                          },
                          child: Text('  ${AppStrings.login.tr}',
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
      ),
    );
  }
}
