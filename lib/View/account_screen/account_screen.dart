import 'package:flutter/material.dart';
import 'package:hellofood/viewmodel/sign_up_provider.dart';
import 'package:provider/provider.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({super.key});

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(),
            ElevatedButton(
              onPressed: () async {
                await context.read<SignUpProvider>().clear(context);
              },
              child: Text('clear the box'),
            ),
          ],
        ),
      ),
    );
  }
}
