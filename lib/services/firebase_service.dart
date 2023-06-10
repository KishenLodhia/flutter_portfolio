import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_portfolio/model/achievement.dart';
import 'package:flutter_portfolio/model/blog.dart';
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

  Stream<List<Achievement>> getAchievements() {
    return _db.collection('achievements').snapshots().map((snapshot) {
      return snapshot.docs.map((document) {
        return Achievement.fromMap(document.data());
      }).toList();
    });
  }

  Stream<List<Blog>> getBlogs() {
    return _db.collection('blogs').snapshots().map((snapshot) {
      return snapshot.docs.map((document) {
        return Blog.fromMap(document.data());
      }).toList();
    });
  }

  void updateFile(Project project) {
    _db.collection('projects').doc(project.name).set(project.createMap());
  }

  void createProject(Project project) {
    _db.collection('projects').doc(project.name).set(project.createMap());
  }

  void deleteProject(String projectName) {
    _db.collection('projects').doc(projectName).delete();
  }
}
