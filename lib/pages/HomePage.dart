import 'package:flutter/material.dart';
import "package:flutter_svg/flutter_svg.dart";
import 'package:my_app/services/event.dart';
import 'package:table_calendar/table_calendar.dart';

class Event {
  final String title;
  final DateTime? createdDate;

  Event(this.title, {this.createdDate});

  @override
  String toString() => title;
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController _eventController = TextEditingController();
  late final ValueNotifier<List<Event>> _selectedEvents;
  Map<DateTime, List<Event>> events = {};
  DateTime _selectedDay = DateTime.now();

  List<Event> _getEventsForDay(DateTime day) {
    return events[day] ?? [];
  }

  @override
  void dispose() {
    _eventController.dispose();
    _selectedEvents.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _selectedEvents = ValueNotifier(_getEventsForDay(_selectedDay));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: helloBar(),
      body: ListView(
        padding: EdgeInsets.all(20),
        children: [
          leadingHeader(),
          CalendarShenanigan(
            events: events,
            selectedDay: _selectedDay,
            selectedEvents: _selectedEvents,
            onDaySelected: (selectedDay) {
              setState(() {
                _selectedDay = selectedDay;
                _selectedEvents.value = _getEventsForDay(selectedDay);
              });
            },
          ),
        ],
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
      leading: GestureDetector(
        onTap: () {},
        child: Container(
          margin: EdgeInsets.all(10),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: Color(0xFF424755),
            borderRadius: BorderRadius.circular(100),
          ),
          child: SvgPicture.asset(
            'assets/icons/user.svg',
            height: 25,
            width: 25,
          ),
        ),
      ),
      actions: [
        GestureDetector(
          onTap: () {
            showDialog(
              barrierColor: Colors.black.withAlpha(100),
              barrierDismissible: false,
              context: context,
              builder: (context) {
                return AlertDialog(
                  elevation: 0.0,
                  backgroundColor: Color(0xFF232834),
                  scrollable: true,
                  title: Text(
                    'Event Name',
                    style: TextStyle(
                      color: Color(0xFFFEFFFF),
                      fontWeight: FontWeight.w600,
                      fontSize: 20,
                    ),
                  ),
                  content: Padding(
                    padding: EdgeInsets.all(5),
                    child: TextField(
                      style: TextStyle(color: Color(0xFFFEFFFF)),
                      controller: _eventController,
                      autofocus: true,
                    ),
                  ),
                  actions: [
                    ElevatedButton(
                      onPressed: () {
                        if (_eventController.text.isEmpty) return;
                        setState(() {
                          if (events[_selectedDay] != null) {
                            events[_selectedDay]!.add(
                              Event(
                                _eventController.text,
                                createdDate: DateTime.now(),
                              ),
                            );
                          } else {
                            events[_selectedDay] = [
                              Event(
                                _eventController.text,
                                createdDate: DateTime.now(),
                              ),
                            ];
                          }
                          _selectedEvents.value = _getEventsForDay(
                            _selectedDay,
                          );
                        });
                        _eventController.clear();
                        Navigator.of(context).pop();
                      },
                      child: Text(
                        "Submit",
                        style: TextStyle(fontWeight: FontWeight.w500),
                      ),
                    ),
                  ],
                );
              },
            );
          },
          child: Container(
            margin: EdgeInsets.all(10),
            alignment: Alignment.center,
            width: 37,
            decoration: BoxDecoration(
              color: Color(0xFF424755),
              borderRadius: BorderRadius.circular(100),
            ),
            child: Icon(Icons.add, color: Color(0xFFFEFFFF)),
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
  final Map<DateTime, List<Event>> events;
  final DateTime selectedDay;
  final ValueNotifier<List<Event>> selectedEvents;
  final Function(DateTime) onDaySelected;

  const CalendarShenanigan({
    super.key,
    required this.events,
    required this.selectedDay,
    required this.selectedEvents,
    required this.onDaySelected,
  });

  @override
  State<CalendarShenanigan> createState() => _CalendarShenaniganState();
}

class _CalendarShenaniganState extends State<CalendarShenanigan> {
  CalendarFormat _calendarFormat = CalendarFormat.month;

  List<Event> _getEventsForDay(DateTime day) {
    return widget.events[day] ?? [];
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
                  color: Colors.black.withAlpha(50),
                  spreadRadius: 10,
                  blurRadius: 20,
                  offset: Offset(0, 0),
                ),
              ],
              border: Border.all(color: Colors.transparent, width: 1),
            ),
            padding: EdgeInsets.all(5),
            margin: EdgeInsets.symmetric(vertical: 20),
            child: Column(
              children: [
                TableCalendar(
                  eventLoader: _getEventsForDay,
                  locale: "en_US",
                  rowHeight: 60,
                  headerStyle: HeaderStyle(
                    formatButtonVisible: true,
                    titleCentered: false,
                    titleTextStyle: TextStyle(color: Color(0xFFFEFFFF)),
                    formatButtonTextStyle: TextStyle(color: Color(0xFFFEFFFF)),
                    formatButtonDecoration: BoxDecoration(
                      color: Colors.transparent,
                      border: Border.all(color: Color(0xFF9EEBFD)),
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
                    defaultTextStyle: TextStyle(
                      color: Color(0xFFFEFFFF),
                      fontWeight: FontWeight.w500,
                    ),
                    weekendTextStyle: TextStyle(
                      color: Color(0xFFFEFFFF),
                      fontWeight: FontWeight.w500,
                    ),
                    todayTextStyle: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
                    ),
                    todayDecoration: BoxDecoration(
                      color: Color(0xFF9EEBFD),
                      shape: BoxShape.circle,
                    ),
                    selectedTextStyle: TextStyle(
                      color: Color(0xFF131824),
                      fontWeight: FontWeight.w500,
                    ),
                    selectedDecoration: BoxDecoration(
                      color: Color(0xFFFEF96E),
                      shape: BoxShape.circle,
                    ),
                    outsideTextStyle: TextStyle(color: Color(0xFF424755)),
                    disabledTextStyle: TextStyle(color: Color(0xFF424755)),
                    markerDecoration: BoxDecoration(
                      color: Color(0xFFFEFFFF),
                      shape: BoxShape.circle,
                    ),
                  ),
                  availableGestures: AvailableGestures.all,
                  selectedDayPredicate:
                      (day) => isSameDay(day, widget.selectedDay),
                  focusedDay: widget.selectedDay,
                  firstDay: DateTime.utc(2010, 10, 16),
                  lastDay: DateTime.utc(2030, 3, 14),
                  onDaySelected: (selectedDay, focusedDay) {
                    widget.onDaySelected(selectedDay);
                  },
                  calendarFormat: _calendarFormat,
                  onFormatChanged: (format) {
                    setState(() {
                      _calendarFormat = format;
                    });
                  },
                ),
                SizedBox(height: 8.0),
                ValueListenableBuilder<List<Event>>(
                  valueListenable: widget.selectedEvents,
                  builder: (context, value, _) {
                    if (value.isEmpty) return SizedBox();

                    final firstDate =
                        value[0].createdDate ?? widget.selectedDay;
                    final weekday =
                        [
                          "Sun",
                          "Mon",
                          "Tue",
                          "Wed",
                          "Thu",
                          "Fri",
                          "Sat",
                        ][firstDate.weekday % 7];
                    final dayNumber = firstDate.day;

                    return Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(width: 12),
                        Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Transform.translate(
                              offset: Offset(0, -18.0),
                              child: Text(
                                weekday,
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                            SizedBox(height: 4),
                            Transform.translate(
                              offset: Offset(0, -18.0), // Adjusted offset
                              child: Container(
                                width: 40,
                                height: 40,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Color(0xFFFEF96E),
                                ),
                                alignment: Alignment.center,
                                child: Text(
                                  '$dayNumber',
                                  style: TextStyle(
                                    color: Color(0xFF131824),
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(width: 16),
                        Expanded(
                          child: Container(
                            padding: EdgeInsets.symmetric(
                              vertical: 8,
                              horizontal: 12,
                            ),
                            margin: EdgeInsets.symmetric(vertical: 12),
                            decoration: BoxDecoration(
                              color: Color(0xFF131824),
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(
                                color: Colors.transparent,
                                width: 2,
                              ),
                            ),
                            child: ListView.separated(
                              shrinkWrap: true,
                              physics: NeverScrollableScrollPhysics(),
                              itemCount: value.length,
                              separatorBuilder:
                                  (context, index) => Divider(
                                    color: Color(0xFFFEFFFF),
                                    height: 1,
                                  ),
                              itemBuilder: (context, index) {
                                final event = value[index];
                                final dotColor =
                                    index % 2 == 0
                                        ? Color(0xFFFEF96E)
                                        : Color(0xFF9EEBFD);
                                return Padding(
                                  padding: EdgeInsets.symmetric(vertical: 6),
                                  child: Row(
                                    children: [
                                      Container(
                                        width: 8,
                                        height: 8,
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: dotColor,
                                        ),
                                      ),
                                      SizedBox(width: 8),
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              '${event.toString()}',
                                              style: TextStyle(
                                                color: Color(0xFFFEFFFF),
                                                fontSize: 14,
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                            SizedBox(height: 2),
                                            Text(
                                              event.createdDate != null
                                                  ? '${event.createdDate!.hour.toString().padLeft(2, '0')}:${event.createdDate!.minute.toString().padLeft(2, '0')}'
                                                  : 'No time',
                                              style: TextStyle(
                                                color: Colors.grey,
                                                fontSize: 11,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              },
                            ),
                          ),
                        ),
                        SizedBox(width: 12),
                      ],
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
