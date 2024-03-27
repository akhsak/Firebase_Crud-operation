import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:crud_firebase/model/donor_model.dart';
import 'package:firebase_storage/firebase_storage.dart';

class FirebaseService {
  String collectionRef = 'donors';
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  FirebaseStorage storage = FirebaseStorage.instance;

  late final CollectionReference<DonorModel> bloodRef;

  FirebaseService() {
    bloodRef = firestore.collection(collectionRef).withConverter<DonorModel>(
          fromFirestore: (snapshot, options) =>
              DonorModel.fromJson(snapshot.data()!, snapshot.id),
          toFirestore: (value, options) => value.toJson(),
        );
  }
}
