import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smart_rob/core/constants/colors.dart';
import 'package:smart_rob/core/constants/text_string.dart';
import 'package:smart_rob/core/constants/text_style.dart';
import 'package:smart_rob/widgets/formfield_input.dart';

import '../providers/authentication_provider.dart';

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
  final _formKey = GlobalKey<FormState>();

  bool _checkControllerState() {
    return _firstNameController.text.isNotEmpty &&
        _lastNameController.text.isNotEmpty &&
        _emailAddressController.text.isNotEmpty &&
        _phoneNumberController.text.isNotEmpty;
  }

  void _submitForm() async {
    if (!_formKey.currentState!.validate()) return;

    final authProvider = Provider.of<AuthProvider>(context, listen: false);

    bool success = await authProvider.registerStepOne(
      firstName: _firstNameController.text,
      lastName: _lastNameController.text,
      phoneNumber: _phoneNumberController.text,
      email: _emailAddressController.text,
      context: context,
    );

    if (success) {
      widget.nextStep(); // Move to the next step
    }
  }

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);
    return SingleChildScrollView(
      child: Form(
        key: _formKey,
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
              keyboardType: TextInputType.phone,
              hintText: '000000000',
              borderColor: kcLightGrey,
            ),

            ///continue button
            GestureDetector(
              onTap: authProvider.isLoading ? null : _submitForm,
              child: Container(
                margin: EdgeInsets.only(top: 40),
                height: 50,
                decoration: BoxDecoration(
                    color: kcLightBlue,
                    borderRadius: BorderRadius.circular(12)),
                child: Center(
                  child: authProvider.isLoading
                      ? CircularProgressIndicator(color: Colors.white)
                      : Text(
                          ksContinue,
                          style:
                              ktsAuthButtonTextStyle.copyWith(color: kcWhite),
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
  final _formKey = GlobalKey<FormState>();

  bool _userNameControllerState() {
    return _preferredUserNameController.text.isNotEmpty;
  }

  void _submitForm() {
    if (!_formKey.currentState!.validate()) return;

    // Store username & referral in AuthProvider
    final authProvider = Provider.of<AuthProvider>(context, listen: false);
    authProvider.setUsername(_preferredUserNameController.text.trim());
    authProvider.setReferral(_referralCodeController.text.trim());

    widget.nextStep(); // Move to Password Step
  }

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);
    return Form(
      key: _formKey,
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
          ),

          ///continue button
          GestureDetector(
            onTap: _submitForm,
            child: Container(
              margin: EdgeInsets.only(top: 40),
              height: 50,
              decoration: BoxDecoration(
                  color: kcLightBlue, borderRadius: BorderRadius.circular(12)),
              child: Center(
                child: authProvider.isLoading
                    ? CircularProgressIndicator(color: Colors.white)
                    : Text(
                        ksContinue,
                        style: ktsAuthButtonTextStyle.copyWith(color: kcWhite),
                      ),
              ),
            ),
          ),
        ],
      ),
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
  final _formKey = GlobalKey<FormState>();

  void _submitForm() async {
    if (!_formKey.currentState!.validate()) return;

    if (_confirmPasswordController.text.length < 8 ||
        _createPasswordController.text.length < 8) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Password should have at least 6 characters'),
          backgroundColor: Colors.red,
          duration: const Duration(seconds: 5),
        ),
      );
      return;
    } else if(_confirmPasswordController.text !=
        _createPasswordController.text){ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Password Mismatch. \nBoth password must be the same!'),
          backgroundColor: Colors.red,
          duration: const Duration(seconds: 5),
        ),
      );
      return;}

    final authProvider = Provider.of<AuthProvider>(context, listen: false);
    bool success = await authProvider.registerStepTwo(
      token: '',
      password: _createPasswordController.text.trim(),
      passwordConfirmation: _confirmPasswordController.text.trim(),
      context: context,
    );

    if (success) {
      widget.nextStep(); // Navigate to success screen
    }
  }

  

  bool isPasswordVisible = false;
  bool isPasswordVisible1 = false;

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 25,
          ),

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

          SizedBox(
            height: 25,
          ),

          ///create password
          FormFieldWidget(
            labelText: ksCreatePassword,
            hintText: 'xxxxx',
            obscureText: !isPasswordVisible,
            keyboardType: TextInputType.visiblePassword,
            controller: _createPasswordController,
            validator: (password) =>
                (password!.isEmpty) ? "Please enter the password" : null,
            suffixIcon: InkWell(
              onTap: () {
                setState(() {
                  isPasswordVisible = !isPasswordVisible;
                });
              },
              child: Icon(
                isPasswordVisible ? Icons.visibility : Icons.visibility_off,
              ),
            ),
          ),
          Text(ksMustbeatLeast),
          SizedBox(
            height: 25,
          ),

          ///confirm password
          FormFieldWidget(
            labelText: ksConfirmPassword,
            hintText: 'xxxxxx',
            obscureText: !isPasswordVisible1,
            keyboardType: TextInputType.visiblePassword,
            controller: _confirmPasswordController,
            validator: (password) =>
                (password!.isEmpty) ? "Please enter the password" : null,
            suffixIcon: InkWell(
              onTap: () {
                setState(() {
                  isPasswordVisible1 = !isPasswordVisible1;
                });
              },
              child: Icon(
                isPasswordVisible1 ? Icons.visibility : Icons.visibility_off,
              ),
            ),
          ),

          ///cretae account button
          GestureDetector(
            onTap: _submitForm,
            child: Container(
              margin: EdgeInsets.only(top: 40),
              height: 50,
              decoration: BoxDecoration(
                  color: kcLightBlue, borderRadius: BorderRadius.circular(12)),
              child: Center(
                child: authProvider.isLoading
                    ? CircularProgressIndicator(color: Colors.white)
                    : Text(
                        ksCreateAccount,
                        style: ktsAuthButtonTextStyle.copyWith(color: kcWhite),
                      ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
