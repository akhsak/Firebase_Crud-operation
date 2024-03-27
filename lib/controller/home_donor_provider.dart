import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:crud_firebase/model/donor_model.dart';
import 'package:crud_firebase/service/donor_service.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

class DonorProvider extends ChangeNotifier {
  final FirebaseService _firebaseService = FirebaseService();
  String uniquename = DateTime.now().microsecondsSinceEpoch.toString();
  String downloadurl = '';

  Stream<QuerySnapshot<DonorModel>> getData() {
    return _firebaseService.bloodRef.snapshots();
  }

  void addDonor(DonorModel student) async {
    await _firebaseService.bloodRef.add(student);
    notifyListeners();
  }

  void deleteStudent(String id) async {
    await _firebaseService.bloodRef.doc(id).delete();
    notifyListeners();
  }

  void updateDonor(String id, DonorModel student) async {
    await _firebaseService.bloodRef.doc(id).update(student.toJson());
    notifyListeners();
  }

  imageAdder(image) async {
  Reference folder = _firebaseService.storage.ref().child('images');
  Reference images = folder.child("$uniquename.jpg");
  try {
   await images.putFile(image);
    downloadurl = await images.getDownloadURL();
    notifyListeners();
    print(downloadurl);
  } catch (e) {
    throw Exception(e);
  }}
}
