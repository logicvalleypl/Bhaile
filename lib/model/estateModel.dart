class EstateModel {
  EstateModel({
    required this.name,
    required this.location,
    required this.price,
    required this.rating,
    required this.src,
    this.favourite = false,
  });

  final String name;
  bool favourite;
  final String location;
  final String src;
  final double rating;
  final double price;
}
