import 'dart:io';

import 'package:advance_course/data/models/models.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';

class OrderViewMode extends GetxController {
  final CollectionReference _collectionReference =
      FirebaseFirestore.instance.collection('orders');
  final FirebaseStorage storage = FirebaseStorage.instance;

  final buttonCNTL = RoundedLoadingButtonController();
  final formKey = GlobalKey<FormState>();
  final nameCNTL = TextEditingController();
  final phoneCNTL = TextEditingController();
  final medicineNameCNTL = TextEditingController();
  String? imagePath;
  final ImagePicker _picker = ImagePicker();
  XFile? pickedImage;
  File? image;
  String? downloadUrl;

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
      uploudImage().then((value) {
        if (value = true) {
          _collectionReference.add(OrderModel(
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
        }
        buttonCNTL.stop();
        EasyLoading.showError(
            'Error your order Failed Check Internet Connection');
      });
    } catch (e) {
      buttonCNTL.stop();
      EasyLoading.showError('Error Check Internet Connection');
      update();
    }
  }
}
