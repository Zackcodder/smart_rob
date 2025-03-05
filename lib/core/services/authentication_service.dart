import 'dart:convert';
import 'package:http/http.dart' as https;

class AuthService {
  final String baseUrl = 'https://api.paypointapp.africa/api';

  ///Register Step One
  Future<Map<String, dynamic>> registerStepOne({
    required String firstName,
    required String lastName,
    required String phoneNumber,
    required String email,
  }) async {
    try {
      final response = await https.post(
        Uri.parse('$baseUrl/auth/register/step-one'),
        body: {
          'first_name': firstName,
          'last_name': lastName,
          'phone_number': phoneNumber,
          'email': email,
        },
      );
      var result = jsonDecode(response.body);

      if (response.statusCode == 200) {
        return {
          'success': true,
          'token': result['data']['access_token'],
        };
      } else {
        return {'success': false, 'message': _getErrorMessage(response)};
      }
    } catch (e) {
      return {'success': false, 'message': 'Something went wrong: $e'};
    }
  }

  ///Register Step Two
  Future<Map<String, dynamic>> registerStepTwo({
    required String token,
    required String password,
    required String passwordConfirmation,
    String? username,
    String? referral,
  }) async {
    try {
      final response = await https.post(
        Uri.parse('$baseUrl/auth/register/profile_level_1'),
        headers: {
          'Authorization': 'Bearer $token',
          'Content-Type': 'application/json',
        },
        body: jsonEncode({
          'password': password,
          'password_confirmation': passwordConfirmation,
          'username': username ?? '',
          'referral': referral ?? '',
        }),
      );
      if (response.statusCode == 200) {
        return {
          'success': true,
          'message': 'Profile Updated Successfully'
        };
      } else {
        return {'success': false, 'message': _getErrorMessage(response)};
      }
    } catch (e) {
      return {'success': false, 'message': 'Something went wrong: $e'};
    }
  }

  ///Extract error messages from the response
  String _getErrorMessage(https.Response response) {
    try {
      final decoded = jsonDecode(response.body);
      if (decoded.containsKey('message')) {
        return decoded['message'];
      }
      return 'Unknown error occurred.';
    } catch (_) {
      return 'Invalid server response.';
    }
  }
}
