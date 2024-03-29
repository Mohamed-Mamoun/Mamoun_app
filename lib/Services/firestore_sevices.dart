import 'package:advance_course/data/models/models.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';

class FireStoreServices {
  final CollectionReference<Map<String, dynamic>> _userCollection =
      FirebaseFirestore.instance.collection('Users');

  // Add User Info To DataBase
  addUserToDatabase(UserModel model) async {
    try {
      await _userCollection.doc(FirebaseAuth.instance.currentUser!.uid).set({
        'name': model.name,
        'phone_Number': model.number,
        'email': model.email
      });
    } catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
    }
  }
}
