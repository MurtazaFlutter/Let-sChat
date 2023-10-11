import 'dart:convert';

class SignUp {
  final String username;
  final String email;

  SignUp({
    required this.username,
    required this.email,
  });

  Map<String, dynamic> toMap() {
    return {
      'username': username,
      'email': email,
    };
  }

  factory SignUp.fromMap(Map<String, dynamic> map) {
    return SignUp(
      username: map['username'],
      email: map['email'],
    );
  }

  String toJson() => json.encode(toMap());

  factory SignUp.fromJson(String source) => SignUp.fromMap(json.decode(source));
}
