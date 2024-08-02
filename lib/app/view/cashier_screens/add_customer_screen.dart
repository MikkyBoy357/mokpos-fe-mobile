import 'package:flutter/material.dart';
import 'package:mokpos/widgets/back_button_black.dart';
import 'package:mokpos/widgets/email_text_field.dart';
import 'package:mokpos/widgets/employee_drawer.dart';
import 'package:mokpos/widgets/phone_text_field.dart';

import '../../../widgets/name_text_field.dart';

class AddCustomerScreen extends StatefulWidget {
  const AddCustomerScreen({super.key});

  @override
  State<AddCustomerScreen> createState() => _AddCustomerScreenState();
}

class _AddCustomerScreenState extends State<AddCustomerScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController zoneController = TextEditingController();

  bool isGrid = false;

  void changeGrid() {
    isGrid = !isGrid;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
        return Scaffold(
          appBar: AppBar(
            title: const Text("Add New Customer"),
          ),
          drawer: const EmployeeDrawer(),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              children: [
                const SizedBox(height: 20),
                buildForm(context,),
                const SizedBox(height: 20),
              ],
            ),
          ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerFloat,
          floatingActionButton: const MyTextButton(
            margin: EdgeInsets.symmetric(horizontal: 20),
            label: "ENREGISTRER",
            backgroundColor: Colors.green,
          ),
        );

  }

  Widget buildForm(BuildContext context) {
    return Form(
      // key: viewModel.formKey,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      child: Column(
        children: [
          NameTextField(
            title: "NOM",
            hintText: "DOSSA Jean",
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
          PhoneTextField(
            title: "Tel (+229)",
            hintText: "97090909",
            controller: emailController,
            onChanged: (String val) {
            },
          ),
          const SizedBox(height: 20),
          NameTextField(
            title: "Address",
            hintText: "Entrer une adresse",
            controller: addressController,
            onChanged: (String val) {
            },
          ),
          const SizedBox(height: 20),
          NameTextField(
            title: "Zone",
            hintText: "Entrer une zone",
            controller: zoneController,
            onChanged: (String val) {
            },
          ),
        ],
      ),
    );
  }
}
