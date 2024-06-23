import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_app/theme/custom_color.dart';
import 'package:quiz_app/widgets/onboarding_card.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: 30.h,
          ),
          const Image(image: AssetImage("assets/used/onBoarding.png")),
          const OnBoardingCard(),
        ],
      ),
    );
  }
}
