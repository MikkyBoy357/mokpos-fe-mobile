import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mokpos/app/view/onboarding_screens/custom_button.dart';
import 'package:mokpos/base/constant.dart';
import 'package:mokpos/base/my_colors.dart';
import 'package:mokpos/widgets/back_button_black.dart';
import 'package:mokpos/widgets/email_text_field.dart';

import '../../../widgets/password_field.dart';
import '../../../widgets/phone_text_field.dart';
import '../main_screen.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();
  TextEditingController phoneController = TextEditingController();

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
              "Sign Up",
              style: TextStyle(
                color: MyColors().myGreen,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(height: 20),
                  buildForm(context),
                  const SizedBox(height: 40),
                  CustomButton(
                    label: "Sign up",
                    onTap: () => Navigator.of(context).pushReplacement(
                      CupertinoPageRoute(
                        builder: (_) => MainScreen(),
                      ),
                    ),
                  ),
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
          EmailTextField(
            controller: emailController,
            onChanged: (String val) {
            },
          ),
          const SizedBox(height: 20),
          PhoneTextField(
            controller: phoneController,
            onChanged: (String val) {
            },
          ),
          const SizedBox(height: 20),
          PasswordField(
            controller: passController,
            title: "Password",
            hintText: "at least 8 characters",
            onChanged: (String val) {

            },
          ),
        ],
      ),
    );
  }
}
