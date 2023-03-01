
import '../view/homeScreen/widgets/Home_Listing.dart';

class Home_List_Model
{
   Home_List_Model({

    required this.name,
    required this.location,
    required this.price,
    required this.rating,
    required this.src,
    required this.favourite,
  });

  final String name;
   bool favourite;
  final String location;
  final String src;
  final double rating;
  final double price;






}