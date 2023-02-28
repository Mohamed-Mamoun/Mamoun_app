import 'dart:io';

import 'package:advance_course/Presentation/Home/home_view.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';

class LoginViewModel extends GetxController {
  //
  final emailCNTL = TextEditingController();
  final passCNTL = TextEditingController();
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
  //

  Future signInMethod(String email, String password) async {
    try {
      buttonCNTL.start();
      await auth
          .signInWithEmailAndPassword(email: email, password: password)
          .then((value) => buttonCNTL.reset());

      Get.offAll(() => const HomeView(), transition: Transition.cupertino);

      update();
    } on FirebaseAuthException catch (e) {
      if (Platform.isAndroid) {
        switch (e.message) {
          case 'There is no user record corresponding to this identifier. The user may have been deleted.':
            EasyLoading.showError('User Not Found',
                dismissOnTap: true, duration: const Duration(seconds: 5));
            emailCNTL.clear();
            passCNTL.clear();
            buttonCNTL.reset();
            update();
            break;
          // ....................................... //
          case 'The password is invalid or the user does not have a password.':
            EasyLoading.showError('wrong Password',
                duration: const Duration(seconds: 5));
            passCNTL.clear();
            buttonCNTL.reset();
            update();
            break;
          // ......................................... //
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
          // ......................................... //
          default:
            EasyLoading.showError('email or Password is not correct',
                dismissOnTap: true, duration: const Duration(seconds: 5));
            buttonCNTL.reset();
        }
        update();
      }
      update();
    }
    update();
  }
}
