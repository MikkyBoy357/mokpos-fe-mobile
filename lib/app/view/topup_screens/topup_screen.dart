import 'package:flutter/material.dart';
import 'package:mokpos/widgets/employee_drawer.dart';
import 'package:mokpos/widgets/number_text_field.dart';

import '../../../widgets/back_button_black.dart';

class TopupScreen extends StatefulWidget {
  const TopupScreen({super.key});

  @override
  State<TopupScreen> createState() => _TopupScreenState();
}

class _TopupScreenState extends State<TopupScreen> {
  TextEditingController topupAmtController = TextEditingController();
  @override
  Widget build(BuildContext context) {

        return Scaffold(
          appBar: AppBar(
            // automaticallyImplyLeading: false,
            title: const Text("Recharger un client"),
          ),
          drawer: const EmployeeDrawer(),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              children: [
                const SizedBox(height: 20),
                NumberTextField(
                  title:
                      "Montant à recharger (Min: CFA 300})",
                  controller: topupAmtController,
                  onChanged: (val) {
                  },
                ),
              ],
            ),
          ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerFloat,
          floatingActionButton: MyTextButton(
            margin: const EdgeInsets.symmetric(horizontal: 20),
            label: "Recharger",
            backgroundColor: Colors.green,
            onTap: () {


            },
          ),
        );

  }
}
