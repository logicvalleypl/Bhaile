import 'package:flutter/material.dart';

import '../../../Constants/AppColors.dart';
import '../../../widgets/boldText.dart';

class ProfileDetailsTile extends StatelessWidget {
  ProfileDetailsTile({super.key, required this.hint, required this.data});
  String hint;
  String data;

  @override
  Widget build(BuildContext context) {
    var w = MediaQuery.of(context).size.width;
    var h = MediaQuery.of(context).size.height;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        NormalText(
          text: hint,
          size: 10,
          color: AppColors.BLACK,
        ),
        SizedBox(
          height: h / 150,
        ),
        BoldText(
          text: data,
          color: AppColors.PRIMARY_DARK,
          size: 12,
          align: TextAlign.left,
        ),
        Divider()
      ],
    );
  }
}
