import 'package:flutter/material.dart';

import '../../../Constants/AppColors.dart';
import '../../../widgets/boldText.dart';

class ProfilePictureWidget extends StatelessWidget {
  ProfilePictureWidget({
    super.key,
    required this.fName,
    required this.email,
    required this.image,
    required this.lName,
  });
  String image, fName, lName, email;

  @override
  Widget build(BuildContext context) {
    final double w = MediaQuery.of(context).size.width;
    final double h = MediaQuery.of(context).size.height;
    return Column(
      children: [
        CircleAvatar(
          backgroundImage: NetworkImage(image),
          radius: w / 7,
        ),
        SizedBox(
          height: h / 60,
        ),
        BoldText(text: fName + " " + lName, color: AppColors.BLACK, size: 16),
        BoldText(
          text: email,
          color: AppColors.BLACK,
          size: 12,
        ),
      ],
    );
  }
}
