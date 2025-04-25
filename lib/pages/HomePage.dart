// import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import "package:flutter_svg/flutter_svg.dart";
// import 'main.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'test, {name} !',
          style: TextStyle(
            color: Color(0xFFFEFFFF),
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),
        backgroundColor: Color(0xFF232834),
        elevation: 15,
        shadowColor: Colors.black,
        centerTitle: true,
        leading:
        // GestureDetector(
        Container(
          // onTap: () {},
          margin: EdgeInsets.all(10),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: Color(0xFF424755),
            borderRadius: BorderRadius.circular(100),
          ),
          child: SvgPicture.asset(
            'assets/icons/user.svg',
            height: 30,
            width: 30,
          ),
        ),
        actions: [
          // GestureDetector(
          Container(
            // onTap: () {},
            margin: EdgeInsets.all(10),
            alignment: Alignment.center,
            width: 37,
            decoration: BoxDecoration(
              color: Color(0xFF424755),
              borderRadius: BorderRadius.circular(100),
            ),
            child: SvgPicture.asset(
              'assets/icons/plus.svg',
              height: 20,
              width: 20,
            ),
          ),
        ],
      ),
      // body: BottomTabs(),
      bottomNavigationBar: BottomTabs(),
    );
  }
}

class BottomTabs extends StatefulWidget {
  const BottomTabs({super.key});

  @override
  State<BottomTabs> createState() => _BottomTabsState();
}

class _BottomTabsState extends State<BottomTabs> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          SizedBox(
            height: 100,
            child: BottomNavigationBar(
              showSelectedLabels: false,
              showUnselectedLabels: true,
              backgroundColor: Color(0xFF232834),
              type: BottomNavigationBarType.fixed,
              items: [
                BottomNavigationBarItem(
                  icon: Align(
                    alignment: Alignment.center,
                    child: SvgPicture.asset(
                      'assets/icons/placeholderIcon.svg',
                      width: 30,
                      height: 30,
                    ),
                  ),
                  label: '',
                ),
                BottomNavigationBarItem(
                  icon: Align(
                    alignment: Alignment.center,
                    child: SvgPicture.asset(
                      'assets/icons/placeholderIcon.svg',
                      width: 30,
                      height: 30,
                    ),
                  ),
                  label: '',
                ),
                BottomNavigationBarItem(
                  icon: Align(
                    alignment: Alignment.center,
                    child: SvgPicture.asset(
                      'assets/icons/placeholderIcon.svg',
                      width: 30,
                      height: 30,
                    ),
                  ),
                  label: '',
                ),
                BottomNavigationBarItem(
                  icon: Align(
                    alignment: Alignment.center,
                    child: SvgPicture.asset(
                      'assets/icons/placeholderIcon.svg',
                      width: 30,
                      height: 30,
                    ),
                  ),
                  label: '',
                ),
                BottomNavigationBarItem(
                  icon: Align(
                    alignment: Alignment.center,
                    child: SvgPicture.asset(
                      'assets/icons/user.svg',
                      width: 30,
                      height: 30,
                    ),
                  ),
                  label: '',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
