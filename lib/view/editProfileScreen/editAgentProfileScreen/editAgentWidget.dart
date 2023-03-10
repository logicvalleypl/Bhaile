import 'dart:io';

import 'package:bhaile/Constants/AppColors.dart';
import 'package:bhaile/constants/globalKeys.dart';
import 'package:bhaile/model/agentModel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../controllers/profileControllers/editProfileController.dart';
import '../../../controllers/profileControllers/profileController.dart';
import '../../../widgets/circularButton.dart';
import '../../../widgets/myTextField.dart';
import '../widgets/Add_Document.dart';

class EditAgentWidget extends StatefulWidget {
  EditAgentWidget({
    super.key,
    required this.agentModel,
  });
  AgentModel agentModel;

  @override
  State<EditAgentWidget> createState() => _EditAgentWidgetState();
}

class _EditAgentWidgetState extends State<EditAgentWidget> {
  TextEditingController firstNameCtrl = TextEditingController();

  TextEditingController lastNameCtrl = TextEditingController();

  TextEditingController phoneCtrl = TextEditingController();

  TextEditingController addressCtrl = TextEditingController();

  TextEditingController zipCodeCtrl = TextEditingController();
  TextEditingController companyNameController = TextEditingController();
  TextEditingController registerationNumberCtrl = TextEditingController();
  @override
  Widget build(BuildContext context) {
    var profileController = context.read<ProfileController>();
    var editProfileController = context.read<EditProfileController>();
    if (firstNameCtrl.text.isEmpty) {
      firstNameCtrl.text = widget.agentModel.firstName;
    }
    if (lastNameCtrl.text.isEmpty) {
      lastNameCtrl.text = widget.agentModel.lastName;
    }
    if (phoneCtrl.text.isEmpty) {
      phoneCtrl.text = widget.agentModel.phone;
    }
    if (addressCtrl.text.isEmpty) {
      addressCtrl.text = widget.agentModel.address ?? "";
    }
    if (zipCodeCtrl.text.isEmpty) {
      zipCodeCtrl.text = widget.agentModel.zipCode ?? "";
    }
    if (companyNameController.text.isEmpty) {
      companyNameController.text = widget.agentModel.companyName ?? "";
    }
    if (registerationNumberCtrl.text.isEmpty) {
      registerationNumberCtrl.text = widget.agentModel.registrationNumber ?? "";
    }

    var w = MediaQuery.of(context).size.width;
    var h = MediaQuery.of(context).size.height;
    return Column(
      children: [
        SizedBox(
          height: h / 35,
        ),
        GestureDetector(
          onTap: () => editProfileController.pickLogo(),
          child: Selector<EditProfileController, String>(
              selector: (p0, p1) => p1.filePath,
              builder: (context, filePath, child) {
                return filePath.isEmpty
                    ? CircleAvatar(
                        backgroundImage: NetworkImage(widget.agentModel.photo),
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
                        text: "Company Name",
                        icon: Icon(Icons.person),
                        validate: (s) =>
                            editProfileController.validateCompanyName(s!),
                        isPassword: false,
                        ctrl: companyNameController),
                  ),
                  Padding(
                    padding: EdgeInsets.all(w / 40),
                    child: MyTextField(
                        text: "First Name",
                        icon: Icon(Icons.code),
                        validate: (s) =>
                            editProfileController.validateFirstName(s!),
                        isPassword: false,
                        ctrl: firstNameCtrl),
                  ),
                  Padding(
                    padding: EdgeInsets.all(w / 40),
                    child: MyTextField(
                        text: "Last Name",
                        icon: Icon(Icons.code),
                        validate: (s) =>
                            editProfileController.validateLastName(s!),
                        isPassword: false,
                        ctrl: lastNameCtrl),
                  ),
                  Padding(
                    padding: EdgeInsets.all(w / 40),
                    child: MyTextField(
                        text: "Phone",
                        icon: Icon(Icons.phone),
                        validate: (String? s) {},
                        isPassword: false,
                        ctrl: phoneCtrl),
                  ),
                  Padding(
                    padding: EdgeInsets.all(w / 40),
                    child: MyTextField(
                        text: "Address",
                        icon: Icon(Icons.location_on_sharp),
                        validate: (s) =>
                            editProfileController.validateAddress(s!),
                        isPassword: false,
                        ctrl: addressCtrl),
                  ),
                  Padding(
                    padding: EdgeInsets.all(w / 40),
                    child: MyTextField(
                        text: "Zip Code",
                        icon: Icon(Icons.code),
                        validate: (s) =>
                            editProfileController.validateZipCode(s!),
                        isPassword: false,
                        ctrl: zipCodeCtrl),
                  ),
                  Padding(
                    padding: EdgeInsets.all(w / 40),
                    child: MyTextField(
                        text: "Company Registration No",
                        icon: Icon(Icons.code),
                        validate: (s) => editProfileController
                            .validateCompanyRegistrationNumber(s!),
                        isPassword: false,
                        ctrl: registerationNumberCtrl),
                  ),
                  Padding(
                    padding: EdgeInsets.all(w / 40),
                    child: Column(
                      children: [
                        GestureDetector(
                          onTap: () {
                            editProfileController.pickBusinessCard();
                          },
                          child: Selector<EditProfileController, String>(
                              selector: (a, b) => b.businessCardDocument,
                              builder: (context, document, child) {
                                return Add_Document(
                                    isFileSelected:
                                        document.isEmpty ? false : true,
                                    text: "Business Card",
                                    icon: Icon(
                                      Icons.credit_card,
                                      color: AppColors.PRIMARY_DARK,
                                    ));
                              }),
                        ),
                        SizedBox(
                          height: h / 30,
                        ),
                        GestureDetector(
                          onTap: () {
                            editProfileController.pickAddressProof();
                          },
                          child: Selector<EditProfileController, String>(
                              selector: (a, b) => b.addressProffDocument,
                              builder: (context, document, child) {
                                return Add_Document(
                                    isFileSelected:
                                        document.isEmpty ? false : true,
                                    text: "Address Proof",
                                    icon: Icon(Icons.location_on_sharp,
                                        color: AppColors.PRIMARY_DARK));
                              }),
                        ),
                        SizedBox(
                          height: h / 30,
                        ),
                        GestureDetector(
                          onTap: () {
                            editProfileController.pickBusinessDocument();
                          },
                          child: Selector<EditProfileController, String>(
                              selector: (a, b) => b.businessDocument,
                              builder: (context, document, child) {
                                return Add_Document(
                                    isFileSelected:
                                        document.isEmpty ? false : true,
                                    text: "Business Document",
                                    icon: Icon(Icons.document_scanner,
                                        color: AppColors.PRIMARY_DARK));
                              }),
                        ),
                      ],
                    ),
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
              editProfileController.editAgentProfile(
                  token: context.read<ProfileController>().getToken(),
                  firstName: firstNameCtrl.text,
                  lastName: lastNameCtrl.text,
                  zipCode: zipCodeCtrl.text,
                  comapanyRegNo: registerationNumberCtrl.text,
                  companyName: companyNameController.text,
                  address: addressCtrl.text,
                  phone: phoneCtrl.text);
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
