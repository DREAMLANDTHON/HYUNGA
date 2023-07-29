import 'package:flutter/material.dart';

class CallingScreen extends StatelessWidget {
  const CallingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pop(context);
      },
      child: Image.asset('assets/images/calling.jpeg'),
    );
  }
}
