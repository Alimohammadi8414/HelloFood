import 'package:flutter/material.dart';
import 'package:hellofood/view/theme.dart';

class SearchWidget extends StatelessWidget {
  const SearchWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 65,
      child: TextField(
        maxLines: null,
        minLines: null,
        expands: true,
        style: Theme.of(context).textTheme.labelLarge!.copyWith(
          fontSize: 18,
          fontWeight: FontWeight.w500,
        ),
        textInputAction: TextInputAction.search,
        decoration: InputDecoration(
          hintFadeDuration: Duration(milliseconds: 500),
          hintText: 'What would you like to buy?',
          hintStyle: Theme.of(context).textTheme.bodyLarge!.copyWith(
            fontSize: 18,
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
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: AppColors.gray),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: AppColors.gray),
          ),
        ),
      ),
    );
  }
}
