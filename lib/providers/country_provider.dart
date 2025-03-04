import 'package:flutter/material.dart';
import '../models/country_model.dart';

class CountryProvider with ChangeNotifier {
  List<Country> _countries = [
    Country(name: "Nigeria", flag: "🇳🇬"),
    Country(name: "Ghana", flag: "🇬🇭"),
    Country(name: "Kenya", flag: "🇰🇪"),
    Country(name: "United States", flag: "🇺🇸"),
    Country(name: "United Kingdom", flag: "🇬🇧"),
    // Add more countries...
  ];

  String _selectedCountry = "";
  String get selectedCountry => _selectedCountry;
  List<Country> get countries => _countries;

  void selectCountry(String country) {
    _selectedCountry = country;
    notifyListeners();
  }

  List<Country> searchCountries(String query) {
    return _countries.where((c) => c.name.toLowerCase().contains(query.toLowerCase())).toList();
  }
}
