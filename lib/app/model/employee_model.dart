class EmployeeModel {
  String? employeeType;
  String? employeeCode;
  String? employeeId;
  String? ownerId;
  String? password;
  num? walletBalance;
  String? name;
  String? email;
  String? phone;

  EmployeeModel(
      {this.employeeType,
      this.employeeCode,
      this.employeeId,
      this.ownerId,
      this.password,
      this.walletBalance,
      this.name,
      this.email,
      this.phone});

  EmployeeModel.fromJson(Map<String, dynamic> json) {
    employeeType = json['employeeType'];
    employeeCode = json['employeeCode'];
    employeeId = json['employeeId'];
    ownerId = json['ownerId'];
    password = json['password'];
    walletBalance = json['walletBalance'];
    name = json['name'];
    email = json['email'];
    phone = json['phone'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['employeeType'] = employeeType;
    data['employeeCode'] = employeeCode;
    data['employeeId'] = employeeId;
    data['ownerId'] = ownerId;
    data['password'] = password;
    data['walletBalance'] = walletBalance;
    data['name'] = name;
    data['email'] = email;
    data['phone'] = phone;
    return data;
  }
}
