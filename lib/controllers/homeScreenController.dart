import 'package:flutter/foundation.dart';

import '../Models/Home_LIst_Model.dart';

class HomeScreenController extends ChangeNotifier {

  int a=0;
  int b=0;
  int c=0;


  final List<Home_List_Model> Data_List = [
    Home_List_Model(
      src: "assets/Home/homeba.png",
      location: "Jakarta indonesia",
      name: "Wings Tower",
      price: 220,
      rating: 4.9,
      favourite: false,
    ),
    Home_List_Model(
      src: "assets/Home/homebb.png",
      location: "Jakarta indonesia",
      name: "Milsper House Tower",
      price: 270,
      rating: 4.9,
      favourite: false,
    ),
    Home_List_Model(
      src: "assets/Home/homeba.png",
      location: "Jakarta indonesia",
      name: "Wings Tower",
      price: 220,
      rating: 4.9,
      favourite: false,
    ),
    Home_List_Model(
      src: "assets/Home/homebb.png",
      location: "Jakarta indonesia",
      name: "Milsper House Tower",
      price: 270,
      rating: 4.9,
      favourite: false,
    ),
  ];

 fab(bool state,int index){
  Data_List[index].favourite = state;
  notifyListeners();
}

  changeIndex(int i) {
    a = i;
    notifyListeners();
  }

  Screen_State(int temp)
  {
    b=temp;
    notifyListeners();
  }

  Bottom_Sheet(int temp)
  {
    c= temp;
    notifyListeners();

  }


}
