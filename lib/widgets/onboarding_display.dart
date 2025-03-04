import 'package:flutter/material.dart';
import 'package:smart_rob/core/constants/text_style.dart';

class OnboardingPage extends StatelessWidget {
  final String logo;
  final String title;
  final String subtitle;
  final String image;

  const OnboardingPage(
      {super.key,
      this.logo = '',
      required this.title,
      required this.subtitle,
      required this.image});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        spacing: 10,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 30,
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ///logo
               logo.isNotEmpty?  Image.asset(
                  logo ,
                  height: 40,
                  width: MediaQuery.of(context).size.width,
                ) : SizedBox(),

                ///page header
                Text(
                  title,
                  textAlign: TextAlign.center,
                  style: ktsLandingPageHeader,
                ),

                ///page sub header
                Text(
                  subtitle,
                  textAlign: TextAlign.center,
                  style: ktsLandingPageSubHeader,
                ),
              ],
            ),
          ),

          ///image
          Expanded(
              child: Image.asset(
            image,
            width: MediaQuery.of(context).size.width,
          )),
        ],
      ),
    );
  }
}
