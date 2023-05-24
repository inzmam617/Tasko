import 'package:flutter/material.dart';
import 'package:flutter_clean_calendar/flutter_clean_calendar.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MonthTab extends StatefulWidget {
  const MonthTab({Key? key}) : super(key: key);

  @override
  State<MonthTab> createState() => _MonthTabState();
}

class _MonthTabState extends State<MonthTab> {
  final Map<DateTime, List<CleanCalendarEvent>> _events = {};

  List<String> notes = [];
  int year = 0;
  int month = 0;
  int day = 0;
  int hour = 0;
  int minute = 0;

  initialize() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    notes = prefs.getStringList("tasks")!;
    for (String task in notes) {
      List<String> parts = task.split(", ");
      String dueDate = parts[5].substring("DueDate: ".length);
      String dueTime = parts[6].substring("DueTime: ".length).replaceAll(RegExp('[AP]M'), '');

      List<String> dateComponents = dueDate.split('-');
      List<String> timeComponents = dueTime.split(':');

      int year = int.parse(dateComponents[0]);
      int month = int.parse(dateComponents[1]);
      int day = int.parse(dateComponents[2]);
      int hour = int.parse(timeComponents[0]);
      int minute = int.parse(timeComponents[1]);

      DateTime eventDateTime = DateTime(year, month, day);

      if (_events.containsKey(eventDateTime)) {
        _events[eventDateTime]!.add(
          CleanCalendarEvent(
            'Event C',
            startTime: DateTime(year, month, day, hour, minute),
            color: Colors.white,
            endTime: DateTime(year, month, day, hour, minute),
          ),
        );
      } else {
        _events[eventDateTime] = [
          CleanCalendarEvent(
            'Event C',
            startTime: DateTime(year, month, day, hour, minute),
            color: Colors.white,
            endTime: DateTime(year, month, day, hour, minute),
          ),
        ];
      }
    }
  }



  @override
  void initState() {
    super.initState();
    initialize();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const SizedBox(
            height: 10,
          ),

          Flexible(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Calendar(
                hideTodayIcon: true,
                isExpanded: true,
                hideBottomBar: true,
                startOnMonday: true,
                weekDays: const [
                  'Mon',
                  'Tue',
                  'Wed',
                  'Thur',
                  'Fri',
                  'Sat',
                  'Sun'
                ],
                events: _events,
                eventColor: Colors.red,
                locale: 'en_US',
                expandableDateFormat: 'EEEE, dd. MMMM yyyy',
                dayOfWeekStyle: const TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w800,
                    fontSize: 11),
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          const Center(
            child: Text(
              "Events",
              style: TextStyle(color: Colors.grey, fontSize: 18),
            ),
          ),
          const SizedBox(
            height: 8,
          ),

          Expanded(
            child: FutureBuilder(
              future: SharedPreferences.getInstance(),
              builder: (BuildContext context,
                  AsyncSnapshot<SharedPreferences> snapshot) {
                List<String> tasks =
                    snapshot.data?.getStringList('tasks') ?? [];
                if (tasks.isEmpty) {
                  return const Center(child: Text("No Tasks Yet!!"));
                }
                if (snapshot.hasData) {
                  return ListView.builder(
                      itemCount: tasks.length,
                      itemBuilder: (BuildContext context, int index) {
                        String task = tasks[index];
                        List<String> parts = task.split(", ");
                        if (parts.length >= 8) {
                          String title = parts[0].substring("Title: ".length);
                          String projectName =
                              parts[1].substring("Project Name: ".length);
                          String description =
                              parts[2].substring("Description: ".length);
                          String date = parts[3].substring("Date: ".length);
                          String DueDate =
                              parts[5].substring("DueDate: ".length);
                          String DueTime =
                              parts[6].substring("DueTime: ".length);
                          String monthselected =
                              parts[7].substring("monthselected: ".length);

                          if (monthselected == 'true') {
                            return Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 10, horizontal: 20),
                              child: InkWell(
                                onTap: () {},
                                child: Container(
                                  width: double.infinity,
                                  decoration: const BoxDecoration(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(10)),
                                      color: Colors.white,
                                      boxShadow: [
                                        BoxShadow(
                                            color: Colors.grey,
                                            blurRadius: 3.5),
                                      ]),
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 15, vertical: 10),
                                    child: Row(
                                      children: [
                                        const SizedBox(width: 20),
                                        Expanded(
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              SizedBox(
                                                width: double.infinity,
                                                child: Text(
                                                  title,
                                                  style: TextStyle(),
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                ),
                                              ),
                                              Text(
                                                description,
                                                style: TextStyle(
                                                    color: Colors.grey,
                                                    fontSize: 12),
                                                overflow: TextOverflow.ellipsis,
                                              ),
                                            ],
                                          ),
                                        ),
                                        Column(
                                          children: [
                                            Text(
                                              DueDate,
                                              style: TextStyle(fontSize: 12),
                                            ),
                                            Text(
                                              DueTime,
                                              style: TextStyle(fontSize: 12),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            );
                          }
                          return Container();
                        }
                      });
                } else {
                  return const Center(child: CircularProgressIndicator());
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
