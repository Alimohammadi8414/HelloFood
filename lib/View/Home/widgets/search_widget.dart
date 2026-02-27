import 'package:flutter/material.dart';
import 'package:hellofood/theme.dart';

class SearchWidget extends StatelessWidget {
  const SearchWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
      style: Theme.of(context).textTheme.bodyMedium,
      textInputAction: TextInputAction.done,
      cursorErrorColor: AppColors.heavyGray,
      cursorColor: AppColors.heavyGray,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(vertical: 23.0),
        hintText: 'What would you like to buy?',
        hintStyle: Theme.of(context).textTheme.bodySmall!.copyWith(
          fontSize: 17,
          color: AppColors.gray,
          fontWeight: FontWeight.w500,
        ),
        iconColor: AppColors.lightRed,
        suffixIcon: IconButton(
          onPressed: () {},
          icon: Image.asset(
            'assets/images/ic_search_menu.png',
            height: 18,
            width: 18,
          ),
        ),
        prefixIcon: IconButton(
          onPressed: () {},
          icon: Icon(Icons.search_outlined, color: AppColors.lightRed),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(6.0),
          borderSide: BorderSide(color: AppColors.gray),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(6.0),
          borderSide: BorderSide(color: AppColors.gray),
        ),
      ),
    );
  }
}
