import 'package:flutter/material.dart';
import 'package:mokpos/app/view/cashier_screens/cashier_main_screen.dart';
import 'package:mokpos/app/view/main_screen.dart';
import 'package:mokpos/app/view/onboarding_screens/custom_button.dart';
import 'package:mokpos/widgets/mock_dialog.dart';

import '../../../base/constant.dart';
import '../../../base/my_colors.dart';
import '../../../widgets/back_button_black.dart';
import '../../../widgets/email_text_field.dart';
import '../../../widgets/password_field.dart';

class LoginAsOwnerScreen extends StatefulWidget {
  const LoginAsOwnerScreen({super.key});

  @override
  State<LoginAsOwnerScreen> createState() => _LoginAsOwnerScreenState();
}

class _LoginAsOwnerScreenState extends State<LoginAsOwnerScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();

  String otpMethod = "Email";

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
          "Login",
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
                  const SizedBox(height: 20),
                  const Align(
                    alignment: Alignment.bottomLeft,
                    child: Text(
                      "Send OTP:",
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  CustomSmallButton(
                    isSelected: otpMethod == "Email",
                    label: "Email",
                    icon: Icons.mail_outlined,
                    onTap: () => changeOtpMethod("Email"),
                  ),
                  const SizedBox(height: 10),
                  CustomSmallButton(
                    isSelected: otpMethod == "SMS",
                    label: "SMS",
                    icon: Icons.message,
                    onTap: () => changeOtpMethod("SMS"),
                  ),
                  const SizedBox(height: 40),
                  // Spacer(),
                  CustomButton(
                    label: "Login",
                    onTap: () {
                      // loginProvider.login(context, "Owner");
                      showDialog(
                          context: context,
                          builder: (context) {
                            return MockDialog(
                              title: "Heyyo!",
                              content: "Where Do you wanna Go?",
                              leftButtonText: "Cashier Main Screen",
                              rightButtonText: "Main Screen",
                              onLeftButtonTap: () => Constant.navigatePush(
                                context,
                                CashierMainScreen(),
                              ),
                              onRightButtonTap: () => Constant.navigatePush(
                                context,
                                MainScreen(),
                              ),
                            );
                          });
                    },
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    "Forgot Password",
                    style: TextStyle(
                      decoration: TextDecoration.underline,
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  // Spacer(),
                  const SizedBox(height: 40),
                ],
              ),
            ),
          )

    );
  }

  Widget buildForm( BuildContext context) {
    return Form(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      child: Column(
        children: [
          EmailTextField(
            controller: emailController,
            onChanged: (String val) {
              print(val);
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
