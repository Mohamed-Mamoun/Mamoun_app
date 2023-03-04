import 'package:advance_course/Presentation/cart/view_model.dart';
import 'package:advance_course/Presentation/resources/assets_manager.dart';
import 'package:advance_course/Presentation/resources/strings_manager.dart';
import 'package:advance_course/Presentation/resources/styles_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import '../widgets/back_button.dart';

class CartView extends StatelessWidget {
  const CartView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CartViewModel>(
      init: Get.find<CartViewModel>(),
      builder: (controller) => Scaffold(
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
          body: controller.cartProductModel.isEmpty
              ? Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 50.h,
                    ),
                    Center(
                        child: Lottie.asset(AssetsManager.cart, height: 250.h)),
                    SizedBox(
                      height: 20.h,
                    ),
                    Text(
                      AppStrings.addProductsToCart.tr,
                      style: StylesManager().getMediumStyle(fontSize: 20.sp),
                    ),
                  ],
                )
              : Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10.w),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 20.h,
                      ),
                      Container(
                        decoration: const BoxDecoration(),
                        height: 310.h,
                        child: ListView.builder(
                          itemCount: controller.cartProductModel.length,
                          itemBuilder: (context, index) => Container(
                            margin: EdgeInsets.only(bottom: 20.h),
                            decoration: const BoxDecoration(),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  height: 150.h,
                                  width: 140.w,
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          width: 2,
                                          color: Theme.of(context)
                                              .primaryColorDark),
                                      borderRadius: const BorderRadius.all(
                                          Radius.circular(10))),
                                  child: Image.asset(
                                    controller.cartProductModel[index].image
                                        .toString(),
                                  ),
                                ),
                                SizedBox(
                                  width: 20.w,
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      controller
                                          .cartProductModel[index].category
                                          .toString(),
                                      style: StylesManager()
                                          .getMediumStyle(fontSize: 12.sp),
                                    ),
                                    SizedBox(
                                      height: 50.h,
                                      width: 180.w,
                                      child: Text(
                                        controller.cartProductModel[index].name
                                            .toString(),
                                        style: StylesManager()
                                            .getMediumStyle(fontSize: 12.sp),
                                      ),
                                    ),
                                    Text(
                                      '  SDG  ${double.parse(controller.cartProductModel[index].price.toString())}',
                                      style: StylesManager()
                                          .getMediumStyle(fontSize: 12.sp),
                                    ),
                                    SizedBox(
                                      width: 150.0.w,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          IconButton(
                                              onPressed: () {
                                                controller
                                                    .decreaseQuantity(index);
                                              },
                                              icon: Icon(
                                                Icons
                                                    .remove_circle_outline_outlined,
                                                size: 30,
                                                color: Get.isDarkMode
                                                    ? Colors.white
                                                    : Colors.black,
                                              )),
                                          Text(
                                            controller.cartProductModel[index]
                                                .quantity
                                                .toString(),
                                          ),
                                          IconButton(
                                              onPressed: () {
                                                controller
                                                    .increaseQuantity(index);
                                              },
                                              icon: Icon(
                                                Icons
                                                    .add_circle_outline_outlined,
                                                size: 30,
                                                color: Get.isDarkMode
                                                    ? Colors.white
                                                    : Colors.black,
                                              )),
                                          SizedBox(
                                            width: 1.0.w,
                                          ),
                                          IconButton(
                                              onPressed: () async {
                                                return Get.defaultDialog(
                                                    titlePadding:
                                                        EdgeInsets.symmetric(
                                                            horizontal: 3.0.w,
                                                            vertical: 5.0.h),
                                                    radius: 8,
                                                    title:
                                                        'Delete Product From Cart?'
                                                            .tr,
                                                    titleStyle: TextStyle(
                                                      fontFamily: 'primary',
                                                      fontSize: 12.0.sp,
                                                    ),
                                                    content: Padding(
                                                      padding:
                                                          EdgeInsets.symmetric(
                                                              horizontal: 3.0.w,
                                                              vertical: 2.0.h),
                                                      child: Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceEvenly,
                                                        children: [
                                                          ElevatedButton(
                                                              style:
                                                                  ElevatedButton
                                                                      .styleFrom(
                                                                backgroundColor:
                                                                    Theme.of(
                                                                            context)
                                                                        .primaryColor,
                                                              ),
                                                              onPressed: () {
                                                                controller.deleteProduct(
                                                                    controller
                                                                            .cartProductModel[
                                                                        index]);
                                                                Get.back();
                                                              },
                                                              child: Text(
                                                                'Confirm'.tr,
                                                                // color: Colors
                                                                //     .white,
                                                                style: StylesManager()
                                                                    .getMediumStyle(),
                                                              )),
                                                          ElevatedButton(
                                                            style: ElevatedButton
                                                                .styleFrom(),
                                                            onPressed: () {
                                                              Get.back();
                                                            },
                                                            child: Text(
                                                              'Cancel'.tr,
                                                              style: StylesManager()
                                                                  .getMediumStyle(),
                                                            ),
                                                          )
                                                        ],
                                                      ),
                                                    ));
                                              },
                                              icon: Icon(
                                                Icons.close,
                                                color: Get.isDarkMode
                                                    ? Colors.red
                                                    : Colors.grey.shade600,
                                              )),
                                        ],
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      ListTile(
                        title: Text(
                          AppStrings.subTotal.tr,
                          style:
                              StylesManager().getMediumStyle(fontSize: 15.sp),
                        ),
                        trailing: Text(
                          '  SDG   ${controller.totalPrice}',
                          style:
                              StylesManager().getMediumStyle(fontSize: 15.sp),
                        ),
                      ),
                      Divider(
                        thickness: 2,
                        color: Theme.of(context).dividerColor,
                      ),
                      ListTile(
                        title: Text(
                          AppStrings.delivery.tr,
                          style:
                              StylesManager().getMediumStyle(fontSize: 15.sp),
                        ),
                        trailing: Text(
                          '  SDG  ${double.parse(3000.toString())}',
                          style:
                              StylesManager().getMediumStyle(fontSize: 15.sp),
                        ),
                      ),
                      Divider(
                        color: Theme.of(context).dividerColor,
                      ),
                      ListTile(
                        title: Text(
                          AppStrings.total.tr,
                          style:
                              StylesManager().getMediumStyle(fontSize: 15.sp),
                        ),
                        trailing: Text(
                          '  SDG  ${double.parse((3000 + controller.totalPrice).toString())}',
                          style:
                              StylesManager().getMediumStyle(fontSize: 15.sp),
                        ),
                      ),
                    ],
                  ),
                ),
          bottomSheet: controller.cartProductModel.isEmpty
              ? const SizedBox()
              : Container(
                  padding:
                      EdgeInsets.only(bottom: 13.h, right: 13.w, left: 13.w),
                  color: Theme.of(context).scaffoldBackgroundColor,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      ElevatedButton.icon(
                          label: const Icon(
                            Icons.forward,
                            size: 35,
                          ),
                          style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15)),
                              padding: EdgeInsets.symmetric(
                                  horizontal: 20.w, vertical: 8.h)),
                          onPressed: () {},
                          icon: Text(
                            'Order Now ',
                            style:
                                StylesManager().getMediumStyle(fontSize: 15.sp),
                          )),
                    ],
                  ),
                )),
    );
  }
}
