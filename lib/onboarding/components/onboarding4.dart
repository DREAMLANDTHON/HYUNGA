import 'package:firebase_test/childinfo/childinfo.dart';
import 'package:firebase_test/login/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class OnboardingImage4 extends StatefulWidget {
  const OnboardingImage4({Key? key}) : super(key: key);

  @override
  State<OnboardingImage4> createState() => _OnboardingImage4State();
}

class _OnboardingImage4State extends State<OnboardingImage4> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => LoginSignupScreen()),
              (route) => false,
        );
      },
      child: Container(
        decoration: BoxDecoration(
          color: HexColor('#f5eee6'),
        ),
        alignment: Alignment.center,
        child: Image.asset('assets/onboarding/onboarding4.png'),
      ),
    );
  }
}
