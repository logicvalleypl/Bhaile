import 'package:flutter/foundation.dart';

import '../model/estateModel.dart';

class HomeScreenController extends ChangeNotifier {
  int indexx = 0;
  int screenState = 0;
  int bottomSheet = 0;

  final List<EstateModel> nearByEstates = [
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

  likeOrDisLike(bool state, int index) {
    nearByEstates[index].favourite = state;
    notifyListeners();
  }

  changeIndex(int i) {
    indexx = i;
    notifyListeners();
  }

  changeScreenState(int temp) {
    screenState = temp;
    notifyListeners();
  }

  funBottomSheet(int temp) {
    bottomSheet = temp;
    notifyListeners();
  }
}
