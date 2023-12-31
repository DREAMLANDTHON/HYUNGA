import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

import 'onboarding2.dart';

class OnboardingImage extends StatefulWidget {
  const OnboardingImage({Key? key}) : super(key: key);

  @override
  State<OnboardingImage> createState() => _OnboardingImageState();
}

class _OnboardingImageState extends State<OnboardingImage> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => OnboardingImage2()),
              (route) => false,
        );
      },
      child: Container(
        decoration: BoxDecoration(
          color: HexColor('#f5eee6'),
        ),
        alignment: Alignment.center,
        child: Image.asset('assets/onboarding/onboarding1.png'),
      ),
    );
  }
}
