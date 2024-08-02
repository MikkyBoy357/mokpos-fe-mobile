// ignore_for_file: use_build_context_synchronously

import 'dart:convert';


import 'package:flutter/material.dart';
import 'package:mokpos/app/model/employee_model.dart';
import 'package:mokpos/app/model/user_model.dart';


class UserViewModel extends ChangeNotifier {
  bool isInitialized = false;
  bool gottenEmps = false;


  // Dashboard Value
  num topupWalletsTotal = 0;
  num cashierWalletsTotal = 0;
  num customerWalletsTotal = 0;

  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  // User? user;

  UserModel? user;

  List<EmployeeModel> employeeList = [];

  EmployeeModel? topupEmployee;
  double topupAmt = 0;
  double minTopup = 200;

  bool isLoading = false;

  // Register Employee
  String name = '';
  String email = '';
  String phone = '';
  String pass = '';
  String newEmpType = 'cashier';

  void setEmpType(val) {
    newEmpType = val;
    notifyListeners();
  }

  void setName(val) {
    name = val;
    notifyListeners();
  }

  void setEmail(val) {
    email = val;
    notifyListeners();
  }

  void setPhone(val) {
    phone = val;
    notifyListeners();
  }

  void setPass(val) {
    pass = val;
    notifyListeners();
  }

  void changeNotifier() {
    notifyListeners();
  }

  // setUser() {
  //   user = auth.currentUser;
  //   notifyListeners();
  // }

  // Future<void> getUser() async {}



  String getPrettyJSONString(jsonObject) {
    var encoder = const JsonEncoder.withIndent("     ");
    return encoder.convert(jsonObject);
  }



  void setTopupAmt(String? val) {
    if (val != null && val.isNotEmpty) {
      topupAmt = double.parse(val);
    } else {
      topupAmt = 0.0;
    }

    notifyListeners();
  }

  void startLoading(BuildContext context) {
    isLoading = true;
    notifyListeners();
  }

  void stopLoading(BuildContext context) {
    isLoading = false;
    notifyListeners();
  }
}
