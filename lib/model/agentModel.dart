// To parse this JSON data, do
//
//     final agentModel = agentModelFromJson(jsonString);

import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class AgentModel {
  AgentModel({
    this.token = '',
    required this.id,
    required this.userType,
    required this.logo,
    required this.companyName,
    required this.registrationNumber,
    required this.zipCode,
    required this.address,
    required this.firstName,
    required this.lastName,
    required this.phone,
    required this.email,
    required this.photo,
  });
  final String token;
  final int id;
  final String userType;
  final String logo;
  final dynamic companyName;
  final dynamic registrationNumber;
  final dynamic zipCode;
  final dynamic address;
  final String firstName;
  final String lastName;
  final String phone;
  final String email;
  final String photo;

  factory AgentModel.fromJson(
    Map<String, dynamic> json,
  ) =>
      AgentModel(
        id: json['user']["id"] ?? "",
        token: json['token'],
        userType: json['user']["user_type"],
        logo: json['user']["logo"] ?? "",
        companyName: json['user']["company_name"] ?? "",
        registrationNumber: json['user']["registration_number"] ?? "",
        zipCode: json['user']["zip_code"] ?? "",
        address: json['user']["address"] ?? "",
        firstName: json['user']["first_name"] ?? "",
        lastName: json['user']["last_name"] ?? "",
        phone: json['user']["phone"] ?? "",
        email: json['user']["email"] ?? "",
        photo: json['user']["photo"] ?? "",
      );
  factory AgentModel.fromSharedPrefs(Map<String, dynamic> json) => AgentModel(
        id: json["id"],
        userType: json["user_type"],
        logo: json["logo"],
        token: json["token"],
        companyName: json["company_name"],
        registrationNumber: json["registration_number"],
        zipCode: json["zip_code"],
        address: json["address"],
        firstName: json["first_name"],
        lastName: json["last_name"],
        phone: json["phone"],
        email: json["email"],
        photo: json["photo"],
      );
  factory AgentModel.forProfile(Map<String, dynamic> json, String tokenn) =>
      AgentModel(
        id: json["id"] ?? "",
        userType: json["user_type"] ?? "",
        logo: json["logo"] ?? "",
        token: tokenn,
        companyName: json["company_name"] ?? "",
        registrationNumber: json["registration_number"] ?? "",
        zipCode: json["zip_code"] ?? "",
        address: json["address"] ?? "",
        firstName: json["first_name"] ?? "",
        lastName: json["last_name"] ?? "",
        phone: json["phone"] ?? "",
        email: json["email"] ?? "",
        photo: json["photo"] ?? "",
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        'token': token,
        "user_type": userType,
        "logo": logo,
        "company_name": companyName,
        "registration_number": registrationNumber,
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
    await prefs.setString('type', 'agent');

    await prefs.setString('user', jsonEncode(this.toJson()));
  }

  static Future<AgentModel?> get() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    if (prefs.containsKey('user')) {
      var map = jsonDecode(prefs.getString('user')!);
      return AgentModel.fromSharedPrefs(map);
    } else {
      return null; // or throw an exception if you prefer that behavior better
    }
  }

  static Future<String?> getType() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    if (prefs.containsKey('type')) {
      return prefs.getString('type');
    } else {
      return null; // or throw an exception if you prefer that behavior better
    }
  }
}
