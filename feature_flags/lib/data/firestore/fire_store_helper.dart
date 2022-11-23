// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cloud_firestore/cloud_firestore.dart';

class FireStoreHelper {
  final FirebaseFirestore firebaseFirestore;

  FireStoreHelper({
    required this.firebaseFirestore,
  });

  Stream<Map<String, dynamic>> getDocumentStream(
      {required String colleciton, required String document}) {
    return FirebaseFirestore.instance
        .collection('app')
        .doc('home')
        .snapshots()
        .map(
          (event) => event.data() ?? {},
        );
  }
}
