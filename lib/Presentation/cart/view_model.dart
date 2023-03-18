import 'package:advance_course/Services/database_services.dart';
import 'package:advance_course/data/models/models.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';

class CartViewModel extends GetxController {
  CartViewModel() {
    getAllProduct();
  }

  var addressCNTL = TextEditingController();
  int currentStep = 0;
  var formKey = GlobalKey<FormState>();
  var formKey2 = GlobalKey<FormState>();
  var phoneCNTL = TextEditingController();
  final buttonCNTL = RoundedLoadingButtonController();
  double totalPrice = 0.0;

  List<CartProductModel> _cartProductModel = [];
  final ValueNotifier<bool> _loadingNotifier = ValueNotifier(false);

  ValueNotifier<bool> get loadingNotifier => _loadingNotifier;

  List<CartProductModel> get cartProductModel => _cartProductModel;

  void changeStepIndex(int index) {
    currentStep = index;
    update();
  }

//  Stepper Logic
  // void nextStep() {
  //   switch (currentStep) {
  //     case 0:
  //       {
  //         if (formKey.currentState!.validate()) currentStep++;
  //         break;
  //       }
  //     case 1:
  //       {
  //         if (formKey2.currentState!.validate()) currentStep++;
  //         break;
  //       }
  //     case 2:
  //       {
  //         if (formKey.currentState!.validate()) {
  //           if (formKey2.currentState.validate()) {
  //             confirmDialog();
  //             update();
  //           } else {
  //             EasyLoading.showToast(
  //                 'Make Sure To wrire Phone Number and address'.tr,
  //                 toastPosition: EasyLoadingToastPosition.bottom,
  //                 dismissOnTap: true,
  //                 duration: const Duration(seconds: 5));
  //           }
  //         } else {
  //           EasyLoading.showToast(
  //               'Make Sure To wrire Phone Number and address'.tr,
  //               toastPosition: EasyLoadingToastPosition.bottom,
  //               dismissOnTap: true,
  //               duration: const Duration(seconds: 5));
  //         }
  //       }
  //   }
  //   update();
  // }

// Function To Get all Products from Local Database
  void getAllProduct() async {
    _loadingNotifier.value = true;
    var dbHelper = CartDatabaseHelper.db;
    _cartProductModel = await dbHelper.getAllProduct();
    _loadingNotifier.value = false;
    getTotalPrice();
    update();
  }

// Function To add  Products To Local Database
  void addProduct(CartProductModel cartProductModel) async {
    for (int i = 0; i < _cartProductModel.length; i++) {
      if (_cartProductModel[i].productId == cartProductModel.productId) {
        EasyLoading.showSuccess('Product already added To Cart',
            duration: const Duration(seconds: 3));

        update();
        return;
      }
    }
    var dbHelper = CartDatabaseHelper.db;
    await dbHelper.insert(cartProductModel);
    _cartProductModel.add(cartProductModel);
    EasyLoading.showSuccess('Product added To Cart'.tr,
        duration: const Duration(seconds: 3));
    totalPrice += (double.parse(cartProductModel.price.toString()) *
        cartProductModel.quantity!);
    update();
  }

//  Function To delete  Products from Local Database
  void deleteProduct(CartProductModel cartProductModel) async {
    totalPrice -=
        (double.parse(cartProductModel.price!) * cartProductModel.quantity!);
    var dbHelper = CartDatabaseHelper.db;
    await dbHelper.delete(cartProductModel);
    _cartProductModel.remove(cartProductModel);
    update();
  }

//  Function To increase Products quantity
  void increaseQuantity(int index) {
    if (_cartProductModel[index].quantity! >= 10) return;
    _cartProductModel[index].quantity! + 1;
    totalPrice += (double.parse(_cartProductModel[index].price!));
    update();
  }

// Function To decrease Products quantity
  void decreaseQuantity(int index) {
    if (_cartProductModel[index].quantity! <= 1) return;
    _cartProductModel[index].quantity! - 1;
    totalPrice -= (double.parse(_cartProductModel[index].price!));
    update();
  }

  // Function To Calculate Total Price
  getTotalPrice() {
    for (int i = 0; i < _cartProductModel.length; i++) {
      if (_cartProductModel.isEmpty) return totalPrice = 0.0;
      totalPrice += (double.parse(_cartProductModel[i].price!) *
          _cartProductModel[i].quantity!);
    }
    update();
  }
}
