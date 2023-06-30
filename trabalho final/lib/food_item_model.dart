class FoodItemModel {
  final String name;
  final String description;
  final double price;
  final String imagePath;
  bool isFavorite;

  FoodItemModel({
    required this.name,
    required this.description,
    required this.price,
    required this.imagePath,
    this.isFavorite = false,
  });
}
