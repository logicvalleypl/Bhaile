import 'package:flutter/material.dart';

import '../../../../model/agentModel.dart';
import '../../widgets/profileDetailsTile.dart';

class AgentBasicInfoWidget extends StatelessWidget {
  AgentBasicInfoWidget({
    super.key,
    required this.agentModel,
  });
  AgentModel agentModel;

  @override
  Widget build(BuildContext context) {
    var w = MediaQuery.of(context).size.width;
    var h = MediaQuery.of(context).size.height;
    return Padding(
      padding: EdgeInsets.only(left: w / 20, right: w / 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ProfileDetailsTile(
            data: agentModel.companyName ?? "N/A",
            hint: "Company Name",
          ),
          SizedBox(
            height: h / 200,
          ),
          ProfileDetailsTile(
            data: agentModel.firstName + " " + agentModel.lastName,
            hint: "Name",
          ),
          SizedBox(
            height: h / 200,
          ),
          ProfileDetailsTile(
            data: agentModel.email,
            hint: "Email",
          ),
          SizedBox(
            height: h / 200,
          ),
          ProfileDetailsTile(
            data: agentModel.phone,
            hint: "Phone",
          ),
          SizedBox(
            height: h / 200,
          ),
          ProfileDetailsTile(
            data: agentModel.address ?? "N/A",
            hint: "Address",
          ),
          SizedBox(
            height: h / 200,
          ),
          ProfileDetailsTile(
            data: agentModel.zipCode ?? "N/A",
            hint: "Zip Code",
          ),
          SizedBox(
            height: h / 200,
          ),
          ProfileDetailsTile(
            data: agentModel.registrationNumber ?? "N/A",
            hint: "Registration No",
          ),
          SizedBox(
            height: h / 200,
          ),
        ],
      ),
    );
  }
}
