// To parse this JSON data, do
//
//     final landLordModel = landLordModelFromJson(jsonString);

import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

LandLordModel landLordModelFromJson(String str) =>
    LandLordModel.fromJson(json.decode(str));

String landLordModelToJson(LandLordModel data) => json.encode(data.toJson());

class LandLordModel {
  LandLordModel({
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
  final String token;
  final int id;
  final String userType;
  final dynamic zipCode;
  final dynamic address;
  final String firstName;
  final String lastName;
  final String phone;
  final String email;
  final String photo;

  factory LandLordModel.fromJson(Map<String, dynamic> json) => LandLordModel(
        token: json['token'],
        id: json['user']["id"] ?? "",
        userType: json['user']["user_type"],
        zipCode: json['user']["zip_code"] ?? "",
        address: json['user']["address"] ?? "",
        firstName: json['user']["first_name"] ?? "",
        lastName: json['user']["last_name"] ?? "",
        phone: json['user']["phone"] ?? "",
        email: json['user']["email"] ?? "",
        photo: json['user']["photo"] ?? "",
      );
  factory LandLordModel.fromSharedPrefs(Map<String, dynamic> json) =>
      LandLordModel(
        token: json['token'],
        id: json["id"],
        userType: json["user_type"],
        zipCode: json["zip_code"],
        address: json["address"],
        firstName: json["first_name"],
        lastName: json["last_name"],
        phone: json["phone"],
        email: json["email"],
        photo: json["photo"],
      );
  factory LandLordModel.forProfile(Map<String, dynamic> json, String tokenn) =>
      LandLordModel(
        token: tokenn,
        id: json["id"] ?? "",
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
        "id": id,
        "user_type": userType,
        "zip_code": zipCode,
        "address": address,
        "first_name": firstName,
        'token': token,
        "last_name": lastName,
        "phone": phone,
        "email": email,
        "photo": photo,
      };

  Future<void> save() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('type', 'landlord');

    await prefs.setString('user', jsonEncode(this.toJson()));
  }

  static Future<LandLordModel?> get() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    if (prefs.containsKey('user')) {
      var map = jsonDecode(prefs.getString('user')!);
      return LandLordModel.fromSharedPrefs(map);
    } else {
      return null; // or throw an exception if you prefer that behavior better
    }
  }
}
