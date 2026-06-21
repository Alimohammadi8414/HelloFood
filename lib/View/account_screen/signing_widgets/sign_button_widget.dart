import 'package:flutter/material.dart';
import 'package:hellofood/view/theme.dart';
import 'package:hellofood/view/account_screen/signing_screen.dart';
import 'package:hellofood/viewmodel/sign_up_provider.dart';
import 'package:provider/provider.dart';

class SignButtonWidget extends StatelessWidget {
  final TextEditingController nameController;
  final TextEditingController lastNameController;
  final TextEditingController passwordController;
  final TextEditingController phoneController;
  final TextEditingController confirmPasswordController;

  const SignButtonWidget({
    required this.nameController,
    required this.lastNameController,
    required this.phoneController,
    required this.passwordController,
    required this.confirmPasswordController,
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    var provider = context.watch<SignUpProvider>();
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
        onTap: () async {
          if (formKey.currentState!.validate()) {
            if (!provider.haveAccount()) {
              await provider.signUp(
                name: nameController.text,
                lastName: lastNameController.text,
                phone: int.tryParse(phoneController.text)!,
                password: passwordController.text,
                context,
              );
            } else {
              await provider.signIn(
                context,
                passwordController: passwordController.text,
                phoneController: phoneController.text,
              );
            }
          }
        },
        child: Center(
          child:
              provider.haveAccount()
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
