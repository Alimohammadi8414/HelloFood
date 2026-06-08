import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hellofood/view/theme.dart';

class TextFormFieldWidget extends StatelessWidget {
  const TextFormFieldWidget({
    required this.obscure,
    required this.width,
    required this.height,
    required this.textCapitalization,
    this.hinttext,
    this.prefixIcon,
    this.suffixIcon,
    this.controller,
    this.inputFormatters,
    this.keybourdtype,
    this.validator,
    super.key,
  });
  final TextCapitalization textCapitalization;
  final String? hinttext;
  final bool obscure;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final double? width;
  final double? height;
  final TextEditingController? controller;
  final TextInputType? keybourdtype;
  final List<TextInputFormatter>? inputFormatters;
  final String? Function(String? value)? validator;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: TextFormField(
        textCapitalization: textCapitalization,
        validator: validator,
        keyboardType: keybourdtype,
        inputFormatters: inputFormatters,
        controller: controller,
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
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: BorderSide.none,
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: BorderSide.none,
          ),
          errorStyle: Theme.of(
            context,
          ).textTheme.bodySmall!.copyWith(color: AppColors.lightRed),
          filled: true,
          fillColor: AppColors.gray.withValues(alpha: 0.2),
        ),
      ),
    );
  }
}
