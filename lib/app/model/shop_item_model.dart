
class ShopItemModel {
  String? id;
  String? name;
  double? price;
  String? imageUrl;

  ShopItemModel({
    required this.id,
    required this.name,
    required this.price,
    required this.imageUrl,
  });

  ShopItemModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    price = json['price'];
    imageUrl = json['imageUrl'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['price'] = price;
    data['imageUrl'] = imageUrl;
    return data;
  }
}

