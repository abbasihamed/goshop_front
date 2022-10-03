import 'dart:convert';

AuthModel authModelFromJson(String str) => AuthModel.fromJson(json.decode(str));

String authModelToJson(AuthModel data) => json.encode(data.toJson());

class AuthModel {
  AuthModel({
    this.otpCode,
    this.success,
  });

  int? otpCode;
  bool? success;

  factory AuthModel.fromJson(Map<String, dynamic> json) => AuthModel(
        otpCode: json["otp_code"],
        success: json["success"],
      );

  Map<String, dynamic> toJson() => {
        "otp_code": otpCode,
        "success": success,
      };
}

TokenModel tokenModelFromJson(String str) =>
    TokenModel.fromJson(jsonDecode(str));

class TokenModel {
  String? token;

  TokenModel({this.token});

  factory TokenModel.fromJson(Map<String, dynamic> json) =>
      TokenModel(token: json['token']);
}
