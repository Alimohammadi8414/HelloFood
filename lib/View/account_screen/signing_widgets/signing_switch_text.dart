import 'package:flutter/material.dart';

class SigningSwitchTextWidget extends StatelessWidget {
  const SigningSwitchTextWidget({
    required this.tap,
    required this.haveAnAccount,
    super.key,
  });

  final bool haveAnAccount;
  final void Function() tap;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        haveAnAccount
            ? Text(
              "Don't have an acount? ",
              style: Theme.of(context).textTheme.bodyMedium,
            )
            : Text(
              'Already have an account? ',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
        GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: () {
            tap();
          },
          child:
              haveAnAccount
                  ? Text(
                    ' Sign up',
                    style: Theme.of(
                      context,
                    ).textTheme.bodyMedium!.copyWith(color: Colors.pinkAccent),
                  )
                  : Text(
                    ' Sign in',
                    style: Theme.of(
                      context,
                    ).textTheme.bodyMedium!.copyWith(color: Colors.pinkAccent),
                  ),
        ),
      ],
    );
  }
}
