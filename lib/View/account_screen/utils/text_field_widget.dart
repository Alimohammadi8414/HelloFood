import 'package:flutter/material.dart';
import 'package:hellofood/view/theme.dart';

class TextFieldWidget extends StatelessWidget {
  const TextFieldWidget({
    required this.hinttext,
    required this.obscure,
    required this.prefixIcon,
    required this.suffixIcon,
    required this.width,
    required this.height,
    super.key,
  });
  final String hinttext;
  final bool obscure;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: TextField(
        obscureText: obscure,

        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
          fontSize: 18,
          color: AppColors.heavyGray,
        ),
        decoration: InputDecoration(
          prefixIcon: prefixIcon,
          suffixIcon: suffixIcon,
          hintText: hinttext,
          hintFadeDuration: Duration(milliseconds: 500),
          hintStyle: Theme.of(context).textTheme.bodyLarge!.copyWith(
            fontSize: 18,
            color: AppColors.heavyGray.withValues(alpha: 0.6),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(10.0),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: BorderSide.none,
          ),
          filled: true,
          fillColor: AppColors.gray.withValues(alpha: 0.2),
        ),
      ),
    );
  }
}
