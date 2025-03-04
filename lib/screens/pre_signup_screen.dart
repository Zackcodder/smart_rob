import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:smart_rob/screens/signup_screen.dart';

import '../core/constants/colors.dart';
import '../core/constants/text_string.dart';
import '../core/constants/text_style.dart';

class PreSignupScreen extends StatefulWidget {
  const PreSignupScreen({super.key});

  @override
  State<PreSignupScreen> createState() => _PreSignupScreenState();
}

class _PreSignupScreenState extends State<PreSignupScreen> {
  
 final TextEditingController _countryController = TextEditingController();
  String? selectedCountryCode;

  void _showCountryPicker() {
    showCountryPicker(
      context: context,
      showPhoneCode: false, // Set to true if you need country phone codes
      onSelect: (Country country) {
        setState(() {
          _countryController.text = country.name;
          selectedCountryCode =
              country.countryCode; // Store country code if needed
        });
      },
      countryListTheme: CountryListThemeData(
        borderRadius: BorderRadius.circular(10),
        inputDecoration: InputDecoration(
          hintText: "Search Country",
          prefixIcon: Icon(Icons.search, color: Colors.grey),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(color: Colors.grey),
          ),
        ),
      ),
    );
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

            ///select country header
            Align(
              alignment: AlignmentDirectional.center,
              child: Text("Select your country",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            ),

            SizedBox(
              height: 20,
            ),

            ///search field for country
            GestureDetector(
                      onTap: _showCountryPicker,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 10),
                height: 50,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  children: [
                    ///search icon
                    GestureDetector(
                      onTap: _showCountryPicker,
                      child: Icon(
                        Icons.search,
                        color: Colors.grey,
                      ),
                    ),
                    SizedBox(width: 10),
              
                    ///search field
                    Expanded(
                      child: TextField(
                        controller: _countryController,
                        readOnly: true,
                        decoration: InputDecoration(
                          hintText: ksSearchCountry,
                          hintStyle: ktsTextFieldHint,
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Spacer(),
            GestureDetector(
              onTap: _countryController.text.isEmpty
                  ? null
                  : () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const SignupScreen(),
                        ),
                      );
                    },
              child: Container(
                height: 50,
                decoration: BoxDecoration(
                    color: _countryController.text.isEmpty
                        ? kcLightBlue.withOpacity(0.3)
                        : kcDeepBlue,
                    borderRadius: BorderRadius.circular(12)),
                child: Center(
                  child: Text(
                    ksContinue,
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