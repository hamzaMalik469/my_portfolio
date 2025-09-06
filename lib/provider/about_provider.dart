import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:my_portfolio/models/about_model.dart';

class AboutProvider with ChangeNotifier {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  List<AboutModel> _abouts = [];
  bool _isLoading = false;

  List<AboutModel> get about => _abouts;
  bool get isLoading => _isLoading;

  Future<void> fetchAbout() async {
    _isLoading = true;
    notifyListeners();

    try {
      final snapshot = await _firestore.collection('about').get();
      _abouts = snapshot.docs.map((doc) {
        return AboutModel.fromMap(doc.data());
      }).toList();
    } catch (e) {
      debugPrint("Error fetching about: $e");
    }

    _isLoading = false;
    notifyListeners();
  }
}
