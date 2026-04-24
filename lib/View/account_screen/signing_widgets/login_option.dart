import 'package:flutter/material.dart';

class LoginOptions extends StatelessWidget {
  const LoginOptions({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset('assets/images/facbook.png', width: 50),
        const SizedBox(width: 45),
        Image.asset('assets/images/gmail.png', width: 50),
      ],
    );
  }
}
