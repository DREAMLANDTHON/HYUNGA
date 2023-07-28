import 'package:flutter/material.dart';

class OnboardingImage extends StatefulWidget {
  const OnboardingImage({Key? key}) : super(key: key);

  @override
  State<OnboardingImage> createState() => _OnboardingImageState();
}

class _OnboardingImageState extends State<OnboardingImage> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      // child: Image('assets/onboarding'),
    );
  }
}
