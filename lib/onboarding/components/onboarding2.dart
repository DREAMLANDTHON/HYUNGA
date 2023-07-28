import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

import 'onboarding3.dart';

class OnboardingImage2 extends StatefulWidget {
  const OnboardingImage2({Key? key}) : super(key: key);

  @override
  State<OnboardingImage2> createState() => _OnboardingImage2State();
}

class _OnboardingImage2State extends State<OnboardingImage2> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => OnboardingImage3()),
              (route) => false,
        );
      },
      child: Container(
        decoration: BoxDecoration(
          color: HexColor('#f5eee6'),
        ),
        alignment: Alignment.center,
        child: Image.asset('assets/onboarding/onboarding2.png'),
      ),
    );
  }
}
