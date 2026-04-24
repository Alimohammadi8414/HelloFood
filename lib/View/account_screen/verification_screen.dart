import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hellofood/view/theme.dart';
import 'package:hellofood/view/account_screen/signing_screen.dart';

class VerificationScreen extends StatefulWidget {
  const VerificationScreen({super.key});

  @override
  State<VerificationScreen> createState() => _VerificationScreenState();
}

TextEditingController firstDigit = TextEditingController();
TextEditingController secondDigit = TextEditingController();
TextEditingController thirdDigit = TextEditingController();
TextEditingController fourthDigit = TextEditingController();

class _VerificationScreenState extends State<VerificationScreen> {
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
            const SizedBox(height: 35),

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
            const SizedBox(height: 20),

            // CodeInputTextFielad
            Form(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,

                children: [
                  CodeInputTextFielad(texController: firstDigit),
                  CodeInputTextFielad(texController: secondDigit),
                  CodeInputTextFielad(texController: thirdDigit),
                  CodeInputTextFielad(texController: fourthDigit),
                ],
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
                onTap: () {
                  setState(() {
                    if (firstDigit.text.isEmpty ||
                        secondDigit.text.isEmpty ||
                        thirdDigit.text.isEmpty ||
                        fourthDigit.text.isEmpty) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          shape: BeveledRectangleBorder(
                            borderRadius: BorderRadiusGeometry.circular(10),
                          ),
                          backgroundColor: AppColors.lightRed,
                          behavior: SnackBarBehavior.floating,
                          width: 250,
                          dismissDirection: DismissDirection.horizontal,
                          content: Text(
                            textAlign: TextAlign.center,
                            'Code is not valid',
                            style: Theme.of(context).textTheme.bodyMedium!
                                .copyWith(color: AppColors.white),
                          ),
                        ),
                      );
                    } else {
                      Navigator.pop(context);
                      haveAnAccount = true;
                      firstDigit.clear();
                      secondDigit.clear();
                      thirdDigit.clear();
                      fourthDigit.clear();
                    }
                  });
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

class CodeInputTextFielad extends StatelessWidget {
  const CodeInputTextFielad({required this.texController, super.key});
  final TextEditingController texController;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 70,
      width: 85,
      child: TextFormField(
        minLines: null,
        maxLines: null,
        expands: true,
        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
          fontSize: 24,
          color: AppColors.heavyGray,
        ),
        controller: texController,
        textInputAction: TextInputAction.next,
        inputFormatters: [
          LengthLimitingTextInputFormatter(1),
          FilteringTextInputFormatter.digitsOnly,
        ],
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(horizontal: 32),
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
            borderSide: BorderSide(color: AppColors.lightRed),
          ),
          focusedErrorBorder: OutlineInputBorder(
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
