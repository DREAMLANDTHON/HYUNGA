import '/main/main_home_screen.dart';
import '/onboarding/onboarding_screen.dart';
import 'package:flutter/widgets.dart';

class HomeList {
  HomeList({
    this.navigateScreen,
    this.imagePath = '',
  });

  Widget? navigateScreen;
  String imagePath;

  static List<HomeList> homeList = [
    HomeList(
      imagePath: 'assets/introduction_animation/introduction_animation.png',
      navigateScreen: OnBoardingScreen(),
    ),
    HomeList(
      imagePath: 'assets/fitness_app/fitness_app.png',
      navigateScreen: MainScreen(),
    ),
  ];
}
