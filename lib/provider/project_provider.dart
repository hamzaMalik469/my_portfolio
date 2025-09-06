import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/project_model.dart';

class ProjectProvider with ChangeNotifier {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  List<ProjectModel> _projects = [];
  bool _isLoading = false;

  List<ProjectModel> get projects => _projects;
  bool get isLoading => _isLoading;

  Future<void> fetchProjects() async {
    _isLoading = true;
    notifyListeners();

    try {
      final snapshot = await _firestore.collection('projects').get();
      _projects = snapshot.docs.map((doc) {
        return ProjectModel.fromMap(doc.data());
      }).toList();
    } catch (e) {
      debugPrint("Error fetching projects: $e");
    }

    _isLoading = false;
    notifyListeners();
  }
}
