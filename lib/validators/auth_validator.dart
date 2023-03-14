import 'package:poker_fish/resources/string_constants.dart';

class AuthValidator {
  final String _email;
  final String _password;

  AuthValidator({required String email, required String password})
      : _email = email,
        _password = password;

  Map<String, String> getValidationResults() {
    if (_email.isEmpty) {
      return {StringConstants.email.value: 'Email is required field'};
    } else if (_password.isEmpty) {
      return {StringConstants.password.value: 'Password is required field'};
    } else if (_password.length < 8) {
      return {
        StringConstants.password.value:
            'Password must contain at least 8 characters'
      };
    }
    //else if () {
    // email format
    //}
    return {};
  }

  Map<String, String> getErrorMessage(String firebaseErrorMsg) {
    return {StringConstants.email.value: firebaseErrorMsg};
  }
}
