import 'package:flutter/material.dart';
import 'package:smart_rob/core/constants/colors.dart';
import 'package:smart_rob/core/constants/text_string.dart';
import 'package:smart_rob/core/constants/text_style.dart';
import 'package:smart_rob/widgets/formfield_input.dart';

class BasicInfoStep extends StatefulWidget {
  final VoidCallback nextStep;
  const BasicInfoStep({super.key, required this.nextStep});

  @override
  State<BasicInfoStep> createState() => _BasicInfoStepState();
}

class _BasicInfoStepState extends State<BasicInfoStep> {
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _emailAddressController = TextEditingController();
  final TextEditingController _phoneNumberController = TextEditingController();

  bool _checkControllerState() {
    return _firstNameController.text.isNotEmpty &&
        _lastNameController.text.isNotEmpty &&
        _emailAddressController.text.isNotEmpty &&
        _phoneNumberController.text.isNotEmpty;
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        spacing: 25,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ///tab name
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ///basic info
              Container(
                padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  color: kcDeepBlack,
                ),
                child: Row(
                  spacing: 10,
                  children: [
                    Text(
                      ksBasicInfo,
                      style: ktsSignUpStepTabTextStyle,
                    ),
                    _checkControllerState()
                        ? Icon(
                            Icons.check,
                            color: kcWhite,
                            size: 10,
                          )
                        : SizedBox()
                  ],
                ),
              ),

              ///Username
              Container(
                padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    color: kcWhite,
                    border: Border.all(color: kcDeepBlack.withOpacity(0.3))),
                child: Row(
                  spacing: 10,
                  children: [
                    Text(
                      ksUsername,
                      style: ktsSignUpUnstepTabTextStyle,
                    ),
                    Icon(
                      Icons.check,
                      color: kcWhite,
                      size: 10,
                    )
                  ],
                ),
              ),

              ///password
              Container(
                padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    color: kcWhite,
                    border: Border.all(color: kcDeepBlack.withOpacity(0.3))),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  spacing: 10,
                  children: [
                    Text(
                      ksPassword,
                      style: ktsSignUpUnstepTabTextStyle,
                    ),
                    Icon(
                      Icons.check,
                      color: kcWhite,
                      size: 10,
                    )
                  ],
                ),
              ),
            ],
          ),

          ///first name
          FormFieldWidget(
            labelText: ksFirstName,
            hintText: 'Stephen',
            borderColor: kcLightGrey,
            controller: _firstNameController,
          ),

          ///last name
          FormFieldWidget(
            labelText: ksLastName,
            controller: _lastNameController,
            hintText: 'Reign',
            borderColor: kcLightGrey,
          ),
          //email address
          FormFieldWidget(
            labelText: ksEmailAddress,
            controller: _emailAddressController,
            keyboardType: TextInputType.emailAddress,
            hintText: 'stephenreign@gmail.com',
            borderColor: kcLightGrey,
          ),

          ///phone number
          FormFieldWidget(
            labelText: ksPhoneNumber,
            controller: _phoneNumberController,
            keyboardType: TextInputType.number,
            hintText: '000000000',
            borderColor: kcLightGrey,
          ),
       
        ],
      ),
    );
  }
}

class AddEmailStep extends StatefulWidget {
  final VoidCallback nextStep;
  const AddEmailStep({super.key, required this.nextStep});

  @override
  State<AddEmailStep> createState() => _AddEmailStepState();
}

class _AddEmailStepState extends State<AddEmailStep> {
  final TextEditingController _preferredUserNameController =
      TextEditingController();
  final TextEditingController _referralCodeController = TextEditingController();

  bool _userNameControllerState() {
    return _preferredUserNameController.text.isNotEmpty;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 25,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ///tab name
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ///basic info
            Container(
              padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                color: kcDeepBlack,
              ),
              child: Row(
                spacing: 10,
                children: [
                  Text(
                    ksBasicInfo,
                    style: ktsSignUpStepTabTextStyle,
                  ),
                  Icon(
                    Icons.check,
                    color: kcWhite,
                    size: 10,
                  )
                ],
              ),
            ),

            ///Username
            Container(
              padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                color: kcDeepBlack,
                border: Border.all(
                  color: kcDeepBlack.withOpacity(0.3),
                ),
              ),
              child: Row(
                spacing: 10,
                children: [
                  Text(
                    ksUsername,
                    style: ktsSignUpStepTabTextStyle,
                  ),
                  _userNameControllerState()
                      ? Icon(
                          Icons.check,
                          color: kcWhite,
                          size: 10,
                        )
                      : SizedBox()
                ],
              ),
            ),

            ///password
            Container(
              padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  color: kcWhite,
                  border: Border.all(color: kcDeepBlack.withOpacity(0.3))),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                spacing: 10,
                children: [
                  Text(
                    ksPassword,
                    style: ktsSignUpUnstepTabTextStyle,
                  ),
                  Icon(
                    Icons.check,
                    color: kcWhite,
                    size: 10,
                  )
                ],
              ),
            ),
          ],
        ),

        ///prefeerd user name
        FormFieldWidget(
          labelText: ksYourPreferusername,
          hintText: ksUserNameHint,
          controller: _preferredUserNameController,
        ),

        ///referral code
        FormFieldWidget(
          labelText: ksReferralCode,
          hintText: ksOptional,
          controller: _referralCodeController,
        )
      ],
    );
  }
}

class PasswordStep extends StatefulWidget {
  final VoidCallback nextStep;
  const PasswordStep({super.key, required this.nextStep});

  @override
  State<PasswordStep> createState() => _PasswordStepState();
}

class _PasswordStepState extends State<PasswordStep> {
  final TextEditingController _createPasswordController =
      TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  bool _passwordControllerState() {
    return _createPasswordController.text.isNotEmpty &&
        _confirmPasswordController.text.isNotEmpty;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 25,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ///tab name
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ///basic info
            Container(
              padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                color: kcDeepBlack,
              ),
              child: Row(
                spacing: 10,
                children: [
                  Text(
                    ksBasicInfo,
                    style: ktsSignUpStepTabTextStyle,
                  ),
                  Icon(
                    Icons.check,
                    color: kcWhite,
                    size: 10,
                  )
                ],
              ),
            ),

            ///Username
            Container(
              padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                color: kcDeepBlack,
              ),
              child: Row(
                spacing: 10,
                children: [
                  Text(
                    ksUsername,
                    style: ktsSignUpStepTabTextStyle,
                  ),
                  Icon(
                    Icons.check,
                    color: kcWhite,
                    size: 10,
                  )
                ],
              ),
            ),

            ///password
            Container(
              padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  color: kcWhite,
                  border: Border.all(color: kcDeepBlack.withOpacity(0.3))),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                spacing: 10,
                children: [
                  Text(
                    ksPassword,
                    style: ktsSignUpUnstepTabTextStyle,
                  ),
                  Icon(
                    Icons.check,
                    color: kcWhite,
                    size: 10,
                  )
                ],
              ),
            ),
          ],
        ),

        ///create password
        FormFieldWidget(
          labelText: ksCreatePassword,
          hintText: 'xxxxx',
          obscureText: true,
  keyboardType: TextInputType.visiblePassword,
          controller: _createPasswordController,
        ),

        ///confirm password
        FormFieldWidget(
          labelText: ksConfirmPassword,
          hintText: 'xxxxxx',
          obscureText: true,
  keyboardType: TextInputType.visiblePassword,
          controller: _confirmPasswordController,
        )
      ],
    );
  }
}
