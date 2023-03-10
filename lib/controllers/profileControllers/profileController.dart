import 'package:bhaile/model/agentModel.dart';
import 'package:bhaile/model/estateModel.dart';
import 'package:bhaile/model/landLordModel.dart';
import 'package:bhaile/model/tenantModel.dart';
import 'package:bhaile/services/repos/userProfileRepo.dart';
import 'package:bhaile/view/profileScreen/agentProfile/agentProfileScreen.dart';
import 'package:bhaile/view/profileScreen/landLordProfile/landLordProfileScreen.dart';
import 'package:bhaile/view/profileScreen/tenantProfile/tenantProfileScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

class ProfileController with ChangeNotifier {
  int filterationIndex = 0;

  int currentUserTypeIndex = 0;
  List<Widget> currentUserProfileScreen = [
    TenantProfileScreen(),
    LandLordProfileScreen(),
    AgentProfileScreen(),
  ];
  // int check = 0;
  List<EstateModel> landLordListings = [
    EstateModel(
      src: "assets/Home/homeba.png",
      location: "Jakarta indonesia",
      name: "Wings Tower",
      price: 220,
      rating: 4.9,
      favourite: false,
    ),
    EstateModel(
      src: "assets/Home/homebb.png",
      location: "Jakarta indonesia",
      name: "Milsper House Tower",
      price: 270,
      rating: 4.9,
      favourite: false,
    ),
    EstateModel(
      src: "assets/Home/homeba.png",
      location: "Jakarta indonesia",
      name: "Wings Tower",
      price: 220,
      rating: 4.9,
      favourite: false,
    ),
    EstateModel(
      src: "assets/Home/homebb.png",
      location: "Jakarta indonesia",
      name: "Milsper House Tower",
      price: 270,
      rating: 4.9,
      favourite: false,
    ),
    EstateModel(
      src: "assets/Home/homebb.png",
      location: "Jakarta indonesia",
      name: "Milsper House Tower",
      price: 270,
      rating: 4.9,
      favourite: false,
    ),
    EstateModel(
      src: "assets/Home/homeba.png",
      location: "Jakarta indonesia",
      name: "Wings Tower",
      price: 220,
      rating: 4.9,
      favourite: false,
    ),
    EstateModel(
      src: "assets/Home/homebb.png",
      location: "Jakarta indonesia",
      name: "Milsper House Tower",
      price: 270,
      rating: 4.9,
      favourite: false,
    ),
  ];

  List<EstateModel> tenanteListings = [
    EstateModel(
      src: "assets/Home/homeba.png",
      location: "Jakarta indonesia",
      name: "Wings Tower",
      price: 220,
      rating: 4.9,
      favourite: false,
    ),
    EstateModel(
      src: "assets/Home/homebb.png",
      location: "Jakarta indonesia",
      name: "Milsper House Tower",
      price: 270,
      rating: 4.9,
      favourite: false,
    ),
    EstateModel(
      src: "assets/Home/homeba.png",
      location: "Jakarta indonesia",
      name: "Wings Tower",
      price: 220,
      rating: 4.9,
      favourite: false,
    ),
    EstateModel(
      src: "assets/Home/homebb.png",
      location: "Jakarta indonesia",
      name: "Milsper House Tower",
      price: 270,
      rating: 4.9,
      favourite: false,
    ),
    EstateModel(
      src: "assets/Home/homebb.png",
      location: "Jakarta indonesia",
      name: "Milsper House Tower",
      price: 270,
      rating: 4.9,
      favourite: false,
    ),
    EstateModel(
      src: "assets/Home/homeba.png",
      location: "Jakarta indonesia",
      name: "Wings Tower",
      price: 220,
      rating: 4.9,
      favourite: false,
    ),
    EstateModel(
      src: "assets/Home/homebb.png",
      location: "Jakarta indonesia",
      name: "Milsper House Tower",
      price: 270,
      rating: 4.9,
      favourite: false,
    ),
  ];

  changeFilteredIndex(int a) {
    filterationIndex = a;
    notifyListeners();
  }

  showLoading() {
    EasyLoading.show();
  }

  dismissLoading() {
    EasyLoading.dismiss();
  }

  changecurrentUserTypeIndex(int i) {
    currentUserTypeIndex = i;
    notifyListeners();
  }

  TenantModel? tenantModel;
  AgentModel? agentModel;
  LandLordModel? landLordModel;
  getProfile() async {
    showLoading();
    if (tenantModel != null) {
      await getThatProfile(tenantModel!.token);
    }
    if (agentModel != null) {
      await getThatProfile(agentModel!.token);
    }
    if (landLordModel != null) {
      await getThatProfile(landLordModel!.token);
    }
  }

  setAgent(AgentModel aa) {
    agentModel = aa;
  }

  void setLandLord(LandLordModel aa) {
    landLordModel = aa;
  }

  setTenant(TenantModel aa) {
    tenantModel = aa;
  }

  getThatProfile(String token) async {
    // var a =

    var a = await UserProfileRepo.getUserProfile(
      token: token,
    );
    if (a != null) {
      if (a is TenantModel) {
        tenantModel = a;

        changecurrentUserTypeIndex(0);
        dismissLoading();
      }
      if (a is AgentModel) {
        agentModel = a;
        changecurrentUserTypeIndex(2);

        dismissLoading();
      }
      if (a is LandLordModel) {
        landLordModel = a;
        changecurrentUserTypeIndex(1);
        dismissLoading();
      }
    }
  }

  void setUser(dynamic p) {
    if (p is AgentModel) {
      agentModel = p;
    }
    if (p is TenantModel) {
      tenantModel = p;
    }
    if (p is LandLordModel) {
      landLordModel = p;
    }
  }

  String getToken() {
    if (tenantModel != null) {
      return tenantModel!.token;
    } else if (agentModel != null) {
      return agentModel!.token;
    } else {
      return landLordModel!.token;
    }
  }
}
