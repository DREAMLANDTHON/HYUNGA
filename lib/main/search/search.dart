import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: HexColor('#f5eee6'),
      ),
      alignment: Alignment.center,
      child: Image.asset(
        'assets/onboarding/search.png',
      ),
    );
  }
}
