import 'package:flutter/material.dart';
import 'package:hellofood/view/theme.dart';
import 'package:hellofood/view/account_screen/signing_screen.dart';
import 'package:hellofood/view/account_screen/verification_screen.dart';

class SignButtonWidget extends StatelessWidget {
  const SignButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Ink(
      height: 55,
      width: MediaQuery.sizeOf(context).width,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.orangeAccent, Colors.pinkAccent],
          begin: Alignment.centerRight,
          end: Alignment.centerLeft,
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      child: InkWell(
        borderRadius: BorderRadius.circular(10),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) {
                return VerificationScreen();
              },
            ),
          );
          haveAnAccount = true;
        },
        child: Center(
          child:
              haveAnAccount
                  ? Text(
                    'SIGN IN',
                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      fontSize: 28,
                      color: AppColors.white,
                    ),
                  )
                  : Text(
                    'SIGN UP',
                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      fontSize: 28,
                      color: AppColors.white,
                    ),
                  ),
        ),
      ),
    );
  }
}
