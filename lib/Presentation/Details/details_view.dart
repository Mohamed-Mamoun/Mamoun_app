import 'package:advance_course/Presentation/cart/view_model.dart';
import 'package:advance_course/Presentation/resources/color_manager.dart';
import 'package:advance_course/Presentation/resources/font_manager.dart';
import 'package:advance_course/Presentation/resources/strings_manager.dart';
import 'package:advance_course/Presentation/resources/styles_manager.dart';
import 'package:advance_course/data/models/models.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';

class DetailsView extends StatelessWidget {
  DetailsView({super.key, required this.model});
  ProductModel model;

  @override
  Widget build(BuildContext context) {
    final cntl = Get.find<CartViewModel>();
    final buttonCNTL = RoundedLoadingButtonController();
    return Scaffold(
      appBar: AppBar(
        elevation: 5,
        title: Text(
          AppStrings.details.tr,
          textScaleFactor: 1,
          style: StylesManager().getMediumStyle(fontSize: 18.sp),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(
            model.productImage.toString(),
            height: 300.h,
            width: Get.width,
          ),
          SizedBox(
            height: 50.h,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  model.productName.toString(),
                  textScaleFactor: 1,
                  style: StylesManager().getMediumStyle(fontSize: 15.sp),
                ),
                Text(
                  'SDG  ${double.parse(model.productPrice.toString())}',
                  textScaleFactor: 1,
                  style: TextStyle(
                      fontFamily: FontFamilyManager.fontFamily,
                      fontSize: 17.sp,
                      color: ColorManager.primary),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 5.h,
          ),
          Text(
            "  " + AppStrings.description.tr + ':',
            textScaleFactor: 1,
            style: TextStyle(
              fontFamily: FontFamilyManager.fontFamily,
              fontSize: 18.sp,
            ),
          ),
        ],
      ),
      bottomSheet: Container(
        padding: EdgeInsets.only(bottom: 13.h),
        color: Theme.of(context).scaffoldBackgroundColor,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            RoundedLoadingButton(
                width: 300.w,
                loaderSize: 30,
                loaderStrokeWidth: 5,
                borderRadius: 12,
                color: ColorManager.primary,
                elevation: 10,
                controller: buttonCNTL,
                onPressed: () async {
                  buttonCNTL.start();
                  await Future.delayed(const Duration(seconds: 2));
                  cntl.addProduct(CartProductModel(
                      name: model.productName,
                      productId: model.productId,
                      quantity: 1,
                      category: model.category,
                      price: model.productPrice,
                      image: model.productImage));
                  buttonCNTL.reset();
                },
                child: Text(
                  AppStrings.addToCart.tr,
                  textScaleFactor: 1,
                ))
          ],
        ),
      ),
    );
  }
}
