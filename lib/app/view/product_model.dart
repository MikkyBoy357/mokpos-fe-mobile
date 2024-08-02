
class ProductModel {
  String? id;
  String? name;
  num? price;
  String? category;
  String? image;

  ProductModel({this.name, this.price, this.category, this.image});

  ProductModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    price = json['price'];
    category = json['category'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['price'] = price;
    data['category'] = category;
    data['image'] = image;
    return data;
  }
}
