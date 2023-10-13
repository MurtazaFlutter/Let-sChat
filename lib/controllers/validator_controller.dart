import 'package:lets_chat/utils/exports.dart';

class ValidatorNotifier extends ChangeNotifier {
  String _loginEmail = "";
  String _forgotEmail = "";
  String _signUpEmail = "";
  String _loginPassword = "";
  String _signupPassword = "";
  String _phoneNumber = "";
  String _username = "";
  String _confirmPassword = "";
  bool _loginObsecureText = true;
  bool _obscurePasswordText1 = true;
  bool _obscurePasswordText2 = true;

  String get loginemail => _loginEmail;
  String get signUpEmail => _signUpEmail;
  String get forgotEmail => _forgotEmail;
  String get password => _loginPassword;
  String get signupPassword => _signupPassword;
  String get phoneNumber => _phoneNumber;
  String get username => _username;
  String get confPass => _confirmPassword;
  bool get loginObsecureText => _loginObsecureText;
  bool get obscurePasswordText1 => _obscurePasswordText1;
  bool get obscurePasswordText2 => _obscurePasswordText2;

  String _errorLoginEmail = "";
  String _errorSignUpEmail = "";
  String _errorForgotEmail = "";
  String _errorPass = "";
  String _errorPhoneNumber = "";
  String _errorUsername = "";
  String _errorConfirmPassword = "";

  String get errorLoginEmail => _errorLoginEmail;
  String get errorSignupEmail => _errorSignUpEmail;
  String get errorForgotEmail => _errorForgotEmail;
  String get errorPass => _errorPass;
  String get errorPhoneNumber => _errorPhoneNumber;
  String get errorUsername => _errorUsername;
  String get errorConfirmPassword => _errorConfirmPassword;

  void updateLoginEmail(String email) {
    _loginEmail = email;
    validateLoginEmail();
  }

  void updateSignUpEmail(String email) {
    _signUpEmail = email;
    validateSignUpEmail();
  }

  void updateForgotEmail(String email) {
    _forgotEmail = email;
    validateSignUpEmail();
  }

  void updateLoginPassword(String password) {
    _loginPassword = password;
    validatePassword();
  }

  void updatePassword(String password) {
    _signupPassword = password;
    validatePassword();
  }

  void updatePhoneNumber(String phoneNumber) {
    _phoneNumber = phoneNumber;
    validatePhoneNumber();
  }

  void updateUsername(String username) {
    _username = username;
    validateUsername();
  }

  void updateConfirmPassword(String confirmPassword) {
    _confirmPassword = confirmPassword;
    validateConfirmPassword();
  }

  void validateLoginEmail() {
    if (_loginEmail.isEmpty) {
      _errorLoginEmail = "Email is required";
    } else if (!isLoginValidEmail(_loginEmail)) {
      _errorLoginEmail = "Invalid email format";
    } else {
      _errorLoginEmail = "";
    }
    notifyListeners();
  }

  void validateSignUpEmail() {
    if (_signUpEmail.isEmpty) {
      _errorSignUpEmail = "Email is required";
    } else if (!isSignupValidEmail(_signUpEmail)) {
      _errorSignUpEmail = "Invalid email format";
    } else {
      _errorSignUpEmail = "";
    }
    notifyListeners();
  }

  void validateForgotEmail() {
    if (_forgotEmail.isEmpty) {
      _errorForgotEmail = "Email is required";
    } else if (!isSignupValidEmail(_signUpEmail)) {
      _forgotEmail = "Invalid email format";
    } else {
      _forgotEmail = "";
    }
    notifyListeners();
  }

  void validateloginPassword() {
    if (_loginPassword.isEmpty) {
      _errorPass = "Password is required";
    } else if (_loginPassword.length < 6) {
      _errorPass = "Password should be at least 6 characters";
    } else {
      _errorPass = "";
    }
    notifyListeners();
  }

  void validatePassword() {
    if (_signupPassword.isEmpty) {
      _errorPass = "Password is required";
    } else if (_signupPassword.length < 6) {
      _errorPass = "Password should be at least 6 characters";
    } else {
      _errorPass = "";
    }
    notifyListeners();
  }

  void validatePhoneNumber() {
    if (_phoneNumber.isEmpty) {
      _errorPhoneNumber = "Phone number is required";
    } else {
      _errorPhoneNumber = "";
    }
    notifyListeners();
  }

  void validateUsername() {
    if (_username.isEmpty) {
      _errorUsername = "Username is required";
    } else {
      _errorUsername = "";
    }
    notifyListeners();
  }

  void validateConfirmPassword() {
    if (_confirmPassword.isEmpty) {
      _errorConfirmPassword = "Confirm password is required";
    } else if (_confirmPassword != password) {
      _errorConfirmPassword = "Passwords do not match";
    } else {
      _errorConfirmPassword = "";
    }
    notifyListeners();
  }

  bool isLoginValidEmail(String email) {
    const pattern = r'^[\w-]+(\.[\w-]+)*@[\w-]+(\.[\w-]+)+$';
    final regExp = RegExp(pattern);
    return regExp.hasMatch(email);
  }

  bool isSignupValidEmail(String email) {
    const pattern = r'^[\w-]+(\.[\w-]+)*@[\w-]+(\.[\w-]+)+$';
    final regExp = RegExp(pattern);
    return regExp.hasMatch(email);
  }

  bool isForgotValidEmail(String email) {
    const pattern = r'^[\w-]+(\.[\w-]+)*@[\w-]+(\.[\w-]+)+$';
    final regExp = RegExp(pattern);
    return regExp.hasMatch(email);
  }

  void togglePasswordVisibility1() {
    _obscurePasswordText1 = !_obscurePasswordText1;
    notifyListeners();
  }

  void togglePasswordVisibility2() {
    _obscurePasswordText2 = !_obscurePasswordText2;
    notifyListeners();
  }

  void loginPasswordVisibility() {
    _loginObsecureText = !_loginObsecureText;
    notifyListeners();
  }
}
