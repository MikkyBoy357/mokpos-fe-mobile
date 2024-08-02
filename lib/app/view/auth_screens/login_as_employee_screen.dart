import 'package:flutter/material.dart';
import 'package:mokpos/app/view/cashier_screens/cashier_main_screen.dart';
import 'package:mokpos/app/view/onboarding_screens/custom_button.dart';
import 'package:mokpos/app/view/topup_screens/topup_main_screen.dart';
import 'package:mokpos/widgets/mock_dialog.dart';
import 'package:mokpos/widgets/number_text_field.dart';

import '../../../base/constant.dart';
import '../../../base/my_colors.dart';
import '../../../widgets/back_button_black.dart';
import '../../../widgets/password_field.dart';

class LoginAsEmployeeScreen extends StatefulWidget {
  const LoginAsEmployeeScreen({super.key});

  @override
  State<LoginAsEmployeeScreen> createState() => _LoginAsEmployeeScreenState();
}

class _LoginAsEmployeeScreenState extends State<LoginAsEmployeeScreen> {
  String otpMethod = "Email";

  TextEditingController codeController = TextEditingController();
  TextEditingController passController = TextEditingController();

  void changeOtpMethod(String val) {
    otpMethod = val;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            MyBackButton(
              onTap: () => Constant.backToPrev(context),
            ),
          ],
        ),
        title: Text(
          "Login as Employee",
          style: TextStyle(
            color: MyColors().myGreen,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      body:
           Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(height: 20),
                  buildForm(context),
                  const SizedBox(height: 40),
                  // Spacer(),
                  CustomButton(
                    label: "Login",
                    onTap: () {
                      // loginProvider.loginAsCashier(context);
                      showDialog(
                        context: context,
                        builder: (context) => MockDialog(
                          title: "Heyyo",
                          content: "Where do you wanna go?",
                          leftButtonText: "Cashier Main Screen",
                          rightButtonText: "Top Up Main Screen",
                          onLeftButtonTap: () => Constant.navigatePush(
                            context,
                            CashierMainScreen(),
                          ),
                          onRightButtonTap: () => Constant.navigatePush(
                            context,
                            TopupMainScreen(),
                          ),
                        ),
                      );
                    },
                  ),
                  const SizedBox(height: 40),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        color: const Color(0XFF1A72DD).withOpacity(0.1)),
                    child: const Text(
                      "Use the cashier code that can be created by the Owner in Manage Store -> Cashier Code",
                    ),
                  ),
                  // Spacer(),
                  const SizedBox(height: 40),
                ],
              ),
            ),
          ),

    );
  }

  Widget buildForm( BuildContext context) {
    return Form(

      autovalidateMode: AutovalidateMode.onUserInteraction,
      child: Column(
        children: [
          NumberTextField(
            title: "Employee Code",
            hintText: "0000",
            controller: codeController,
            onChanged: (String val) {
            },
          ),
          const SizedBox(height: 20),
          PasswordField(
            controller: passController,
            title: "Password",
            hintText: "At least 8 characters",
            onChanged: (String val) {
            },
          ),
        ],
      ),
    );
  }
}
