import 'package:bhaile/constants/urls.dart';

import '../network/globalApi.dart';

class EditUserProfileRepo {
  static Future editUserProfile(
      {required String token,
      required Map<String, String> data,
      // Map<String, String>? docs,
      String? filePath}) async {
    var response = filePath == null
        ? await api(
            apiPath: EDITPROFILE,
            keys: {'token': token},
            data: data,
          )
        : await api(
            apiPath: EDITPROFILE,
            keys: {'token': token},
            data: data,
            filePath: filePath);
    if (response['status'] == true && response['code'] == '201') {
      return true;
    } else {
      return false;
    }
  }

  static Future editAgentProfile(
      {required String token,
      required Map<String, String> data,
      Map<String, String>? docs,
      String? filePath}) async {
    var response = filePath == null
        ? await api(
            apiPath: EDITPROFILE,
            keys: {'token': token},
            data: data,
            docs: docs)
        : await api(
            apiPath: EDITPROFILE,
            keys: {'token': token},
            data: data,
            filePath: filePath,
            docs: docs);
    if (response['status'] == true && response['code'] == '201') {
      return true;
    } else {
      if (response['message'].isNotEmpty) {
        sshowSnackBar(response['message']);
      }
      return false;
    }
  }
}
