class ProductModel {
  final dynamic id;
  final String title;
  var price;
  final String category;
  final String description;
  final String image;
  final RatingModel rating;

  ProductModel({
    required this.id,
    required this.title,
    required this.price,
    required this.category,
    required this.description,
    required this.image,
    required this.rating,
  });
  // Any data from internet  as Model
  // Always make  factory when get data from internet.
  factory ProductModel.fromJson(jsonData) {
    return ProductModel(
        id: jsonData['id'],
        title: jsonData['title'],
        price: jsonData['price'],
        description: jsonData['description'],
        category: jsonData['category'],
        image: jsonData['image'],
        rating: RatingModel.fromJson(jsonData['rating']));
  }
}

class RatingModel {
  var rate;
  final int count;

  RatingModel({
    required this.rate,
    required this.count,
  });
  factory RatingModel.fromJson(jsonData) {
    return RatingModel(
      rate: jsonData['rate'],
      count: jsonData['count'],
    );
  }
}
