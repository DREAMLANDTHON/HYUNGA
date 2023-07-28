import 'dart:ui';
import 'package:firebase_test/main/main_home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:hexcolor/hexcolor.dart';

import 'customtextfield.dart';

class ChildInfoScreen extends StatefulWidget {
  @override
  _ChildInfoScreenState createState() => _ChildInfoScreenState();
}

class _ChildInfoScreenState extends State<ChildInfoScreen> {
  int? selectedRadio;
  int? selectedRadioTile;
  final _formKey = GlobalKey<FormState>();
  String? name;
  String? accountNumber;
  String? instaAccount;
  String? mobNumber;
  String? email;
  String? pass;
  String? city;
  String? confPass;
  String country = 'Country';
  String gender = 'Child Gender';

  List<String> genders = [
    "Male",
    "Female",
  ];
  List<String> countries = [
    "Afghanistan",
    "Cambodia",
    "India",
    "Japan",
    "Kenya"
        "Philippines"
  ];

  @override
  void initState() {
    super.initState();
    selectedRadio = 0;
    selectedRadioTile = 0;
  }

  setSelectedRadioTile(dynamic val) {
    setState(() {
      selectedRadioTile = val;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: SafeArea(
            child: Stack(
          children: [
            // Positioned(
            //   child: SvgPicture.asset('images/header_image.svg'),
            //   top: 0,
            //   left: 0,
            // ),
            Padding(
              padding: const EdgeInsets.only(
                top: 70,
              ),
              child: Column(
                children: [
                  Center(
                    child: Text(
                      'Child Info',
                      style: TextStyle(
                        fontSize: 26,
                        color: const Color(0xff000000),
                        fontWeight: FontWeight.w700,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 135.0, left: 20, right: 20),
              child: Form(
                key: _formKey,
                child: ListView(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Radio(
                          value: 1,
                          groupValue: selectedRadioTile,
                          onChanged: (val) {
                            setSelectedRadioTile(val);
                          },
                          activeColor: Colors.blue,
                        ),
                        GestureDetector(
                          child: Text('Mother'),
                          onTap: () {
                            setState(() {
                              setSelectedRadioTile(1);
                            });
                          },
                        ),
                        Radio(
                          value: 2,
                          groupValue: selectedRadioTile,
                          onChanged: (val) {
                            setSelectedRadioTile(val);
                          },
                          activeColor: Colors.blue,
                        ),
                        GestureDetector(
                          child: Text('Father'),
                          onTap: () {
                            setState(() {
                              setSelectedRadioTile(2);
                            });
                          },
                        ),
                      ],
                    ),
                    CustomTextField(
                      text: 'Child Name',
                      keyboardType: TextInputType.name,
                      validator: (String? value) {
                        if (value!.isEmpty) {
                          return "This Field is Required 😒 !";
                        } else if (value.length < 10) {
                          return "This is not an Child Name 🤦‍♂️ !";
                        }
                        return null;
                      },
                      onSaved: (newValue) {
                        this.accountNumber = newValue;
                      },
                      obscureText: false,
                      onChanged: (String) {},
                    ),
                    CustomTextField(
                      text: 'Child Birth',
                      keyboardType: TextInputType.datetime,
                      validator: (String? value) {
                        if (value!.isEmpty) {
                          return "This Field is Required 😒 !";
                        } else if (value.length < 10) {
                          return "This is not an Child Name 🤦‍♂️ !";
                        }
                        return null;
                      },
                      onSaved: (newValue) {
                        this.accountNumber = newValue;
                      },
                      onChanged: (String) {},
                      obscureText: false,
                    ),
                    Container(
                      width: double.infinity,
                      padding: EdgeInsets.only(left: 10, top: 4, bottom: 4),
                      margin: EdgeInsets.only(top: 20),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Color(0xFFE4E4E4),
                      ),
                      child: DropdownButton<String>(
                          hint: Text(gender),
                          isExpanded: true,
                          underline: Container(),
                          items: genders
                              .map((e) => DropdownMenuItem(
                                    child: Text(e),
                                    value: e,
                                  ))
                              .toList(),
                          onChanged: (value) {
                            this.gender = value!;
                            setState(() {});
                          }),
                    ),
                    CustomTextField(
                      text: 'Allergies or Disorder Your Child Has',
                      keyboardType: TextInputType.datetime,
                      validator: (String? value) {
                        if (value!.isEmpty) {
                          return "This Field is Required 😒 !";
                        } else if (value.length < 10) {
                          return "This field is required🤦‍♂️ !";
                        }
                        return null;
                      },
                      onSaved: (newValue) {
                        this.accountNumber = newValue;
                      },
                      onChanged: (String) {},
                      obscureText: false,
                    ),
                    CustomTextField(
                      text: 'Emergency Phone Number',
                      keyboardType: TextInputType.phone,
                      validator: (String? value) {
                        if (value!.isEmpty) {
                          return "This Field is Required 😒 !";
                        } else if (value.length < 10) {
                          return "This is not a phone Number 🤦‍♂️ !";
                        }
                        return null;
                      },
                      onSaved: (newValue) {
                        this.mobNumber = newValue;
                      },
                      obscureText: false,
                      onChanged: (String) {},
                    ),
                    Container(
                      width: double.infinity,
                      padding: EdgeInsets.only(left: 10, top: 4, bottom: 4),
                      margin: EdgeInsets.only(top: 20),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Color(0xFFE4E4E4),
                      ),
                      child: DropdownButton<String>(
                          hint: Text(country),
                          isExpanded: true,
                          underline: Container(),
                          items: countries
                              .map((e) => DropdownMenuItem(
                                    child: Text(e),
                                    value: e,
                                  ))
                              .toList(),
                          onChanged: (value) {
                            this.country = value!;
                            setState(() {});
                          }),
                    ),
                    Center(
                      child: TextButton(
                        onPressed: () {
                          Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                                builder: (context) => MainScreen()),
                            (route) => false,
                          );
                        },
                        child: Text(
                          "DONE",
                          style: TextStyle(
                            color: HexColor('#0b4e25'),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              ),
            ),
            // Positioned(
            //   child: SvgPicture.asset('images/bottom_image.svg'),
            //   bottom: 0,
            //   right: 0,
            // ),
          ],
        )));
  }
}
