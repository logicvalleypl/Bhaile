import 'package:bhaile/constants/urls.dart';
import 'package:bhaile/model/agentModel.dart';
import 'package:bhaile/model/landLordModel.dart';
import 'package:bhaile/model/tenantModel.dart';

import '../network/globalApi.dart';

class AuthRepo {
  static Future signUp(
      {required String firstName,
      required String lastName,
      required String email,
      required String password,
      required String userType}) async {
    var response = await api(apiPath: SIGNUP, data: {
      'email': email,
      'first_name': firstName,
      'last_name': lastName,
      'user_type': userType,
      'password': password,
    });
    if (response != null) {
      if (response['status'] == true && response['code'] == '201') {
        return response;
      } else {
        sshowSnackBar(response['message']);
      }
    }
  }

  static Future verifyCode(
      {required String code, required String email}) async {
    var response = await api(apiPath: VERIFYEMAIL, data: {
      'email': email,
      'code': code,
    });
    if (response != null) {
      if (response['status'] == true && response['code'] == '201') {
        return response;
      } else {
        sshowSnackBar(response['message']);
      }
    }
  }

  static Future signIn(
      {required String email, required String password}) async {
    var response = await api(apiPath: LOGIN, data: {
      'email': email,
      'password': password,
    });
    if (response != null) {
      if (response['status'] == true && response['code'] == '201') {
        if (response['data']['user']['user_type'] == 'agent') {
          return AgentModel.fromJson(response['data']);
        }
        if (response['data']['user']['user_type'] == 'landlord') {
          return LandLordModel.fromJson(response['data']);
        }
        if (response['data']['user']['user_type'] == 'tenant') {
          return TenantModel.fromJson(response['data']);
        }
      } else {
        sshowSnackBar(response['message']);
      }
    }
  }

  static Future<bool> checkToken({required String token}) async {
    var a = await api(data: {}, apiPath: VALIDATETOKEN, keys: {"token": token});
    if (a['status'] == true) {
      print('token is valid');
      return true;
    } else {
      print('token is not valid');

      return false;
    }
  }

  static logout({required String token}) async {
    var a = await api(data: {}, apiPath: LOGOUT, keys: {"token": token});
    print(a);
    if (a['status'] == true) {
      print('logout success');

      return true;
    } else {
      print('lougout issue');

      return false;
    }
  }
}
