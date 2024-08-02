import 'package:flutter/material.dart';
import 'package:mokpos/widgets/back_button_black.dart';
import 'package:mokpos/widgets/email_text_field.dart';
import 'package:mokpos/widgets/number_text_field.dart';
import 'package:mokpos/widgets/password_field.dart';

import '../../../widgets/name_text_field.dart';

class AddNewEmployeeScreen extends StatefulWidget {
  const AddNewEmployeeScreen({super.key});

  @override
  State<AddNewEmployeeScreen> createState() => _AddNewEmployeeScreenState();
}

class _AddNewEmployeeScreenState extends State<AddNewEmployeeScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController passController = TextEditingController();

  bool checkFields() {
    return emailController.text.isNotEmpty &&
        nameController.text.isNotEmpty &&
        phoneController.text.isNotEmpty &&
        passController.text.length >= 8;
  }

  bool isGrid = false;

  void changeGrid() {
    isGrid = !isGrid;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {

        return Scaffold(
          appBar: AppBar(
            title: const Text("Enregistrer un Agent"),
          ),
          // drawer: MyDrawer(),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 20),
                  buildForm(context),
                  const SizedBox(height: 20),
                  const Text(
                    "Select Type of Employee",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 20),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // CustomSmallButton(
                      //   isSelected: userViewModel.newEmpType == "cashier",
                      //   label: "Point de vente",
                      //   fontSize: 12,
                      //   icon: Icons.money,
                      //   onTap: () => userViewModel.setEmpType("cashier"),
                      // ),
                      // CustomSmallButton(
                      //   isSelected: userViewModel.newEmpType == "topup",
                      //   label: "Point de Recharge",
                      //   fontSize: 12,
                      //   icon: Icons.wifi,
                      //   onTap: () => userViewModel.setEmpType("topup"),
                      // ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerFloat,
          floatingActionButton: MyTextButton(
            margin: const EdgeInsets.symmetric(horizontal: 20),
            label: "ENREGISTRER",
            backgroundColor: checkFields() ? Colors.green : Colors.grey[600],
          ),
        );

  }

  Widget buildForm(BuildContext context) {
    return Form(

      autovalidateMode: AutovalidateMode.onUserInteraction,
      child: Column(
        children: [
          NameTextField(
            title: "NOM",
            hintText: "Martin MBAPPE",
            controller: nameController,
            onChanged: (String val) {
            },
          ),
          const SizedBox(height: 20),
          EmailTextField(
            controller: emailController,
            onChanged: (String val) {
            },
          ),
          const SizedBox(height: 20),
          NumberTextField(
            title: "Tel",
            hintText: "12378900",
            controller: phoneController,
            onChanged: (String val) {
            },
          ),
          const SizedBox(height: 20),
          PasswordField(
            controller: passController,
            onChanged: (String val) {
            },
          ),
        ],
      ),
    );
  }
}
