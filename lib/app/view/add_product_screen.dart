import 'dart:io';

import 'package:flutter/material.dart';
import 'package:mokpos/widgets/back_button_black.dart';
import 'package:mokpos/widgets/name_text_field.dart';
import 'package:mokpos/widgets/number_text_field.dart';

class AddProductScreen extends StatefulWidget {
  const AddProductScreen({super.key});

  @override
  State<AddProductScreen> createState() => _AddProductScreenState();
}

class _AddProductScreenState extends State<AddProductScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  TextEditingController categoryController = TextEditingController();
  TextEditingController imageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Ajouter un produit"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 10),
              const Text(
                "Details de produit",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 10),
              buildForm(context),
              const SizedBox(height: 10),
              Builder(builder: (context) {

                  String path = "";
                  return Container(
                    height: 80,
                    width: 80,
                    decoration: BoxDecoration(
                      color: Colors.green,
                      image: DecorationImage(
                        image: FileImage(File(path)),
                      ),
                    ),
                  );

              }),
              const SizedBox(height: 10),
              const MyTextButton(
                label: "Pick Image",

              ),
              // Text("data"),
            ],
          ),
        ),
      ),
      floatingActionButton: MyTextButton(
        onTap: () {
          print("object");
          // shopViewModel.uploadProduct(context);
        },
        label: "Ajouter produit",
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }

  Form buildForm(BuildContext context) {
    return Form(
      child: Column(
        children: [
          NameTextField(
            title: "Nom de produit",
            controller: nameController,
            onChanged: (val) {
            },
          ),
          const SizedBox(height: 10),
          NumberTextField(
            title: "Prix vendent",
            controller: priceController,
            onChanged: (val) {
            },
          ),
          const SizedBox(height: 10),
          NameTextField(
            title: "Category",
            controller: categoryController,
            onChanged: (val) {
            },
          ),
          // SizedBox(height: 10),
          // NameTextField(
          //   title: "Image",
          //   controller: imageController,
          //   onChanged: (val) {
          //     viewModel.setImage(val);
          //   },
          // ),
        ],
      ),
    );
  }
}
