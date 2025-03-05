import 'package:flutter/material.dart';

import '../core/services/authentication_service.dart';

class AuthProvider with ChangeNotifier {
  final AuthService _authService = AuthService();
  bool _isLoading = false;
  String? _errorMessage;

  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;

  String? _username;
  String? _referral;String? _token;

  String? get username => _username;
  String? get referral => _referral;
  String? get token => _token;

  ///Method to store token after Step One
  void setToken(String token) {
    _token = token;
    notifyListeners();
  }

  ///Method to set username
  void setUsername(String username) {
    _username = username;
    notifyListeners();
  }

  ///Method to set referral code
  void setReferral(String referral) {
    _referral = referral;
    notifyListeners();
  }
  // Step One: Register User
  Future<bool> registerStepOne({
    required String firstName,
    required String lastName,
    required String phoneNumber,
    required String email,
    required BuildContext context,
  }) async {
    _setLoading(true);

    final result = await _authService.registerStepOne(
      firstName: firstName,
      lastName: lastName,
      phoneNumber: phoneNumber,
      email: email,
    );

    _setLoading(false);

    if (result['success']) {
      // Proceed to next step
      _showSnackbar(context, "Kindly proceed to the next step", Colors.green);
      setToken(result['token']); 
      return true;
    } else {
      // Show error message
      _errorMessage = result['message'];
      _showSnackbar(context, _errorMessage!, Colors.red);
      notifyListeners();
      return false;
    }
  }

  // Step Two: Register Profile
  Future<bool> registerStepTwo({
    required String token,
    required String password,
    required String passwordConfirmation,
    required BuildContext context,
    String? username,
    String? referral,
  }) async {
    _setLoading(true);

    final result = await _authService.registerStepTwo(
      token:  _token!,
      password: password,
      passwordConfirmation: passwordConfirmation,
      username: username,
      referral: referral,
    );

    _setLoading(false);

    if (result['success']) {
      _showSnackbar(context, "Registration successful!", Colors.green);
      return true;
    } else {
      _errorMessage = result['message'];
      _showSnackbar(context, _errorMessage!, Colors.red);
      notifyListeners();
      return false;
    }
  }

  // Set loading state
  void _setLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  // Show Snackbar
  void _showSnackbar(BuildContext context, String message, Color color) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: color,
        duration: const Duration(seconds: 5),
      ),
    );
  }
}
