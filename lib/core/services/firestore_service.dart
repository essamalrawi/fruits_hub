import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fruits_hub/core/services/data_service.dart';

class FireStoreService implements DatabaseService {
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  @override
  Future<void> addData(
      {required String path,
      required Map<String, dynamic> data,
      String? documentId}) async {
    if (documentId != null) {
      await firestore.collection(path).doc(documentId).set(data);
    } else {
      await firestore.collection(path).add(data);
    }
  }

  @override
  Future<dynamic> getData({required String path, String? uId}) async {
    if (uId == null) {
      var data = await firestore.collection(path).doc(uId).get();
      return data.data() as Map<String, dynamic>;
    } else {
      var data = await firestore.collection(path).get();
      return data.docs.map((e) => e.data()).toList();
    }
  }

  @override
  Future<bool> checkIfDataExists(
      {required String path, required String documentId}) async {
    var data = await firestore.collection(path).doc(documentId).get();
    return data.exists;
  }
}
