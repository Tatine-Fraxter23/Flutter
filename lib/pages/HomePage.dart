import 'package:flutter/material.dart';
import "package:flutter_svg/flutter_svg.dart";
import 'package:table_calendar/table_calendar.dart';
// import 'package:firebase_auth/firebase_auth.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: helloBar(),
      body: ListView(
        padding: EdgeInsets.all(20),
        children: [leadingHeader(), CalendarShenanigan()],
      ),
      bottomNavigationBar: BottomTabs(),
    );
  }

  Widget leadingHeader() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Icon(Icons.account_circle_rounded, size: 90, color: Color(0xFF424755)),
        SizedBox(width: 16),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'John Daniel Absalud',
              style: TextStyle(
                fontWeight: FontWeight.w600,
                height: 1,
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
      leading: Container(
        margin: EdgeInsets.all(10),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: Color(0xFF424755),
          borderRadius: BorderRadius.circular(100),
        ),
        child: SvgPicture.asset('assets/icons/user.svg', height: 25, width: 25),
      ),
      actions: [
        Container(
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
                icon: SvgPicture.asset(
                  'assets/icons/placeholderIcon.svg',
                  width: 30,
                  height: 30,
                ),
                label: '',
              ),
              BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  'assets/icons/placeholderIcon.svg',
                  width: 30,
                  height: 30,
                ),
                label: '',
              ),
              BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  'assets/icons/placeholderIcon.svg',
                  width: 30,
                  height: 30,
                ),
                label: '',
              ),
              BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  'assets/icons/placeholderIcon.svg',
                  width: 30,
                  height: 30,
                ),
                label: '',
              ),
              BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  'assets/icons/user.svg',
                  width: 30,
                  height: 30,
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

class CalendarShenanigan extends StatefulWidget {
  const CalendarShenanigan({super.key});

  @override
  State<CalendarShenanigan> createState() => _CalendarShenaniganState();
}

class _CalendarShenaniganState extends State<CalendarShenanigan> {
  DateTime today = DateTime.now();

  void _onDaySelected(DateTime day, DateTime focusedDay) {
    setState(() {
      today = day;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 5),
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              color: Color(0xFF232834),
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withAlpha(99),
                  spreadRadius: 0,
                  blurRadius: 100,
                  offset: Offset(0, 0),
                ),
              ],
              border: Border.all(color: Colors.transparent, width: 1),
            ),
            padding: EdgeInsets.all(5),
            margin: EdgeInsets.symmetric(vertical: 20),
            child: TableCalendar(
              locale: "en_US",
              rowHeight: 60,
              headerStyle: HeaderStyle(
                formatButtonVisible: true,
                titleCentered: false,
                titleTextStyle: TextStyle(color: Color(0xFFFEFFFF)),
                formatButtonTextStyle: TextStyle(color: Color(0xFFFEFFFF)),
                formatButtonDecoration: BoxDecoration(
                  color: Colors.transparent,
                  border: Border.all(color: Color(0xFFFEFFFF)),
                  borderRadius: BorderRadius.circular(12),
                ),
                leftChevronIcon: Icon(
                  Icons.chevron_left,
                  color: Color(0xFFFEFFFF),
                ),
                rightChevronIcon: Icon(
                  Icons.chevron_right,
                  color: Color(0xFFFEFFFF),
                ),
              ),
              calendarStyle: CalendarStyle(
                defaultTextStyle: TextStyle(color: Color(0xFFFEFFFF)),
                weekendTextStyle: TextStyle(color: Color(0xFFFEFFFF)),
                todayTextStyle: TextStyle(color: Colors.black),
                todayDecoration: BoxDecoration(
                  color: Color(0xFFFEFFFF),
                  shape: BoxShape.circle,
                ),
                selectedTextStyle: TextStyle(color: Color(0xFF131824)),
                selectedDecoration: BoxDecoration(
                  color: Color(0xFF9EEBFD),
                  shape: BoxShape.circle,
                ),
                outsideTextStyle: TextStyle(color: Colors.grey),
                disabledTextStyle: TextStyle(color: Colors.grey),
              ),
              availableGestures: AvailableGestures.all,
              selectedDayPredicate: (day) => isSameDay(day, today),
              focusedDay: today,
              firstDay: DateTime.utc(2010, 10, 16),
              lastDay: DateTime.utc(2030, 3, 14),
              onDaySelected: _onDaySelected,
            ),
          ),
        ],
      ),
    );
  }
}
