class BudgetModel {
  String? id;
  List<BudgetItems>? budgetItems;

  BudgetModel({this.id, this.budgetItems});

  BudgetModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    if (json['budgetItems'] != null) {
      budgetItems = <BudgetItems>[];
      json['budgetItems'].forEach((v) {
        budgetItems!.add(BudgetItems.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    if (budgetItems != null) {
      data['budgetItems'] = budgetItems!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class BudgetItems {
  String? id;
  String? name;
  double? price;
  int? quantity;

  BudgetItems({this.id, this.name, this.price, this.quantity});

  BudgetItems.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    price = json['price'];
    quantity = json['quantity'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['price'] = price;
    data['quantity'] = quantity;
    return data;
  }
}
