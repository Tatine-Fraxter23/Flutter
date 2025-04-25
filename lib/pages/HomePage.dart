import 'package:firebase_auth/firebase_auth.dart';
import "package:flutter_svg/flutter_svg.dart";
import 'package:flutter/material.dart';
import 'package:my_app/main.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Hello, {name} !',
          style: TextStyle(
            color: Color(0xFFFEFFFF),
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),
        backgroundColor: Color(0xFF232834),
        centerTitle: true,
        leading:
        // GestureDetector(
        Container(
          // onTap: () {},
          margin: EdgeInsets.all(10),
          alignment: Alignment.center,
          child: SvgPicture.asset(
            'assets/icons/user.svg',
            height: 30,
            width: 30,
          ),
          decoration: BoxDecoration(
            color: Color(0xFF424755),
            borderRadius: BorderRadius.circular(100),
          ),
        ),
        actions: [
          // GestureDetector(
          Container(
            // onTap: () {},
            margin: EdgeInsets.all(10),
            alignment: Alignment.center,
            width: 37,
            child: SvgPicture.asset(
              'assets/icons/plus.svg',
              height: 20,
              width: 20,
            ),
            decoration: BoxDecoration(
              color: Color(0xFF424755),
              borderRadius: BorderRadius.circular(100),
            ),
          ),
        ],
      ),
    );
  }
}
