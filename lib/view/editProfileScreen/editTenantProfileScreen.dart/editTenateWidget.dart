import 'dart:io';

import 'package:bhaile/constants/globalKeys.dart';
import 'package:bhaile/controllers/profileControllers/editProfileController.dart';
import 'package:bhaile/model/tenantModel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../controllers/profileControllers/profileController.dart';
import '../../../widgets/circularButton.dart';
import '../../../widgets/myTextField.dart';

class EditTenantWidget extends StatefulWidget {
  EditTenantWidget({
    super.key,
    required this.tenantModel,
  });
  TenantModel tenantModel;

  @override
  State<EditTenantWidget> createState() => _EditTenantWidgetState();
}

class _EditTenantWidgetState extends State<EditTenantWidget> {
  TextEditingController firstNameCtrl = TextEditingController();

  TextEditingController lastNameCtrl = TextEditingController();

  TextEditingController phoneCtrl = TextEditingController();

  TextEditingController addressCtrl = TextEditingController();

  TextEditingController zipCodeCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    if (firstNameCtrl.text.isEmpty) {
      firstNameCtrl.text = widget.tenantModel.firstName;
    }
    if (lastNameCtrl.text.isEmpty) {
      lastNameCtrl.text = widget.tenantModel.lastName;
    }
    // if (emailCtrl.text.isEmpty) {
    //   emailCtrl.text = widget.tenantModel.email;
    // }
    if (phoneCtrl.text.isEmpty) {
      phoneCtrl.text = widget.tenantModel.phone;
    }
    if (addressCtrl.text.isEmpty) {
      addressCtrl.text = widget.tenantModel.address ?? "";
    }
    if (zipCodeCtrl.text.isEmpty) {
      zipCodeCtrl.text = widget.tenantModel.zipCode ?? "";
    }

    var w = MediaQuery.of(context).size.width;
    var h = MediaQuery.of(context).size.height;
    var ctrll = context.read<EditProfileController>();
    return Column(
      children: [
        SizedBox(
          height: h / 35,
        ),
        GestureDetector(
          onTap: () => ctrll.pickImage(),
          child: Selector<EditProfileController, String>(
              selector: (p0, p1) => p1.filePath,
              builder: (context, filePath, child) {
                return filePath.isEmpty
                    ? CircleAvatar(
                        backgroundImage: NetworkImage(widget.tenantModel.photo),
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
                        validate: (s) => ctrll.validateFirstName(s!),
                        isPassword: false,
                        ctrl: firstNameCtrl),
                  ),
                  Padding(
                    padding: EdgeInsets.all(w / 40),
                    child: MyTextField(
                        text: "Last Name",
                        icon: Icon(Icons.person),
                        validate: (s) => ctrll.validateLastName(s!),
                        isPassword: false,
                        ctrl: lastNameCtrl),
                  ),
                  Padding(
                    padding: EdgeInsets.all(w / 40),
                    child: MyTextField(
                        text: "Phone",
                        icon: Icon(Icons.phone),
                        validate: (String? a) {},
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
              // context.read<ProfileController>().showLoading(true);
              ctrll.editTenanteProfile(
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
        SizedBox(
          height: h / 50,
        ),
      ],
    );
  }
}
