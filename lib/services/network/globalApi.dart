import 'dart:convert';
import 'dart:io';

import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:http/http.dart' as http;

import '../../constants/urls.dart';

Future api(
    {Map<String, String> keys = const {},
    Map<String, String>? data,
    Map<String, String>? docs,
    String filePath = "",
    required String apiPath}) async {
  var headers = {'key': 'HY3hAgMk3IMktRDhOHYdZXSk3anBk3UR'};
  if (!keys.isEmpty) {
    headers.addAll(keys);
  }
  var request = http.MultipartRequest('POST', Uri.parse(BASEURL + apiPath));

  if (filePath.isNotEmpty) {
    request.files
        .add(await http.MultipartFile.fromPath('profile_pic', filePath));
  }
  if (docs != null) {
    if (docs['bd'] != null && docs['bd']!.isNotEmpty) {
      request.files.add(await http.MultipartFile.fromPath(
          'registration_document', docs['bd']!));
    }
    if (docs['bcd'] != null && docs['bcd']!.isNotEmpty) {
      request.files.add(
          await http.MultipartFile.fromPath('business_card', docs['bcd']!));
    }
    if (docs['apd'] != null && docs['apd']!.isNotEmpty) {
      request.files.add(
          await http.MultipartFile.fromPath('address_proof', docs['apd']!));
    }
  }

  request.headers.addAll(headers);
  if (data != null) {
    if (data.isNotEmpty) {
      request.fields.addAll(data);
    }
  }

  try {
    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      var tempBody = await response.stream.bytesToString();

      var body = jsonDecode(tempBody);
      print(body);
      return body;
    } else if (response.statusCode == 401) {
      var tempBody = await response.stream.bytesToString();

      var body = jsonDecode(tempBody);
      print(body);

      return body;
    } else if (response.statusCode == 404) {
      var tempBody = await response.stream.bytesToString();

      var body = jsonDecode(tempBody);
      print(body);

      return body;
    } else {
      var tempBody = await response.stream.bytesToString();

      var body = jsonDecode(tempBody);
      print(body);
      if (body['code'] == '101') {
        sshowSnackBar(body['message']);
        EasyLoading.dismiss();
      } else {
        sshowSnackBar(body['Login Failed!']);
        EasyLoading.dismiss();
      }
    }
  } catch (e) {
    if (e is SocketException) {
      sshowSnackBar('No internet connection');
    } else if (e is HttpException) {
    } else {
      sshowSnackBar(e.toString());
    }
    return e;
  }
}

sshowSnackBar(String t) {
  EasyLoading.showToast(t,
      toastPosition: EasyLoadingToastPosition.bottom,
      duration: Duration(seconds: 3),
      maskType: EasyLoadingMaskType.none);
}
