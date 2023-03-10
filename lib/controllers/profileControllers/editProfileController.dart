import 'package:bhaile/services/network/globalApi.dart';
import 'package:bhaile/services/repos/editUserProfileRepo.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:image_picker/image_picker.dart';

class EditProfileController extends ChangeNotifier {
  int filterationIndex = 0;
  String filePath = '';
  String logoPath = '';
  String businessCardDocument = '';
  String addressProffDocument = '';
  String businessDocument = '';
  pickImage() async {
    ImagePicker p = ImagePicker();
    var f = await p.pickImage(source: ImageSource.gallery);
    if (f != null) {
      filePath = f.path;

      notifyListeners();
    }
  }

  pickLogo() async {
    ImagePicker p = ImagePicker();
    var f = await p.pickImage(source: ImageSource.gallery);
    if (f != null) {
      logoPath = f.path;

      notifyListeners();
    }
  }

  pickBusinessCard() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();

    if (result != null) {
      businessCardDocument = result.files.single.path!;
      notifyListeners();
    } else {
      EasyLoading.showToast("No file selected");
    }
  }

  pickAddressProof() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();

    if (result != null) {
      addressProffDocument = result.files.single.path!;
      notifyListeners();
    } else {
      EasyLoading.showToast("No file selected");
    }
  }

  pickBusinessDocument() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();

    if (result != null) {
      businessDocument = result.files.single.path!;
      notifyListeners();
    } else {
      EasyLoading.showToast("No file selected");
    }
  }

  changeFilteredIndex(int a) {
    filterationIndex = a;
    notifyListeners();
  }

  validateFirstName(String s) {
    if (s.isEmpty) {
      return "Please enter your First Name";
    }
    return null;
  }

  validateLastName(String s) {
    if (s.isEmpty) {
      return "Please enter your Last Name";
    }
    return null;
  }

  validatePhone(String s) {
    if (s.isEmpty) {
      return "Please enter your Phone No";
    }
    return null;
  }

  validateEmail(String s) {
    if (s.isEmpty) {
      return "Please enter your Email";
    }
    return null;
  }

  validateCompanyName(String s) {
    if (s.isEmpty) {
      return "Please enter your Company Name";
    }
    return null;
  }

  validateAddress(String s) {
    if (s.isEmpty) {
      return "Please enter your Address";
    }
    return null;
  }

  validateZipCode(String s) {
    if (s.isEmpty) {
      return "Please enter your ZipCode";
    }
    return null;
  }

  editTenanteProfile(
      {required String firstName,
      required String phone,
      required String token,
      required String lastName,
      required String address,
      required String zipCode}) async {
    EasyLoading.show();
    Map<String, String> data = {
      "first_name": firstName,
      "last_name": lastName,
      "phone_no": phone,
    };

    if (address.isNotEmpty) {
      data['address'] = address;
    }
    if (zipCode.isNotEmpty) {
      data['zip_code'] = zipCode;
    }
    var response = filePath.isEmpty
        ? await EditUserProfileRepo.editUserProfile(
            token: token,
            data: data,
          )
        : await EditUserProfileRepo.editUserProfile(
            token: token, data: data, filePath: filePath);
    if (response == true) {
      sshowSnackBar('User record Updated');
      EasyLoading.dismiss();
    }
    EasyLoading.dismiss();
  }
  //QABMKJXZR-08183 this is agent token

  void editLandLordProfile(
      {required String firstName,
      required String token,
      required String lastName,
      required String zipCode,
      required String phone,
      required String address}) async {
    EasyLoading.show();
    Map<String, String> data = {
      "first_name": firstName,
      "last_name": lastName,
    };
    if (phone.isNotEmpty) {
      data['phone_no'] = phone;
    }

    if (address.isNotEmpty) {
      data['address'] = address;
    }
    if (zipCode.isNotEmpty) {
      data['zip_code'] = zipCode;
    }
    var response = filePath.isEmpty
        ? await EditUserProfileRepo.editUserProfile(
            token: token,
            data: data,
          )
        : await EditUserProfileRepo.editUserProfile(
            token: token, data: data, filePath: filePath);
    if (response == true) {
      sshowSnackBar('User record Updated');
      EasyLoading.dismiss();
      // context.read<ProfileController>().showLoading(false);
    }
    EasyLoading.dismiss();
  }

  validateCompanyRegistrationNumber(String s) {
    if (s.isEmpty) {
      return "Please enter your Company Registration Number";
    }
    return null;
  }

  void editAgentProfile(
      {required String firstName,
      required String lastName,
      required String token,
      required String zipCode,
      required String phone,
      required String comapanyRegNo,
      required String companyName,
      required String address}) async {
    EasyLoading.show();
    Map<String, String> data = {
      "first_name": firstName,
      "last_name": lastName,
      'company_name': companyName,
      'registration_number': comapanyRegNo,
    };
    if (phone.isNotEmpty) {
      data['phone_no'] = phone;
    }

    if (address.isNotEmpty) {
      data['address'] = address;
    }
    if (zipCode.isNotEmpty) {
      data['zip_code'] = zipCode;
    }
    Map<String, String> docs = {};

    if (businessCardDocument.isNotEmpty) {
      docs['bcd'] = businessCardDocument;
    }
    if (addressProffDocument.isNotEmpty) {
      docs['apd'] = addressProffDocument;
    }
    if (businessDocument.isNotEmpty) {
      docs['bd'] = businessDocument;
    }

    var response = logoPath.isEmpty
        ? await EditUserProfileRepo.editAgentProfile(
            token: token, data: data, docs: docs)
        : await EditUserProfileRepo.editAgentProfile(
            token: token, filePath: logoPath, data: data, docs: docs);
    if (response == true) {
      sshowSnackBar('User record Updated');
      EasyLoading.dismiss();
    } else {
      EasyLoading.dismiss();
    }
  }
}
