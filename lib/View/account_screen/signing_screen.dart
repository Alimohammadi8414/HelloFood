import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hellofood/view/theme.dart';
import 'package:hellofood/view/account_screen/signing_widgets/divider_widget.dart';
import 'package:hellofood/view/account_screen/signing_widgets/login_option.dart';
import 'package:hellofood/view/account_screen/signing_widgets/sign_button_widget.dart';
import 'package:hellofood/view/account_screen/utils/text_field_widget.dart';
import 'package:hellofood/viewmodel/sign_up_provider.dart';
import 'package:provider/provider.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

var securePassword = true;
var secureConfirmPassword = true;
var nameController = TextEditingController();
var lastNameController = TextEditingController();
var phoneController = TextEditingController();
var passwordController = TextEditingController();
var confirmPasswordController = TextEditingController();
var formState = GlobalKey<FormState>();

class _SignUpScreenState extends State<SignUpScreen> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.sizeOf(context);
    return Scaffold(
      backgroundColor: AppColors.white,
      body: Padding(
        padding: const EdgeInsets.fromLTRB(16, 16, 16, 16),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Hello Food Logo
              Image.asset(
                'assets/images/ic_food_express.png',
                width: 250,
                height: 165,
              ),
              const SizedBox(height: 40),
              Consumer<SignUpProvider>(
                builder: (context, value, child) {
                  return Form(
                    key: formState,
                    child: Column(
                      children: [
                        if (!value.havAccount())
                          Row(
                            spacing: 10,
                            children: [
                              // Name
                              TextFormFieldWidget(
                                textCapitalization: TextCapitalization.words,
                                hinttext: "First Name",
                                obscure: false,
                                width: size.width / 2 - 21,
                                height: 75,
                                controller: nameController,
                                keybourdtype: TextInputType.name,
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return "Pleas enter you're name";
                                  }
                                  return null;
                                },
                              ),

                              //  Last Name
                              TextFormFieldWidget(
                                textCapitalization: TextCapitalization.words,
                                hinttext: 'Last Name',
                                obscure: false,
                                width: size.width / 2 - 21,
                                height: 75,
                                controller: lastNameController,
                                keybourdtype: TextInputType.name,
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return "Pleas enter you're lastname";
                                  }
                                  return null;
                                },
                              ),
                            ],
                          ),

                        // Phone Number
                        TextFormFieldWidget(
                          textCapitalization: TextCapitalization.none,
                          hinttext: "Phone",
                          obscure: false,
                          prefixIcon: Icon(
                            Icons.phone,
                            color: AppColors.heavyGray.withValues(alpha: 0.7),
                            size: 20,
                          ),
                          width: size.width,
                          height: 75,
                          controller: phoneController,
                          keybourdtype: TextInputType.phone,
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly,
                            LengthLimitingTextInputFormatter(11),
                          ],
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Pleas enter you're phone number";
                            } else if (value.length < 11) {
                              return "Phone number is invalid";
                            }
                            return null;
                          },
                        ),

                        // Password
                        TextFormFieldWidget(
                          textCapitalization: TextCapitalization.none,
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
                          width: size.width,
                          height: 75,
                          controller: passwordController,
                          keybourdtype: TextInputType.visiblePassword,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Pleas enter you're password";
                            }
                            return null;
                          },
                        ),

                        // Confirm Password
                        if (!value.havAccount())
                          TextFormFieldWidget(
                            textCapitalization: TextCapitalization.none,
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
                                  secureConfirmPassword =
                                      !secureConfirmPassword;
                                });
                              },
                              icon:
                                  secureConfirmPassword
                                      ? Icon(Icons.visibility)
                                      : Icon(Icons.visibility_off),
                            ),
                            width: size.width,
                            height: 75,
                            controller: confirmPasswordController,
                            keybourdtype: TextInputType.visiblePassword,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "Pleas confirm you're passwords";
                              } else if (value != passwordController.text) {
                                return "Password doesn't match";
                              }
                              return null;
                            },
                          ),
                      ],
                    ),
                  );
                },
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

              // value.isSignedin()
              //     ? SizedBox(height: 178)
              //     : SizedBox(height: 30),

              //  Switch to Sign in
              // SigningSwitchTextWidget(
              //   haveAnAccount: value.isSignedin(),
              //   ontap: () {
              //     value.havAccount();
              //   },
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
