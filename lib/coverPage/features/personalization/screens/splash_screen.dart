
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:page_transition/page_transition.dart';
import 'package:seustudyassist/coverPage/common/styles/pdf_view/pdf_spacing.dart';
import 'package:seustudyassist/coverPage/features/personalization/screens/info_fillup_screen.dart';
import 'package:seustudyassist/coverPage/utils/helpers/helper_functions.dart';

import '../../../utils/constants/colors.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  get splash => null;

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      backgroundColor:
          CHelperFunctions.isDarkMode(context) ? CColors.dark : Colors.white,
      splash: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              LottieBuilder.asset(
                "assets/animations/splash.json",
              ),
              const SizedBox(height: PDFSpacing.spaceBtwSection),
              Text(
                "Make Cover Page Easily",
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ],
          )
        ],
      ),
      splashIconSize: double.infinity,
      pageTransitionType: PageTransitionType.leftToRightWithFade,
      duration: 600,
      nextScreen: const InfoFillUpScreen(),
    );
  }
}
