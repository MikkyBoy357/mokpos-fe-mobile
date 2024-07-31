// ignore_for_file: use_build_context_synchronously

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mokpos/app/model/employee_model.dart';
import 'package:mokpos/app/view_model/employee/employee_view_model.dart';
import 'package:provider/provider.dart';

import '../app/view_model/user/user_view_model.dart';
import '../util/firebase/firebase.dart';

class AuthService {
  User getCurrentUser() {
    User? user = firebaseAuth.currentUser;
    return user!;
  }

  Future<bool> createUser({
    required String name,
    User? user,
    required String email,
    required String phone,
    required String password,
  }) async {
    var res = await firebaseAuth.createUserWithEmailAndPassword(
      email: '$email',
      password: '$password',
    );
    if (res.user != null) {
      await saveUserToFirestore(name, res.user!, email, phone);
      return true;
    } else {
      return false;
    }
  }

  saveUserToFirestore(
      String name, User user, String email, String phone) async {
    await usersRef.doc(user.uid).set({
      "walletBalance": 1000,
      'username': name,
      'email': email,
      'time': Timestamp.now(),
      'id': user.uid,
      'bio': "",
      'phone': phone,
      'photoUrl': user.photoURL ?? ''
    });
  }

  Future<bool> loginUser(
      {required String email, required String password}) async {
    UserCredential res = await firebaseAuth.signInWithEmailAndPassword(
      email: '$email',
      password: '$password',
    );

    if (res.user != null) {
      return true;
    } else {
      return false;
    }
  }

  Future<bool> loginEmloyee(BuildContext context,
      {required String employeeCode, required String password}) async {
    print("==========> Login as Employee <=========");
    bool success = false;

    DocumentSnapshot<Object?> snap = await employeesRef.doc(employeeCode).get();

    if (!snap.exists) {
      print("Employee with code ${employeeCode} does not exist");
      success = false;
      return false;
    } else {
      final tempEmployee = snap.data() as Map<String, dynamic>;
      final tempObject = EmployeeModel.fromJson(tempEmployee);

      if (tempObject.employeeCode == employeeCode &&
          tempObject.password == password) {
        print("code and password are correct");
        Provider.of<EmployeeViewModel>(context, listen: false)
            .loggedInEmployee = tempObject;

        success = true;
      } else {
        print("code or password is INCORRECT");
        success = false;
      }
    }

    return success;
  }

  forgotPassword(String email) async {
    await firebaseAuth.sendPasswordResetEmail(email: email);
  }

  logOut(BuildContext context) async {
    Provider.of<UserViewModel>(context, listen: false).user = null;
    await firebaseAuth.signOut();
  }

  String handleFirebaseAuthError(String e) {
    if (e.contains("ERROR_WEAK_PASSWORD")) {
      return "Password is too weak";
    } else if (e.contains("invalid-email")) {
      return "Invalid Email";
    } else if (e.contains("ERROR_EMAIL_ALREADY_IN_USE") ||
        e.contains('email-already-in-use')) {
      return "The email address is already in use by another account.";
    } else if (e.contains("ERROR_NETWORK_REQUEST_FAILED")) {
      return "Network error occured!";
    } else if (e.contains("ERROR_USER_NOT_FOUND") ||
        e.contains('firebase_auth/user-not-found')) {
      return "Invalid credentials.";
    } else if (e.contains("ERROR_WRONG_PASSWORD") ||
        e.contains('wrong-password')) {
      return "Invalid credentials.";
    } else if (e.contains('firebase_auth/requires-recent-login')) {
      return 'This operation is sensitive and requires recent authentication.'
          ' Log in again before retrying this request.';
    } else {
      return e;
    }
  }
}
