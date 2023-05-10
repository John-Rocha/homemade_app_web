import 'dart:convert';

class AuthModel {
  final String accessToken;
  final String refreshToken;
  final String type;

  AuthModel({
    required this.accessToken,
    required this.refreshToken,
    required this.type,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'access_token': accessToken,
      'refresh_token': refreshToken,
      'type': type,
    };
  }

  factory AuthModel.fromMap(Map<String, dynamic> map) {
    return AuthModel(
      accessToken: map['access_token'],
      refreshToken: map['refresh_token'],
      type: map['type'],
    );
  }

  String toJson() => json.encode(toMap());

  factory AuthModel.fromJson(String source) =>
      AuthModel.fromMap(json.decode(source));
}
