import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hellofood/model/food_&_user.dart';
import 'package:hellofood/view/account_screen/account_screen.dart';
import 'package:hellofood/view/account_screen/signing_screen.dart';
import 'package:hellofood/view/account_screen/verification_screen.dart';
import 'package:hellofood/view/theme.dart';
import 'package:hive/hive.dart';

var font = 'assets/fonts/Roboto-Regular.ttf';
var fontsize = 16.0;

class SignUpProvider extends ChangeNotifier {
  var box = Hive.box<User>('User');

  Future<void> signUp(
    BuildContext context, {
    required String name,
    required String lastName,
    required int phone,
    required String password,
  }) async {
    await box.add(
      User(name: name, lastName: lastName, phone: phone, password: password),
    );
    if (context.mounted) {
      Focus.of(context).unfocus();
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) {
            return VerificationScreen();
          },
        ),
      );
    }
    nameController.clear();
    lastNameController.clear();
    phoneController.clear();
    passwordController.clear();
    confirmPasswordController.clear();
    notifyListeners();
  }

  Future<void> signIn(BuildContext context) async {
    if (box.values.first.phone == int.tryParse(phoneController.text) &&
        box.values.first.password == passwordController.text) {
      phoneController.clear();
      passwordController.clear();
      Focus.of(context).unfocus();
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) {
            return AccountScreen();
          },
        ),
      );
    } else {
      Focus.of(context).unfocus();
      await Fluttertoast.showToast(
        msg: "  Phone number or Password isn't correct  ",
        backgroundColor: AppColors.heavyGray,
        fontSize: fontsize,
        fontAsset: font,
        gravity: ToastGravity.BOTTOM,
        textColor: AppColors.white,
        toastLength: Toast.LENGTH_SHORT,
      );
    }
  }

  bool isSignedin() {
    if (box.isNotEmpty) {
      return true;
    }
    return false;
  }

  bool havAccount() {
    if (box.isNotEmpty) {
      return true;
    }
    return false;
  }

  Future<void> clear(BuildContext context) async {
    await box.clear();
    if (context.mounted) {
      Navigator.pop(context);
    }
    notifyListeners();
  }

  Future<void> verify(BuildContext context) async {
    if (pincontroller.text.isEmpty) {
      await Fluttertoast.showToast(
        msg: 'Code is not valid',
        fontAsset: font,
        backgroundColor: AppColors.lightRed,
        fontSize: fontsize,
        gravity: ToastGravity.BOTTOM,
        toastLength: Toast.LENGTH_SHORT,
        textColor: AppColors.white,
      );
    } else {
      pincontroller.clear();
      await Fluttertoast.showToast(
        msg: "You're signed up successfully",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: AppColors.green,
        fontAsset: font,
        textColor: AppColors.white,
        fontSize: fontsize,
      );
      if (context.mounted) {
        Navigator.pop(context);
      }
    }
  }
}
