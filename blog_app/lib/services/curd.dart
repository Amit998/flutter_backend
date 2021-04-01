import 'package:flutter/material.dart';

import 'package:cloud_firestore/cloud_firestore.dart';

class CURDModel {
  Future<void> addData(blogData) async {
    Firestore.instance.collection("blogs").add(blogData).catchError((e) {
      print(e);
    });
  }
}
