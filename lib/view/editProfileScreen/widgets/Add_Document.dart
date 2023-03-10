import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../Constants/AppColors.dart';
import '../../../Widgets/Texts.dart';

class Add_Document extends StatelessWidget {
  Add_Document({
    super.key,
    required this.text,
    required this.isFileSelected,
    required this.icon,
  });

  bool isFileSelected;
  final String text;
  final Icon icon;

  @override
  Widget build(BuildContext context) {
    var w = MediaQuery.of(context).size.width;
    var h = MediaQuery.of(context).size.height;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Bold_Text(text: text, color: AppColors.PRIMARY_DARK, size: 10.sp),
        SizedBox(
          width: w / 20,
        ),
        GestureDetector(
          onTap: () {},
          child: Container(
            width: w / 2,
            height: h / 12,
            decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: BorderRadius.circular(w / 20),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                SimpleText(
                    text: "Add Document",
                    color: AppColors.PRIMARY_DARK,
                    size: 8.sp),
                icon,
                if (isFileSelected)
                  Icon(
                    Icons.check_box,
                    color: AppColors.PRIMARY,
                  )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
