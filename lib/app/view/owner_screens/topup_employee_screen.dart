import 'package:flutter/material.dart';
import 'package:mokpos/widgets/error_dialog.dart';
import 'package:mokpos/widgets/number_text_field.dart';

import '../../../widgets/back_button_black.dart';

class TopupEmployeeScreen extends StatefulWidget {
  const TopupEmployeeScreen({super.key});

  @override
  State<TopupEmployeeScreen> createState() => _TopupEmployeeScreenState();
}

class _TopupEmployeeScreenState extends State<TopupEmployeeScreen> {
  TextEditingController topupAmtController = TextEditingController();

  @override
  void didChangeDependencies() {
    Navigator.of(context);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {

        return Scaffold(
          appBar: AppBar(
            title: const Text("Topup Employee"),
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              children: [
                const SizedBox(height: 20),
                NumberTextField(
                  title: "Topup Amount (Min: CFA 20})",
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
            label: "PROCEED",
            backgroundColor: Colors.green,
            onTap: () {
                showDialog(
                  context: context,
                  builder: (dcontext) {
                    return ConfirmDialog(
                      title: "Confirm Topup",
                      text:
                          "Do you want to proceed with topup CFA 200 for Employee Med..1222",
                      onYes: () async {
                        Navigator.of(context).pop(context);
                      },
                    );
                  },
                );

            },
          ),
        );


  }
}
