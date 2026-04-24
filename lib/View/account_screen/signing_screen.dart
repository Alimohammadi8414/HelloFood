import 'package:flutter/material.dart';
import 'package:hellofood/view/theme.dart';
import 'package:hellofood/view/account_screen/signing_widgets/divider_widget.dart';
import 'package:hellofood/view/account_screen/signing_widgets/login_option.dart';
import 'package:hellofood/view/account_screen/signing_widgets/sign_button_widget.dart';
import 'package:hellofood/view/account_screen/signing_widgets/signing_switch_text.dart';
import 'package:hellofood/view/account_screen/utils/text_field_widget.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

bool securePassword = false;
bool secureConfirmPassword = false;
bool haveAnAccount = true;

class _SignUpScreenState extends State<SignUpScreen> {
  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.fromLTRB(16, 100, 16, 20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Hello Food Logo
              Image.asset('assets/images/ic_food_express.png', width: 250),
              const SizedBox(height: 50),

              // name & lastname
              if (!haveAnAccount)
                Row(
                  spacing: 10,
                  children: [
                    // Name
                    TextFieldWidget(
                      hinttext: "First Name",
                      obscure: false,
                      prefixIcon: null,
                      suffixIcon: null,
                      width: MediaQuery.sizeOf(context).width / 2 - 21,
                      height: 54,
                    ),

                    //  Last Name
                    TextFieldWidget(
                      hinttext: 'Last Name',
                      obscure: false,
                      prefixIcon: null,
                      suffixIcon: null,
                      width: MediaQuery.sizeOf(context).width / 2 - 21,
                      height: 54,
                    ),
                  ],
                ),

              const SizedBox(height: 15),

              // Phone Number
              TextFieldWidget(
                hinttext: "Phone",
                obscure: false,
                prefixIcon: Icon(
                  Icons.phone,
                  color: AppColors.heavyGray.withValues(alpha: 0.7),
                  size: 20,
                ),
                suffixIcon: null,
                width: MediaQuery.sizeOf(context).width,
                height: 54,
              ),

              const SizedBox(height: 15),

              // Password
              TextFieldWidget(
                hinttext: 'Password',
                obscure: securePassword,
                prefixIcon: Icon(
                  Icons.lock_outline_rounded,
                  color: AppColors.heavyGray.withValues(alpha: 0.7),
                  size: 20,
                ),
                suffixIcon: IconButton(
                  iconSize: 20,
                  color: AppColors.heavyGray.withValues(alpha: 0.7),
                  onPressed: () {
                    setState(() {
                      securePassword = !securePassword;
                    });
                  },
                  icon:
                      securePassword
                          ? Icon(Icons.visibility)
                          : Icon(Icons.visibility_off),
                ),
                width: MediaQuery.sizeOf(context).width,
                height: 54,
              ),

              const SizedBox(height: 15),

              // Confirm Password
              if (!haveAnAccount)
                TextFieldWidget(
                  hinttext: "Confirm Password",
                  obscure: secureConfirmPassword,
                  prefixIcon: Icon(
                    Icons.lock_outline_rounded,
                    color: AppColors.heavyGray.withValues(alpha: 0.7),
                    size: 20,
                  ),
                  suffixIcon: IconButton(
                    iconSize: 20,
                    color: AppColors.heavyGray.withValues(alpha: 0.7),
                    onPressed: () {
                      setState(() {
                        secureConfirmPassword = !secureConfirmPassword;
                      });
                    },
                    icon:
                        secureConfirmPassword
                            ? Icon(Icons.visibility)
                            : Icon(Icons.visibility_off),
                  ),
                  width: MediaQuery.sizeOf(context).width,
                  height: 54,
                ),

              const SizedBox(height: 35),

              // Sign  Button
              SignButtonWidget(),

              const SizedBox(height: 20),

              // Divider
              DividerWidget(),
              const SizedBox(height: 20),

              // Other login Options
              LoginOptions(),

              haveAnAccount ? SizedBox(height: 158) : SizedBox(height: 50),

              //  Switch to Sign in
              SigningSwitchTextWidget(
                haveAnAccount: haveAnAccount,
                tap: () {
                  setState(() {
                    haveAnAccount = !haveAnAccount;
                  });
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
