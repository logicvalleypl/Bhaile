import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../controllers/profileControllers/profileController.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var ctrl = context.read<ProfileController>();
    var w = MediaQuery.of(context).size.width;
    var h = MediaQuery.of(context).size.height;

    return SafeArea(
        child: Scaffold(
      body: Consumer<ProfileController>(
        builder: (context, value, child) =>
            value.currentUserProfileScreen[value.currentUserTypeIndex],
      ),
    ));
  }
}
