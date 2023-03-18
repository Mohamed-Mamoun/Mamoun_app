import 'dart:io';

import 'package:advance_course/Presentation/widgets/bottom_sheet.dart';
import 'package:advance_course/data/models/models.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';

class OrderViewMode extends GetxController {
  final addressCNTL = TextEditingController();
  final buttonCNTL = RoundedLoadingButtonController();
  int currentStep = 0;
  final deleviryNumberCNTL = TextEditingController();
  String? downloadUrl;
  final formKey = GlobalKey<FormState>();
  var formKey2 = GlobalKey<FormState>();
  var formKey3 = GlobalKey<FormState>();
  File? image;
  String? imagePath;
  final medicineNameCNTL = TextEditingController();
  final nameCNTL = TextEditingController();
  final phoneCNTL = TextEditingController();
  XFile? pickedImage;
  final FirebaseStorage storage = FirebaseStorage.instance;

  final CollectionReference _collectionReference =
      FirebaseFirestore.instance.collection('orders');

  final ImagePicker _picker = ImagePicker();

  void changeStepIndex(int index) {
    currentStep = index;
    update();
  }

//  Stepper Logic
  void nextStep() {
    switch (currentStep) {
      case 0:
        {
          if (formKey2.currentState!.validate()) currentStep++;
          break;
        }
      case 1:
        {
          if (formKey3.currentState!.validate()) currentStep++;
          break;
        }
      case 2:
        {
          if (formKey2.currentState!.validate()) {
            if (formKey3.currentState!.validate()) {
              showSuccessModelSheet();
            } else {
              EasyLoading.showToast(
                  'Make Sure To wrire Phone Number and address'.tr,
                  toastPosition: EasyLoadingToastPosition.bottom,
                  dismissOnTap: true,
                  duration: const Duration(seconds: 5));
            }
          } else {
            EasyLoading.showToast(
                'Make Sure To wrire Phone Number and address'.tr,
                toastPosition: EasyLoadingToastPosition.bottom,
                dismissOnTap: true,
                duration: const Duration(seconds: 5));
          }
        }
    }
    update();
  }

  // Function To Pick an image
  Future pickImages(ImageSource source) async {
    pickedImage = await _picker.pickImage(source: source);
    image = File(pickedImage!.path);
    imagePath = basename(pickedImage!.path);
    EasyLoading.showToast('Image Selected',
        toastPosition: EasyLoadingToastPosition.bottom);
    update();
  }

  // ****************************************************

  // Function To Upload Image To Storage
  Future<bool> uploudImage() async {
    try {
      var ref = storage.ref().child('orders/$imagePath');
      await ref.putFile(image!);
      await ref.getDownloadURL().then((value) {
        downloadUrl = value;
      });
      return true;
    } catch (e) {
      EasyLoading.showError('Order Failed');
      return false;
    }
  }

  // ****************************************************

  Future addOrder() async {
    try {
      buttonCNTL.start();
      await uploudImage().then((value) async {
        if (value = true) {
          await _collectionReference.add(OrderModel(
                  name: nameCNTL.text,
                  products: [],
                  number: phoneCNTL.text,
                  medicineName: medicineNameCNTL.text,
                  orderImage: downloadUrl,
                  orderTime: DateTime.now().toString())
              .toJson());
          buttonCNTL.stop();
          EasyLoading.showSuccess('You Order is added Successuly');
          image = null;
          nameCNTL.clear();
          phoneCNTL.clear();
          medicineNameCNTL.clear();
          downloadUrl = null;
          imagePath = null;
          buttonCNTL.stop();
          buttonCNTL.reset();
          update();
        } else {
          buttonCNTL.stop();
          EasyLoading.showError(
              'Error your order Failed Check Internet Connection');
        }
      });
    } catch (e) {
      buttonCNTL.stop();
      EasyLoading.showError('Error Check Internet Connection');
      update();
    }
  }

// ****************************************************
  addOrderFromCart() async {
    try {} catch (e) {
      print(e.toString());
    }
  }
}
