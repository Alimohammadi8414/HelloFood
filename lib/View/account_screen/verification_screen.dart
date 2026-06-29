import 'package:flutter/material.dart';
import 'package:hellofood/view/theme.dart';
import 'package:hellofood/viewmodel/sign_up_provider.dart';
import 'package:pinput/pinput.dart';
import 'package:provider/provider.dart';

class VerificationScreen extends StatefulWidget {
  const VerificationScreen({super.key});

  @override
  State<VerificationScreen> createState() => _VerificationScreenState();
}

class _VerificationScreenState extends State<VerificationScreen> {
  final TextEditingController pinPutController = TextEditingController();

  @override
  void dispose() {
    pinPutController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.fromLTRB(16, 100, 16, 50),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // verification text
            Text(
              'Verification',
              style: Theme.of(
                context,
              ).textTheme.bodyLarge!.copyWith(fontSize: 25),
            ),
            const SizedBox(height: 15),

            Row(
              children: [
                Text(
                  "Please enter 4-digit code you'v recieved via ",
                  style: Theme.of(context).textTheme.bodyMedium,
                ),

                Text(
                  'SMS',
                  style: Theme.of(
                    context,
                  ).textTheme.bodyMedium!.copyWith(fontWeight: FontWeight.w700),
                ),
              ],
            ),
            const SizedBox(height: 45),

            // verification code input
            Center(
              child: Pinput(
                length: 4,
                keyboardType: TextInputType.number,
                defaultPinTheme: PinTheme(
                  height: 70,
                  width: 85,
                  decoration: BoxDecoration(
                    border: BoxBorder.all(),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  textStyle: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    fontSize: 24,
                    color: AppColors.heavyGray,
                  ),
                ),
                controller: pinPutController,
              ),
            ),
            SizedBox(height: 50),

            // Verify Button
            Ink(
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
                  await context.read<SignUpProvider>().verify(
                    context,
                    pinPutController,
                  );
                },
                child: Center(
                  child: Text(
                    'Verify',
                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      fontSize: 20,
                      color: AppColors.white,
                    ),
                  ),
                ),
              ),
            ),

            SizedBox(height: 20),

            // Resend Code Button
            Center(
              child: Column(
                children: [
                  Text(
                    "don't recieve any code?",
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  const SizedBox(height: 3),
                  GestureDetector(
                    onTap: () {},
                    behavior: HitTestBehavior.opaque,
                    child: Text(
                      'resend new code',
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        color: Colors.pinkAccent,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
