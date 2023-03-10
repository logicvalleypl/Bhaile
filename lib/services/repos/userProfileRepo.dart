import 'package:bhaile/constants/urls.dart';
import 'package:bhaile/model/agentModel.dart';
import 'package:bhaile/model/landLordModel.dart';
import 'package:bhaile/model/tenantModel.dart';
import 'package:bhaile/services/network/globalApi.dart';

class UserProfileRepo {
  static Future getUserProfile({required String token}) async {
    var response = await api(apiPath: USERPROFILE, keys: {'token': token});
    if (response['status'] == true && response['code'] == '201') {
      if (response['data']['user_type'] == 'agent') {
        return AgentModel.forProfile(response['data'], token);
      }
    }
    if (response['status'] == true && response['code'] == '201') {
      if (response['data']['user_type'] == 'tenant') {
        return TenantModel.forProfile(response['data'], token);
      }
    }
    if (response['status'] == true && response['code'] == '201') {
      if (response['data']['user_type'] == 'landlord') {
        return LandLordModel.forProfile(response['data'], token);
      }
    }
  }
}
