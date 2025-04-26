<<<<<<< HEAD
// import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import "package:flutter_svg/flutter_svg.dart";
// import 'main.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: helloBar(),
      body: Container(
        height: 140,
        color: Colors.transparent,
        padding: EdgeInsets.all(20),
        child: ListView(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(
                  Icons.account_circle_rounded,
                  size: 100,
                  color: Color(0xFF424755),
                ),
                SizedBox(width: 16),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'John Daniel Absalud',
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 19,
                        color: Color(0xFFFEFFFF),
                      ),
                    ),
                    Text(
                      '24001164210',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: Color(0xFFFEFFFF),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomTabs(),
    );
  }

  AppBar helloBar() {
    return AppBar(
      title: Text(
        'Hello, {name} !',
        style: TextStyle(
          color: Color(0xFFFEFFFF),
          fontSize: 20,
          fontWeight: FontWeight.w700,
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
        child: SvgPicture.asset('assets/icons/user.svg', height: 25, width: 25),
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
    return buildBottomTabs();
  }

  Widget buildBottomTabs() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Container(
          decoration: BoxDecoration(
            boxShadow: <BoxShadow>[
              BoxShadow(color: Colors.black, blurRadius: 20),
            ],
          ),
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
    );
  }
}
=======
// import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import "package:flutter_svg/flutter_svg.dart";
// import 'main.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: helloBar(),
      body: Container(
        height: 140,
        color: Colors.transparent,
        padding: EdgeInsets.all(20),
        child: ListView(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(
                  Icons.account_circle_rounded,
                  size: 100,
                  color: Color(0xFF424755),
                ),
                SizedBox(width: 16),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'John Daniel Absalud',
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 19,
                        color: Color(0xFFFEFFFF),
                      ),
                    ),
                    Text(
                      '24001164210',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: Color(0xFFFEFFFF),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomTabs(),
    );
  }

  AppBar helloBar() {
    return AppBar(
      title: Text(
        'Hello, {name} !',
        style: TextStyle(
          color: Color(0xFFFEFFFF),
          fontSize: 20,
          fontWeight: FontWeight.w700,
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
        child: SvgPicture.asset('assets/icons/user.svg', height: 25, width: 25),
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
    return buildBottomTabs();
  }

  Widget buildBottomTabs() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Container(
          decoration: BoxDecoration(
            boxShadow: <BoxShadow>[
              BoxShadow(color: Colors.black, blurRadius: 20),
            ],
          ),
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
    );
  }
}
>>>>>>> 8f60c9f17a09ae86816c995a219fdc3b96d2f847
