import 'package:flutter/material.dart';
import 'package:smart_rob/core/constants/text_string.dart';
import 'package:smart_rob/screens/pre_signup_screen.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../core/constants/colors.dart';
import '../core/constants/text_style.dart';
import '../widgets/onboarding_display.dart';

class OnbardingScreens extends StatefulWidget {
  const OnbardingScreens({super.key});

  @override
  State<OnbardingScreens> createState() => _OnbardingScreensState();
}

class _OnbardingScreensState extends State<OnbardingScreens> {
  final PageController _controller = PageController();
  int _currentPage = 0;

  final List<Map<String, String>> onboardingData = [
    {
      "title": ksOnboardingHeader1,
      "subtitle": ksOnboardingSubHeader1,
      "image": "assets/onboardimage1.png",
    },
    {
      "title": ksOnboardingHeader2,
      "subtitle": ksOnboardingSubHeader2,
      "image": "assets/onboardimage2.png",
    },
    {
      "title": ksOnboardingHeader3,
      "subtitle": ksOnboardingSubHeader3,
      "image": "assets/onboardimage3.png",
    },
    {
      "title": ksOnboardingHeader4,
      "subtitle": ksOnboardingSubHeader4,
      "image": "assets/onboardimage4.png",
    },
    {
      "logo": "assets/whitelogo.png",
      "title": "",
      "subtitle": "",
      "image": "assets/onboardimage4.png",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ScrollConfiguration(
        behavior: const ScrollBehavior().copyWith(overscroll: false),
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                kcLightBlue, // Start Color
                kcDeepBlue, // Middle Color
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          child: Column(
            children: [
              Expanded(
                child: PageView.builder(
                  controller: _controller,
                  itemCount: onboardingData.length,
                  onPageChanged: (index) {
                    setState(() {
                      _currentPage = index;
                    });
                  },
                  itemBuilder: (context, index) {
                    bool isLastPage = index == onboardingData.length - 1;
                    return isLastPage
                        ? OnboardingPage(
                            logo: onboardingData[index]["logo"]!,
                            title: onboardingData[index]["title"]!,
                            subtitle: onboardingData[index]["subtitle"]!,
                            image: onboardingData[index]["image"]!,
                          )
                        : OnboardingPage(
                            title: onboardingData[index]["title"]!,
                            subtitle: onboardingData[index]["subtitle"]!,
                            image: onboardingData[index]["image"]!,
                          );
                  },
                ),
              ),
              SizedBox(
                height: 20,
              ),

              ///page 
              if (_currentPage  < 4)
              SmoothPageIndicator(
                controller: _controller,
                count: onboardingData.length,
                effect: ExpandingDotsEffect(
                  dotHeight: 8,
                  dotWidth: 8,
                  activeDotColor: Colors.blue,
                ),
              ),
              const SizedBox(height: 20),

              ///login and sign up button
              if (_currentPage == onboardingData.length - 1)
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Column(
                    children: [
                      ///create account button
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const PreSignupScreen(),
                            ),
                          );
                        },
                        child: Container(
                          height: 50,
                          decoration: BoxDecoration(
                              color: kcWhite,
                              borderRadius: BorderRadius.circular(12)),
                          child: Center(
                            child: Text(
                              ksCreateAccount,
                              style: ktsAuthButtonTextStyle,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),

                      ///sign in button
                      Container(
                        height: 50,
                        decoration: BoxDecoration(
                            color: kcDeepBlue,
                            borderRadius: BorderRadius.circular(12)),
                        child: Center(
                          child: Text(
                            ksLogin,
                            style: ktsSignButtonTextStyle,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }
}
