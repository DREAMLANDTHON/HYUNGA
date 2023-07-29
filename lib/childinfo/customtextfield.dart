import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final bool obscureText;
  final String? Function(String?)? validator;
  final String text;
  final TextInputType keyboardType;
  final void Function(String?)? onSaved;
  final void Function(String)? onChanged;

  const CustomTextField(
      {Key? key,
      required this.validator,
      required this.text,
      required this.keyboardType,
      required this.onSaved,
      required this.obscureText,
      required this.onChanged})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 20),
      padding: const EdgeInsets.only(left: 15.0),
      decoration: BoxDecoration(
          color: Color(0xFF0b4e25), borderRadius: BorderRadius.circular(20)),
      child: TextFormField(
        obscureText: obscureText,
        keyboardType: keyboardType,
        onChanged: onChanged,
        onSaved: onSaved,
        validator: validator,
        decoration: InputDecoration(
          label: Text(
            text,
            style: TextStyle(color: Colors.white),
          ),
          border: InputBorder.none,
        ),
        style: TextStyle(
          color: Colors.white
        ),
      ),
    );
  }
}
