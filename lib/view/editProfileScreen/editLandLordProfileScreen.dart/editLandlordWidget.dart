import 'dart:io';

import 'package:bhaile/constants/globalKeys.dart';
import 'package:bhaile/model/landLordModel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../controllers/profileControllers/editProfileController.dart';
import '../../../controllers/profileControllers/profileController.dart';
import '../../../widgets/circularButton.dart';
import '../../../widgets/myTextField.dart';

class EditLandLordWidget extends StatefulWidget {
  EditLandLordWidget({super.key, required this.landLordModel});
  LandLordModel landLordModel;

  @override
  State<EditLandLordWidget> createState() => _EditLandLordWidgetState();
}

class _EditLandLordWidgetState extends State<EditLandLordWidget> {
  TextEditingController firstNameCtrl = TextEditingController();

  TextEditingController lastNameCtrl = TextEditingController();

  TextEditingController phoneCtrl = TextEditingController();

  TextEditingController addressCtrl = TextEditingController();

  TextEditingController zipCodeCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var w = MediaQuery.of(context).size.width;
    var h = MediaQuery.of(context).size.height;
    var profileController = context.read<ProfileController>();
    var editProfileController = context.read<EditProfileController>();
    if (firstNameCtrl.text.isEmpty) {
      firstNameCtrl.text = widget.landLordModel.firstName;
    }
    if (lastNameCtrl.text.isEmpty) {
      lastNameCtrl.text = widget.landLordModel.lastName;
    }
    // if (emailCtrl.text.isEmpty) {
    //   emailCtrl.text = widget.landLordModel.email;
    // }
    if (phoneCtrl.text.isEmpty) {
      phoneCtrl.text = widget.landLordModel.phone;
    }
    if (addressCtrl.text.isEmpty) {
      addressCtrl.text = widget.landLordModel.address ?? "";
    }
    if (zipCodeCtrl.text.isEmpty) {
      zipCodeCtrl.text = widget.landLordModel.zipCode ?? "";
    }
    return Column(
      children: [
        SizedBox(
          height: h / 35,
        ),
        GestureDetector(
          onTap: () => editProfileController.pickImage(),
          child: Selector<EditProfileController, String>(
              selector: (p0, p1) => p1.filePath,
              builder: (context, filePath, child) {
                return filePath.isEmpty
                    ? CircleAvatar(
                        backgroundImage:
                            NetworkImage(widget.landLordModel.photo),
                        // AssetImage("assets/Home/sample.png"),
                        radius: w / 6,
                      )
                    : CircleAvatar(
                        backgroundImage: FileImage(
                          File(filePath),
                        ),
                        radius: w / 6,
                      );
              }),
        ),
        SizedBox(
          height: h / 60,
        ),
        Padding(
          padding: EdgeInsets.all(w / 60),
          child: Form(
            key: editKey,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.all(w / 40),
                    child: MyTextField(
                        text: "First Name",
                        icon: Icon(Icons.person),
                        validate: (s) =>
                            editProfileController.validateFirstName(s!),
                        isPassword: false,
                        ctrl: firstNameCtrl),
                  ),
                  Padding(
                    padding: EdgeInsets.all(w / 40),
                    child: MyTextField(
                        text: "Last Name",
                        icon: Icon(Icons.phone),
                        validate: (s) =>
                            editProfileController.validateLastName(s!),
                        isPassword: false,
                        ctrl: lastNameCtrl),
                  ),
                  Padding(
                    padding: EdgeInsets.all(w / 40),
                    child: MyTextField(
                        text: "Phone No",
                        icon: Icon(Icons.phone),
                        validate: (s) =>
                            editProfileController.validatePhone(s!),
                        isPassword: false,
                        ctrl: phoneCtrl),
                  ),
                  Padding(
                    padding: EdgeInsets.all(w / 40),
                    child: MyTextField(
                        text: "Address",
                        icon: Icon(Icons.location_on_sharp),
                        validate: (String? a) {},
                        isPassword: false,
                        ctrl: addressCtrl),
                  ),
                  Padding(
                    padding: EdgeInsets.all(w / 40),
                    child: MyTextField(
                        text: "Zip Code",
                        icon: Icon(Icons.code),
                        validate: (String? a) {},
                        isPassword: false,
                        ctrl: zipCodeCtrl),
                  ),
                ],
              ),
            ),
          ),
        ),
        SizedBox(
          height: h / 80,
        ),
        CircularButton(
          ontap: () {
            if (editKey.currentState!.validate()) {
              editProfileController.editLandLordProfile(
                token: context.read<ProfileController>().getToken(),

                firstName: firstNameCtrl.text,

                lastName: lastNameCtrl.text,
                // email: emailCtrl.text,
                zipCode: zipCodeCtrl.text,
                phone: phoneCtrl.text,
                address: addressCtrl.text,
              );
            }
          },
          heightDivididedBy: 12,
          text: 'Confirm',
          widthDividedBy: 1.35,
        ),
      ],
    );
  }
}
