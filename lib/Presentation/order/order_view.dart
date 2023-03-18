import 'package:advance_course/Presentation/order/view_model.dart';
import 'package:advance_course/Presentation/resources/color_manager.dart';
import 'package:advance_course/Presentation/resources/strings_manager.dart';
import 'package:advance_course/Presentation/widgets/back_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class OrderView extends StatelessWidget {
  const OrderView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<OrderViewMode>(
      init: Get.find<OrderViewMode>(),
      builder: (controller) => Scaffold(
        appBar: AppBar(
          leading: const CustomizBackButton(),
          leadingWidth: 100.w,
          centerTitle: true,
          title: Text(
            "Complete Your Order",
            style: Get.textTheme.titleLarge,
            textScaleFactor: 1,
          ),
          automaticallyImplyLeading: false,
        ),
        body: Column(
          children: [
            Theme(
              data: ThemeData(
                colorScheme: Theme.of(context).colorScheme.copyWith(
                      primary: ColorManager.primary,
                      secondary: ColorManager.primary,
                    ),
              ),
              child: Stepper(
                currentStep: controller.currentStep,
                onStepTapped: (value) {
                  controller.changeStepIndex(value);
                },
                onStepContinue: () {
                  controller.nextStep();
                },
                onStepCancel: () {},
                steps: [
                  Step(
                      isActive: controller.currentStep == 0 ? true : false,
                      title: Text(
                        'Delivery Address',
                        style: Get.textTheme.titleLarge,
                        textScaleFactor: 1,
                      ),
                      content: Form(
                          key: controller.formKey2,
                          child: TextFormField(
                            controller: controller.addressCNTL,
                            validator: (value) {
                              if (value!.trim().isEmpty) {
                                return 'Please Enter Your Address';
                              }
                              if (value.length <= 15) {
                                return 'Please write specific Location';
                              }
                            },
                            decoration: InputDecoration(
                                prefixIcon: Icon(
                              Icons.home_outlined,
                              size: 31,
                              color: Get.theme.primaryColorDark,
                            )),
                          ))),
                  Step(
                      isActive: controller.currentStep == 1 ? true : false,
                      title: Text(
                        'Phone Number',
                        style: Get.textTheme.titleLarge,
                        textScaleFactor: 1,
                      ),
                      content: Form(
                          key: controller.formKey3,
                          child: TextFormField(
                            controller: controller.deleviryNumberCNTL,
                            validator: (value) {
                              if (value!.trim().isEmpty) {
                                return 'Please Enter Your Phone Number';
                              }
                              if (value.length != 10) {
                                return 'Phone Number must be 10 digits';
                              }
                            },
                            decoration: InputDecoration(
                                prefixIcon: Icon(
                              Icons.phone_outlined,
                              color: Get.theme.primaryColorDark,
                            )),
                          ))),
                  Step(
                      isActive: controller.currentStep == 2 ? true : false,
                      title: Text(
                        'Confirm Order',
                        style: Get.textTheme.titleLarge,
                        textScaleFactor: 1,
                      ),
                      content: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '--  ${AppStrings.stepperInfo1.tr}',
                              style: Get.textTheme.titleLarge,
                            ),
                            SizedBox(
                              height: 2.h,
                            ),
                            Text(
                              '-- ${AppStrings.stepperInfo2.tr}',
                              style: Get.textTheme.titleLarge,
                            ),
                            SizedBox(
                              height: 2.h,
                            ),
                            Text(
                              '-- ${AppStrings.stepperInfo3.tr}',
                              style: Get.textTheme.titleLarge,
                            ),
                          ])),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
