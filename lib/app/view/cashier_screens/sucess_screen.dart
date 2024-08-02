import 'package:flutter/material.dart';
import 'package:mokpos/widgets/back_button_black.dart';


class SuccessScreen extends StatelessWidget {
  final String title;
  final String description;

  const SuccessScreen({
    super.key,
    this.title = "Successful Registered",
    this.description = "NOTE: Do not forget to smile for customers.",
  });

  @override
  Widget build(BuildContext context) {

        return Scaffold(
          backgroundColor: Colors.green,
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Spacer(),
                const SizedBox(height: 150),
                Center(
                  child: CircleAvatar(
                    radius: 100,
                    backgroundColor: const Color(0xFF2171C6).withOpacity(0.05),
                    child: const CircleAvatar(
                      foregroundColor: Colors.green,
                      radius: 60,
                      child: Icon(
                        Icons.check,
                        size: 100,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 30),
                Text(
                  title,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  description,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 30),
                const MyTextButton(
                  margin: EdgeInsets.symmetric(horizontal: 20),
                  label:
                      "Balance : CFA 200",
                  backgroundColor: Colors.white,
                  textColor: Colors.black,
                ),
                // Spacer(),
              ],
            ),
          ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerFloat,
          floatingActionButton: const MyTextButton(
            // onTap: () {
            //   customerViewModel.resetcustomerData();
            //   shopViewModel.clearCart();
            //
            //   Constant.navigatePushReplacement(
            //     context,
            //     WillPopScope(
            //       onWillPop: () async => false,
            //       child:
            //           "${employeeViewModel.loggedInEmployee?.employeeType}" ==
            //                   "cashier"
            //               ? CashierMainScreen()
            //               : TopupMainScreen(),
            //     ),
            //   );
            // },
            margin: EdgeInsets.symmetric(horizontal: 20),
            label: "DONE",
          ),
        );

  }
}
