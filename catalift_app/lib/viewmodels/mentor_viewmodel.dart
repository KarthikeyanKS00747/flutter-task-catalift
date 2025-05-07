import 'package:flutter/material.dart';
import 'package:catalift_app/models/mentor_model.dart';
// import 'package:catalift_app/data/mentors_data.dart';

class MentorViewModel extends ChangeNotifier {
  List<MentorModel> _mentors = [];
  List<MentorModel> _myMentors = [];
  bool _isExploreSelected = false;
  String _searchQuery = '';

  List<MentorModel> get mentors {
    if (_searchQuery.isEmpty) {
      return _isExploreSelected ? _mentors : _myMentors;
    } else {
      return (_isExploreSelected ? _mentors : _myMentors)
          .where((mentor) => mentor.name.toLowerCase().contains(_searchQuery.toLowerCase()))
          .toList();
    }
  }

  bool get isExploreSelected => _isExploreSelected;

  void toggleExplore(bool value) {
    _isExploreSelected = value;
    notifyListeners();
  }

  void setSearchQuery(String query) {
    _searchQuery = query;
    notifyListeners();
  }

  void fetchMentors() {
    _mentors = [
      MentorModel(
        id: '1',
        name: 'Gaurav Samant1',
        imageUrl: 'https://avatar.iran.liara.run/public/boy?username=Ash',
        rating: 4.9,
        sector: 'IT Sector',
        experienceYears: 4,
        domain: 'Business Administration',
        reviewsCount: 175,
        description: 'Strategy Manager @CEO Office | Ex-eBay & L&T | MDI Gurgaon . ESCP Europe | 32+ National Case Comps Podiums',
        compatibility: 98,
      ),
      MentorModel(
        id: '2',
        name: 'Bill Forger',
        imageUrl: 'https://avatar.iran.liara.run/public/boy?username=Ash',
        rating: 4.9,
        sector: 'IT Sector',
        experienceYears: 4,
        domain: 'Business Administration',
        reviewsCount: 175,
        description: 'Strategy Manager @CEO Office | Ex-eBay & L&T | MDI Gurgaon . ESCP Europe | 32+ National Case Comps Podiums',
        compatibility: 82,
      ),
      MentorModel(
        id: '3',
        name: 'Dennis Ritchie',
        imageUrl: 'https://avatar.iran.liara.run/public/boy?username=Ash',
        rating: 4.9,
        sector: 'IT Sector',
        experienceYears: 4,
        domain: 'Business Administration',
        reviewsCount: 175,
        description: 'Strategy Manager @CEO Office | Ex-eBay & L&T | MDI Gurgaon . ESCP Europe | 32+ National Case Comps Podiums',
        compatibility: 75,
      ),
    ];

    _myMentors = [
      _mentors[0],
    ];

    notifyListeners();
  }
}