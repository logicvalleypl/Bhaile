
import 'dart:convert';


// Agent ---------------------------------------------------------------

class Agent {
  Agent({
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

  int id;
  String userType;
  String logo;
  String companyName;
  String registrationNumber;
  int zipCode;
  String address;
  String firstName;
  String lastName;
  String phone;
  String email;
  String photo;

  factory Agent.fromJson(Map<String, dynamic> json) => Agent(
    id: json["id"],
    userType: json["user_type"],
    logo: json["logo"],
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

  Map<String, dynamic> toJson() => {
    "id": id,
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


  //Example
// Agent agentFromJson(String str) => Agent.fromJson(json.decode(str));
//
// String agentToJson(Agent data) => json.encode(data.toJson());

}






//Tanent ---------------------------------------------------------------   It can also be sued for Land Lord


class Tanent {
  Tanent({
    required this.id,
    required this.userType,
    required this.zipCode,
    required this.address,
    required this.firstName,
    required this.lastName,
    required this.phone,
    required this.email,
    required this.photo,
  });

  int id;
  String userType;
  dynamic zipCode;
  dynamic address;
  String firstName;
  String lastName;
  String phone;
  String email;
  String photo;

  factory Tanent.fromJson(Map<String, dynamic> json) => Tanent(
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

  Map<String, dynamic> toJson() => {
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
}


