import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_app/helpers/extentions.dart';
import 'package:quiz_app/routing/routes.dart';
import 'package:quiz_app/views/home_screen.dart';

import '../theme/custom_color.dart';

class OnBoardingCard extends StatefulWidget {
  const OnBoardingCard({super.key});

  @override
  State<OnBoardingCard> createState() => _OnBoardingCardState();
}

class _OnBoardingCardState extends State<OnBoardingCard> {
  List<String> smallWelcomeTexts = [
    "Enjoy friendly quiz competitions and win exciting prizes with your friends!",
    "Join your friends for quiz fun and win a range of cool prizes!",
    "Take on quiz challenges with friends and claim various prizes!",
    "Invite your friends to quiz nights and win great prizes!"
  ];
  int index = 0;
  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      alignment: Alignment.bottomCenter,
      children: [
        Container(
          width: .42.sh,
          height: .42.sh,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(40),
              color: Colors.white,
              boxShadow: [BoxShadow(color: Colors.grey.shade800, spreadRadius: 1, blurRadius: 15, blurStyle: BlurStyle.solid)]),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 30.h),
                child: Text("Interesting QUIZ Awaits You",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.poppins(color: CustomColors.largeTextColor, fontSize: 25.sp, fontWeight: FontWeight.bold)),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 15.w),
                child: Text(smallWelcomeTexts[index],
                    textAlign: TextAlign.center, style: GoogleFonts.poppins(color: CustomColors.smallTextColor, fontSize: 13.sp)),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 30.h),
                child: SizedBox(
                  width: 1.sw,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    mainAxisSize: MainAxisSize.min,
                    children: stepper(),
                  ),
                ),
              )
            ],
          ),
        ),
        Positioned(
          bottom: -30,
          child: GestureDetector(
            onTap: () {
              if (index != smallWelcomeTexts.length - 1) {
                setState(() {
                  index++;
                });
              } else {
                context.pushNamedAndRemoveUntil(Routes.homeScreen, predicate: (route) => false);
              }
            },
            child: Container(
              height: .1.sh,
              width: .1.sh,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: CustomColors.primaryButtonColor,
                  boxShadow: [BoxShadow(color: Colors.grey.shade800, spreadRadius: 1, blurRadius: 15, blurStyle: BlurStyle.solid)]),
              child: const Icon(
                Icons.arrow_forward,
                size: 35,
                color: Colors.white,
              ),
            ),
          ),
        )
      ],
    );
  }

  List<Widget> stepper() {
    return List.generate(
      smallWelcomeTexts.length,
      (i) {
        return Container(
          height: 8.h,
          width: 25.w,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20), color: index == i ? CustomColors.primaryButtonColor : CustomColors.smallTextColor),
        );
      },
    );
  }
}
