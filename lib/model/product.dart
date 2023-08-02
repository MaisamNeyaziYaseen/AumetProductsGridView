class Product {
  int? id;
  String name = "";
  String photoUrl = "";
  double? price;
  String? description = "";
  String category = "";

  Product.fromjson(Map<String, dynamic> data) {
    id = data['id'];
    name = data['name'];
    photoUrl = data['photo_url'];
    price = data['price'];
    description = data['description'];
    category = data['category'];
  }
}
