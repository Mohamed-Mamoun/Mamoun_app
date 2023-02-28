import 'package:advance_course/Presentation/login/login.dart';
import 'package:advance_course/data/models/models.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

class HomeViewModel extends GetxController {
  final CollectionReference _productsCollection =
      FirebaseFirestore.instance.collection('Products');

  final List<ProductModel> _productsModel = [
    ProductModel(
        productImage: 'assets/images/1.png',
        productName: 'CeraVe Renewing SA Foot',
        productId: '65',
        productPrice: '35',
        category: 'cosmatics',
        productDesc: '....'),
    ProductModel(
        productImage: 'assets/images/2.png',
        productName: 'Alpha Arbutin 2% + HA',
        productId: '66',
        productPrice: '35',
        category: 'cosmatics',
        productDesc: '....'),
    ProductModel(
        productImage: 'assets/images/3.png',
        productName: 'BLEMISH CONTROL CLEANSER',
        productId: '68',
        productPrice: '35',
        category: 'cosmatics',
        productDesc: '....'),
    ProductModel(
        productImage: 'assets/images/4.png',
        productName: 'BLEMISH CONTROL GEL',
        productId: '69',
        productPrice: '35',
        category: 'cosmatics',
        productDesc: '....'),
  ];
  List<ProductModel> get productsModel => _productsModel;

  final _loadingNotifier = false.obs;
  RxBool get loadingNotifier => _loadingNotifier;

  // HomeViewModel() {
  //   getProducts();
  // }

  /////////////// Signout Function ///////////////
  void signOut() async {
    try {
      await FirebaseAuth.instance.signOut();
      Get.offAll(() => const LoginView());
      update();
    } catch (e) {
      EasyLoading.showError('Sign out Fails');
    }
  }

  /////////////// Get Products Function ///////////////
  Future getProducts() async {
    _loadingNotifier.value = true;
    await _productsCollection.get().then((value) {
      for (int i = 0; i < value.docs.length; i++) {
        _productsModel.add(ProductModel.fromJson(value.docs[i].data()));
        _loadingNotifier.value = false;
      }
      update();
      return _productsModel;
    });
    update();
  }
}
