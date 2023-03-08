import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class SearchViewModel extends GetxController {
  String? searchKey;
  final products =
      FirebaseFirestore.instance.collection('Products').snapshots();
  final collRef = FirebaseFirestore.instance.collection('Products');

  /////////////////////////////////////////////////
  void changeValue(String value) {
    searchKey = value;
    update();
  }
}
