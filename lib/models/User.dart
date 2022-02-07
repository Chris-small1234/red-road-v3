import 'dart:convert';

class User{
  String? email;
  List<Map>? scores;

  User({
    this.email,
    this.scores
  });


  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      email: json['email'],
      scores: json['scores']
    );
  }
}