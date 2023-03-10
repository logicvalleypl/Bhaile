
import 'package:flutter/material.dart';

import '../../../../widgets/boldText.dart';

class AgentContactWidget extends StatelessWidget {
  const AgentContactWidget({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return Center(
      child: BoldText(text: "Sold", size: 10),
    );
  }
}
