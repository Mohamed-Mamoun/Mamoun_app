import 'package:advance_course/Presentation/login/view_mode.dart';
import 'package:advance_course/Presentation/register/register.dart';
import 'package:advance_course/Presentation/resources/assets_manager.dart';
import 'package:advance_course/Presentation/resources/color_manager.dart';
import 'package:advance_course/Presentation/resources/font_manager.dart';
import 'package:advance_course/Presentation/resources/strings_manager.dart';
import 'package:advance_course/Presentation/resources/styles_manager.dart';
import 'package:advance_course/Presentation/settings/setting.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
//
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
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
            padding: EdgeInsets.symmetric(horizontal: 28.w),
            child: SingleChildScrollView(
              child: Form(
                key: controller.formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          AppStrings.login.tr,
                          textScaleFactor: 1,
                          style: StylesManager().getBoldStyle(
                              color: ColorManager.darkPrimary, fontSize: 33.sp),
                        ),
                        Padding(
                          padding: EdgeInsets.only(bottom: 20.w),
                          child:
                              Lottie.asset(AssetsManager.hiAnim, width: 80.w),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 15.h,
                    ),
                    TextFormField(
                      controller: controller.emailCNTL,
                      // ignore: body_might_complete_normally_nullable
                      validator: (value) {
                        if (value!.trim().isEmpty || value.trim() == null) {
                          return AppStrings.validateEmail.tr;
                        }
                      },
                      decoration: InputDecoration(
                          prefixIcon: Icon(
                            Icons.email,
                            color: ColorManager.darkGrey,
                          ),
                          border: InputBorder.none,
                          hintText: AppStrings.email.tr),
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    TextFormField(
                      controller: controller.passCNTL,
                      obscureText: controller.isPasswordShow,
                      validator: (value) {
                        if (value!.trim().isEmpty || value.trim() == null) {
                          return AppStrings.validatePass.tr;
                        }
                      },
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
                    SizedBox(
                      height: 40.h,
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
                              if (controller.formKey.currentState!.validate()) {
                                controller.signInMethod(
                                    controller.emailCNTL.text.trim(),
                                    controller.passCNTL.text.trim());
                              } else {
                                controller.buttonCNTL.reset();
                              }
                            },
                            child: Text(
                              AppStrings.login2.tr,
                              textScaleFactor: 1,
                            ))
                      ],
                    ),
                    SizedBox(
                      height: 30.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          AppStrings.accountDontExist.tr,
                          textScaleFactor: 1,
                          style: StylesManager().getMediumStyle(
                              color: ColorManager.lightGrey, fontSize: 18.0.sp),
                        ),
                        TextButton(
                          onPressed: () {
                            Get.to(() => const RegisterView(),
                                transition: Transition.cupertino);
                          },
                          child: Text('  ${AppStrings.signUp.tr}',
                              textScaleFactor: 1,
                              style: TextStyle(
                                  color: ColorManager.primary,
                                  fontFamily: FontFamilyManager.fontFamily,
                                  fontSize: 18.sp)),
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
