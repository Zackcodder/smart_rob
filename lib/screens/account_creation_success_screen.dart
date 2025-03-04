import 'package:flutter/material.dart';
import 'package:smart_rob/core/constants/text_string.dart';

import '../core/constants/colors.dart';
import '../core/constants/text_style.dart';

class AccountCreationSuccessScreen extends StatelessWidget {
  const AccountCreationSuccessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.symmetric(vertical: 40, horizontal: 20),
        child: Column(
          spacing: 20,
          children: [
            SizedBox(
              height: 50,
            ),

            ///checker icon
            Icon(
              Icons.check_circle,
              color: kcLightBlue,
              size: 44,
            ),

            ///Account created text
            Text(
              ksAccountCreated,
              style: ktsSelectCountryHeader,
            ),

            ///congratulation msg
            Text(
              textAlign: TextAlign.center,
              ksSuccessAccountCreationMsg,
              style: ktsTextFieldHint,
            ),
            Spacer(),
            GestureDetector(
              onTap: null,
              child: Container(
                height: 50,
                decoration: BoxDecoration(
                    color: kcDeepBlue, borderRadius: BorderRadius.circular(12)),
                child: Center(
                  child: Text(
                    ksGoHome,
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
