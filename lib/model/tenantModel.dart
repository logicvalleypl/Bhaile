// To parse this JSON data, do
//
//     final tenantModel = tenantModelFromJson(jsonString);

import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

TenantModel tenantModelFromJson(String str) =>
    TenantModel.fromJson(json.decode(str));

String tenantModelToJson(TenantModel data) => json.encode(data.toJson());

class TenantModel {
  TenantModel({
    required this.id,
    required this.userType,
    required this.zipCode,
    required this.address,
    required this.firstName,
    required this.lastName,
    required this.phone,
    required this.email,
    required this.photo,
    required this.token,
  });

  final int id;
  final String userType;
  final dynamic zipCode;
  final dynamic address;
  final String firstName;
  final String lastName;
  final String phone;
  final String email;
  final String photo;
  final String token;

  factory TenantModel.fromJson(Map<String, dynamic> json) => TenantModel(
        id: json['user']["id"] ?? "",
        token: json['token'],
        userType: json['user']["user_type"],
        zipCode: json['user']["zip_code"] ?? "",
        address: json['user']["address"] ?? "",
        firstName: json['user']["first_name"] ?? "",
        lastName: json['user']["last_name"] ?? "",
        phone: json['user']["phone"] ?? "",
        email: json['user']["email"] ?? "",
        photo: json['user']["photo"] ?? "",
      );
  factory TenantModel.fromSharedPrefs(Map<String, dynamic> json) => TenantModel(
        id: json["id"],
        token: json['token'],
        userType: json["user_type"],
        zipCode: json["zip_code"],
        address: json["address"],
        firstName: json["first_name"],
        lastName: json["last_name"],
        phone: json["phone"],
        email: json["email"],
        photo: json["photo"],
      );
  factory TenantModel.forProfile(Map<String, dynamic> json, String tokenn) =>
      TenantModel(
        id: json["id"] ?? "",
        token: tokenn,
        userType: json["user_type"] ?? "",
        zipCode: json["zip_code"] ?? "",
        address: json["address"] ?? "",
        firstName: json["first_name"] ?? "",
        lastName: json["last_name"] ?? "",
        phone: json["phone"] ?? "",
        email: json["email"] ?? "",
        photo: json["photo"] ?? "",
      );
  Map<String, dynamic> toJson() => {
        'token': token,
        "id": id,
        "user_type": userType,
        "zip_code": zipCode,
        "address": address,
        "first_name": firstName,
        "last_name": lastName,
        "phone": phone,
        "email": email,
        "photo": photo,
      };

  Future<void> save() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('type', 'tenant');
    await prefs.setString('user', jsonEncode(this.toJson()));
  }

  static Future<TenantModel?> get() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    if (prefs.containsKey('user')) {
      var map = jsonDecode(prefs.getString('user')!);
      return TenantModel.fromSharedPrefs(map);
    } else {
      return null;
    }
  }
}
