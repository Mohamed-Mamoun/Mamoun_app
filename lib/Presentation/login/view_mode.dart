import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';

class LoginViewModel extends GetxController {
  //
  final emailCNTL = TextEditingController();
  final passCNTL = TextEditingController();
  final formKey = GlobalKey<FormState>();
  final buttonCNTL = RoundedLoadingButtonController();
  //
  IconData suffix = Icons.visibility_outlined;
  bool isPasswordShow = true;
  void changePasswordVisib() {
    isPasswordShow = !isPasswordShow;
    suffix = isPasswordShow ? Icons.visibility_off : Icons.visibility_outlined;
    update();
  }
}
