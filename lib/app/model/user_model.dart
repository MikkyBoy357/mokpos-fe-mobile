
class UserModel {
  String? id;
  String? email;
  String? phone;
  num? walletBalance;
  String? userType;
  num? principalWalletBalance;

  UserModel({
    this.id,
    this.email,
    this.phone,
    this.walletBalance,
    this.userType,
    this.principalWalletBalance,
  });

  UserModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    email = json['email'];
    phone = json['phone'];
    walletBalance = json['walletBalance'];
    userType = json['userType'];
    principalWalletBalance = json['principalWalletBalance'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['email'] = email;
    data['phone'] = phone;
    data['walletBalance'] = walletBalance;
    data['userType'] = userType;
    data['principalWalletBalance'] = principalWalletBalance;

    return data;
  }
}
