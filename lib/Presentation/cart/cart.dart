import 'package:advance_course/Presentation/resources/strings_manager.dart';
import 'package:advance_course/Presentation/resources/styles_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';

import '../widgets/back_button.dart';

class CartView extends StatelessWidget {
  const CartView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const CustomizBackButton(),
        leadingWidth: 100.w,
        centerTitle: true,
        title: Text(
          AppStrings.cart.tr,
          style: StylesManager().getMediumStyle(fontSize: 18.sp),
        ),
        automaticallyImplyLeading: false,
      ),
    );
  }
}
