import 'package:flutter/material.dart';
import 'package:mokpos/app/model/employee_model.dart';

import 'package:mokpos/base/constant.dart';
import 'package:mokpos/widgets/back_button_black.dart';
import 'package:uuid/uuid.dart';

import 'add_new_employee_screen.dart';
import 'topup_employee_screen.dart';

class EmployeeListScreen extends StatefulWidget {
  const EmployeeListScreen({super.key});

  @override
  State<EmployeeListScreen> createState() => _EmployeeListScreenState();
}

class _EmployeeListScreenState extends State<EmployeeListScreen> {
  @override
  void initState() {
    super.initState();
  }

  String getTypeString(String type) {
    switch (type) {
      case "cashier":
        return "Point de vente";
      case "topup":
        return "Point de recharge";
      default:
        return "ERROR";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Mes Agents"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: SingleChildScrollView(
          child: Column(
            children: [
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: 3,
                itemBuilder: (context, index) {
                  List<EmployeeModel> employees = [
                    EmployeeModel(
                      name: "Med",
                      email: "adeolasoremi5@gmail.com",
                      employeeCode: "001",
                      employeeId: const Uuid().v4(),
                      employeeType: "Pro",
                      ownerId: "001",
                      password: "12345",
                      phone: "2332",
                      walletBalance: 2000,
                    ),
                  ];
                  final currentEmployee = employees[index];

                  return Card(
                    child: ListTile(
                      // leading: Text(currentEmployee.employeeId!),
                      title: Text(
                        "${currentEmployee.email}",
                        style: const TextStyle(fontSize: 12),
                      ),
                      subtitle: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("${currentEmployee.name}"),
                              Text(
                                "CFA ${currentEmployee.walletBalance?.roundToDouble()}",
                                style: const TextStyle(
                                  color: Colors.green,
                                  fontWeight: FontWeight.bold,
                                  // fontSize: 22,
                                ),
                              ),
                            ],
                          ),
                          const Divider(),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text("CODE:"),
                              Text("${currentEmployee.employeeCode}"),
                            ],
                          ),
                        ],
                      ),
                      trailing: InkWell(
                        onTap: () {
                            Constant.navigatePush(
                              context,
                              const TopupEmployeeScreen(),
                            );

                        },
                        child: Container(
                          width: 70,
                          height: 70,
                          decoration: BoxDecoration(
                              color: Colors.amber,
                              borderRadius: BorderRadius.circular(16)),
                          child: Center(
                            child: Text(
                              getTypeString("${currentEmployee.employeeType}"),
                              textAlign: TextAlign.center,
                              style: const TextStyle(),
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                },
              )
            ],
          ),
        ),
      ),
      floatingActionButton: MyTextButton(
        onTap: () {
          Constant.navigatePush(context, const AddNewEmployeeScreen());
        },
        backgroundColor: Colors.green,
        label: "Ajouter un Agent",
        margin: const EdgeInsets.symmetric(horizontal: 20),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
