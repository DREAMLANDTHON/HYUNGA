import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

import 'onboarding4.dart';

class OnboardingImage3 extends StatefulWidget {
  const OnboardingImage3({Key? key}) : super(key: key);

  @override
  State<OnboardingImage3> createState() => _OnboardingImage3State();
}

class _OnboardingImage3State extends State<OnboardingImage3> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => OnboardingImage4()),
              (route) => false,
        );
      },
      child: Container(
        decoration: BoxDecoration(
          color: HexColor('#f5eee6'),
        ),
        alignment: Alignment.center,
        child: Image.asset('assets/onboarding/onboarding3.png'),
      ),
    );
  }
}
