import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../Constants/AppColors.dart';
import '../../../../controllers/homeScreenController.dart';
import '../../../../widgets/boldText.dart';
import '../../../homeScreen/widgets/estateWidget.dart';

class AgentListingWidget extends StatelessWidget {
  const AgentListingWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var w = MediaQuery.of(context).size.width;
    var h = MediaQuery.of(context).size.height;
    return Padding(
      padding: EdgeInsets.all(w / 20),
      child: Column(
        children: [
          Align(
              alignment: Alignment(-w / 400, 0),
              child: BoldText(
                  text: "2 transactions",
                  color: AppColors.PRIMARY_DARK,
                  size: 12)),
          SizedBox(
            height: h / 20,
          ),
          Consumer<HomeScreenController>(builder: (context, c, d) {
            return GridView.builder(
              physics: ScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                mainAxisExtent: h / 3,
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
              ),
              shrinkWrap: true,
              itemCount: c.nearByEstates.length,
              itemBuilder: (BuildContext context, int index) {
                return EstateWidget(
                  model: c.nearByEstates[index],
                  index: index,
                  like: () {},
                  disLike: () {},
                );
              },
            );
          }),
        ],
      ),
    );
  }
}
