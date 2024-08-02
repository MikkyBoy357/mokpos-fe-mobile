class CustomerModel {
  String? id;
  String? name;
  String? email;
  num? walletBalance;

  CustomerModel({this.id, this.name, this.email, this.walletBalance});

  CustomerModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    walletBalance = json['walletBalance'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['email'] = email;
    data['walletBalance'] = walletBalance;
    return data;
  }
}
