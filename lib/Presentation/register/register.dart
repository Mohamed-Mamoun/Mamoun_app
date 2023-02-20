import 'package:advance_course/Presentation/register/view_model.dart';
import 'package:advance_course/Presentation/resources/color_manager.dart';
import 'package:advance_course/Presentation/resources/font_manager.dart';
import 'package:advance_course/Presentation/resources/strings_manager.dart';
import 'package:advance_course/Presentation/resources/styles_manager.dart';
import 'package:advance_course/data/models/models.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
            padding: EdgeInsets.symmetric(horizontal: 28.w),
            child: SingleChildScrollView(
              child: Form(
                key: controller.formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      AppStrings.signUp.tr,
                      textScaleFactor: 1,
                      style: StylesManager().getBoldStyle(
                          color: ColorManager.darkPrimary, fontSize: 35.sp),
                    ),
                    SizedBox(
                      height: 30.h,
                    ),
                    TextFormField(
                      controller: controller.nameCNTL,
                      validator: (value) {
                        if (value!.trim().isEmpty || value.trim() == null) {
                          return AppStrings.validateName.tr;
                        }
                      },
                      decoration: InputDecoration(
                          prefixIcon: Icon(
                            Icons.person,
                            color: ColorManager.darkGrey,
                          ),
                          border: InputBorder.none,
                          hintText: AppStrings.name.tr),
                    ),
                    SizedBox(
                      height: 25.h,
                    ),
                    TextFormField(
                      controller: controller.phoneCNTL,
                      validator: (value) {
                        if (value!.trim().isEmpty || value.trim() == null) {
                          return AppStrings.validateNumber.tr;
                        }
                      },
                      decoration: InputDecoration(
                          prefixIcon: Icon(
                            Icons.phone,
                            color: ColorManager.darkGrey,
                          ),
                          border: InputBorder.none,
                          hintText: AppStrings.phone.tr),
                    ),
                    SizedBox(
                      height: 25.h,
                    ),
                    TextFormField(
                      controller: controller.emailCNTL,
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
                      height: 25.h,
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
                                controller.signUpMethod(UserModel(
                                  email: controller.emailCNTL.text,
                                  pass: controller.passCNTL.text,
                                  name: controller.nameCNTL.text,
                                  number: controller.phoneCNTL.text,
                                ));
                              } else {}
                            },
                            child: Text(AppStrings.submit.tr))
                      ],
                    ),
                    SizedBox(
                      height: 30.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          AppStrings.accountExist.tr,
                          style: StylesManager().getMediumStyle(
                              color: ColorManager.lightGrey, fontSize: 18.sp),
                        ),
                        TextButton(
                          onPressed: () {
                            Get.back();
                          },
                          child: Text('  ${AppStrings.login.tr}',
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
