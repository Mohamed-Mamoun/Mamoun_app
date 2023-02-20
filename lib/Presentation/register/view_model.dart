import 'dart:io';

import 'package:advance_course/Presentation/login/login.dart';
import 'package:advance_course/Services/firestore_sevices.dart';
import 'package:advance_course/data/models/models.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';
import 'package:firebase_auth/firebase_auth.dart';

class RegisterViewModel extends GetxController {
  final emailCNTL = TextEditingController();
  final passCNTL = TextEditingController();
  final phoneCNTL = TextEditingController();
  final nameCNTL = TextEditingController();
  final formKey = GlobalKey<FormState>();
  final buttonCNTL = RoundedLoadingButtonController();
  final auth = FirebaseAuth.instance;
  //
  IconData suffix = Icons.visibility_outlined;
  bool isPasswordShow = true;
  void changePasswordVisib() {
    isPasswordShow = !isPasswordShow;
    suffix = isPasswordShow ? Icons.visibility_off : Icons.visibility_outlined;
    update();
  }

  // create account with Email and Password
  Future signUpMethod(UserModel model) async {
    try {
      buttonCNTL.start();
      await auth
          .createUserWithEmailAndPassword(
              email: model.email!.trim(), password: model.pass!.trim())
          .whenComplete(() => FireStoreServices().addUserToDatabase(model));
      buttonCNTL.reset();
      await Future.delayed(const Duration(seconds: 2));
      EasyLoading.showSuccess("account Created Successfuly");
      Get.to(() => const LoginView(), transition: Transition.cupertino);
    } on FirebaseAuthException catch (e) {
      if (Platform.isAndroid) {
        switch (e.message) {
          case 'A network error (such as timeout, interrupted connection or unreachable host) has occurred.':
            EasyLoading.show(
                indicator: const Icon(
                  Icons.wifi_off,
                  size: 35,
                  color: Colors.white,
                ),
                dismissOnTap: true,
                status: '    Network Error      ');
            buttonCNTL.reset();
            update();
            break;

          case 'The email address is badly formatted.':
            EasyLoading.showError('Email Format is not correct',
                duration: const Duration(seconds: 5));
            emailCNTL.clear();
            buttonCNTL.reset();
        }
      }
      buttonCNTL.reset();
      Get.snackbar('Error', e.toString());
    }
  }
}
