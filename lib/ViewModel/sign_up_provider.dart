import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hellofood/model/food_&_user.dart';
import 'package:hellofood/view/account_screen/account_screen.dart';
import 'package:hellofood/view/account_screen/verification_screen.dart';
import 'package:hellofood/view/root_screen.dart';
import 'package:hellofood/view/theme.dart';
import 'package:hive/hive.dart';

var font = 'assets/fonts/Roboto-Regular.ttf';
var fontsize = 16.0;

class SignUpProvider extends ChangeNotifier {
  var box = Hive.box<User>('User');
  int currentIndex = 0;

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
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) {
            return VerificationScreen();
          },
        ),
      );
    }
    notifyListeners();
  }

  Future<void> signIn(
    BuildContext context, {
    required String phoneController,
    required String passwordController,
  }) async {
    if (box.values.first.phone == int.tryParse(phoneController) &&
        box.values.first.password == passwordController) {
      Focus.of(context).unfocus();
      Navigator.pushReplacement(
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

  bool haveAccount() {
    if (box.isNotEmpty) {
      return true;
    }
    return false;
  }

  Future<void> clear(BuildContext context) async {
    await box.clear();
    if (context.mounted) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => RootScreen()),
      );
    }
    notifyListeners();
  }

  Future<void> verify(
    BuildContext context,
    TextEditingController controller,
  ) async {
    if (controller.text.isEmpty) {
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
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => RootScreen()),
        );
      }
    }
  }
}
