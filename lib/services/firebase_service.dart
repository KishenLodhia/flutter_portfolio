import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_portfolio/model/project.dart';

class FirestoreService {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  Stream<List<Project>> getProjects() {
    return _db.collection('projects').snapshots().map((snapshot) {
      return snapshot.docs.map((document) {
        return Project.fromMap(document.data());
      }).toList();
    });
  }
}
