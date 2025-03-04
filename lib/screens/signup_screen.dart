import 'package:flutter/material.dart';
import 'package:smart_rob/core/constants/colors.dart';
import 'package:smart_rob/core/constants/text_string.dart';
import 'package:smart_rob/core/constants/text_style.dart';
import 'package:smart_rob/screens/account_creation_success_screen.dart';

import '../widgets/signup_steps.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  int currentStep = 0;

  void nextStep() {
    setState(() {
      if (currentStep < 2) {
        currentStep++;
      } else {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const AccountCreationSuccessScreen(),
          ),
        );
      }
    });
  }

  Widget buildStepContent() {
    switch (currentStep) {
      case 0:
        return BasicInfoStep(nextStep: nextStep);
      case 1:
        return AddEmailStep(nextStep: nextStep);
      case 2:
        return PasswordStep(nextStep: nextStep);
      default:
        return SizedBox();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 20, vertical: 40),
        child: Column(
          children: [
            ///header with back button, signin buttn n logo
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ///back button
                IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(
                    Icons.arrow_back,
                    color: kcBlack,
                  ),
                ),

                ///logo
                Image.asset(
                  'assets/logo.png',
                  color: kcDeepBlue,
                  height: 50,
                  width: 50,
                ),

                ///sign text button
                TextButton(
                    onPressed: null,
                    child: Text(
                      ksLogin,
                      style: TextStyle(
                          color: kcLightBlue,
                          fontWeight: FontWeight.w400,
                          fontFamily: 'Montserrat',
                          fontSize: 14,
                          fontStyle: FontStyle.normal),
                    ))
              ],
            ),
            SizedBox(
              height: 20,
            ),

            ///lets get you started
            Text(
              ksLetGetYouStarted,
              style: ktsSelectCountryHeader,
            ),
            SizedBox(
              height: 20,
            ),

            ///entner your detials hint
            Text(
              ksEnterYourDetails,
              textAlign: TextAlign.center,
              style: ktsTextFieldHint,
            ),

            SizedBox(
              height: 20,
            ),

            buildStepContent(),
            Spacer(),
            GestureDetector(
              onTap: nextStep,
              child: Container(
                height: 50,
                decoration: BoxDecoration(
                    color: kcDeepBlue,
                    // _countryController.text.isEmpty
                    //     ? kcLightBlue.withOpacity(0.3)
                    //     : kcDeepBlue,
                    borderRadius: BorderRadius.circular(12)),
                child: Center(
                  child: Text(
                    currentStep == 2 ? ksCreateAccount : ksContinue,
                    style: ktsAuthButtonTextStyle.copyWith(color: kcWhite),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
