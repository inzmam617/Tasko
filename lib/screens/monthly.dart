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

   Map<DateTime, List<CleanCalendarEvent>> _events = { };

  @override
  void initState() {
    super.initState();
    _events = {
      DateTime(2023, 5, 2): [
        // CleanCalendarEvent(
        //   'Event C',
        //   startTime: DateTime(
        //     2023,
        //     5,
        //     3,
        //   ),
        //   color: Colors.white,
        //   endTime: DateTime(2023, 5, 3, 10, 0),
        // ),
        CleanCalendarEvent(
          'Event C',
          startTime: DateTime(2023, 5, 3, 9, 0),
          color: Colors.white,
          endTime: DateTime(2023, 5, 3, 10, 0),
        ),
      ],
    };
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: 10,
          ),
          Flexible(
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
              onRangeSelected: (range) =>
                  print('Range is ${range.from}, ${range.to}'),
              todayColor: Colors.blue,
              eventColor: Colors.red,
              locale: 'en_US',
              expandableDateFormat: 'EEEE, dd. MMMM yyyy',
              dayOfWeekStyle: const TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w800,
                  fontSize: 11),
            ),
          ),
          const Center(
            child: Text("Events",style: TextStyle(color: Colors.grey,fontSize: 18),),
          ),
          const SizedBox(height: 8,),

      Expanded(
        child: FutureBuilder(
          future: SharedPreferences.getInstance(),
          builder: (BuildContext context, AsyncSnapshot<SharedPreferences> snapshot) {
            List<String> tasks = snapshot.data?.getStringList('tasks') ?? [];
            print(tasks);
            if(tasks.isEmpty){
              return const Center(child: Text("No Tasks Yet!!"));
            }
            if (snapshot.hasData) {
              return ListView.builder(
                itemCount: tasks.length,
                itemBuilder: (BuildContext context, int index) {
                  String task = tasks[index];
                  List<String> parts = task.split(", ");
                  String title = parts[0].substring("Title: ".length);
                  String projectName = parts[1].substring("Project Name: ".length);
                  String description = parts[2].substring("Description: ".length);
                  // String date = parts[3].substring("Date: ".length);
                  String DueDate = parts[5].substring("DueDate: ".length);
                  String DueTime = parts[6].substring("DueTime: ".length);

                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 20),
                    child: InkWell(
                      onTap: (){

                      },
                      child: Container(

                        width: double.infinity,
                        decoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(color: Colors.grey, blurRadius: 3.5),
                            ]),
                        child:  Padding(
                          padding: EdgeInsets.symmetric(horizontal: 15,vertical: 10),
                          child: Row(
                            children: [
                              // Checkbox(
                              //   value: showButtons,
                              //   onChanged: (newValue) {
                              //     setState(() {
                              //       showButtons = !showButtons;
                              //     });
                              //   },
                              //   shape: RoundedRectangleBorder(
                              //     borderRadius: BorderRadius.circular(100),
                              //   ),
                              //   checkColor: Colors.blue,
                              // ),
                              SizedBox(width: 20),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    SizedBox(
                                      width: double.infinity,
                                      child: Text(
                                        title,
                                        style: TextStyle(),
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                    Text(
                                    description,
                                      style:
                                      TextStyle(color: Colors.grey, fontSize: 12),
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
                                  ),Text(
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
                },
              );
            } else {
              return const Center(child: CircularProgressIndicator());
            }
          },
        ),
      ),
          // Expanded(
          //   child: ListView.builder(
          //     itemCount:_events.length,
          //     physics: const ScrollPhysics(),
          //     itemBuilder: (BuildContext context, int index) {
          //       return Padding(
          //         padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 20),
          //         child: Container(
          //           height: 50,
          //           width: double.infinity,
          //           decoration: const BoxDecoration(
          //               borderRadius: BorderRadius.all(Radius.circular(10)),
          //               color: Colors.white,
          //               boxShadow: [
          //                 BoxShadow(color: Colors.grey, blurRadius: 3.5),
          //               ]),
          //           child: const Padding(
          //             padding: EdgeInsets.symmetric(horizontal: 15),
          //             child: Row(
          //               children: [
          //                 // Checkbox(
          //                 //   value: showButtons,
          //                 //   onChanged: (newValue) {
          //                 //     setState(() {
          //                 //       showButtons = !showButtons;
          //                 //     });
          //                 //   },
          //                 //   shape: RoundedRectangleBorder(
          //                 //     borderRadius: BorderRadius.circular(100),
          //                 //   ),
          //                 //   checkColor: Colors.blue,
          //                 // ),
          //                 SizedBox(width: 20),
          //                 Expanded(
          //                   child: Column(
          //                     crossAxisAlignment: CrossAxisAlignment.start,
          //                     mainAxisAlignment: MainAxisAlignment.center,
          //                     children: [
          //                       SizedBox(
          //                         width: double.infinity,
          //                         child: Text(
          //                           "Event Name",
          //                           style: TextStyle(),
          //                           overflow: TextOverflow.ellipsis,
          //                         ),
          //                       ),
          //                       Text(
          //                         "description" ?? "",
          //                         style:
          //                             TextStyle(color: Colors.grey, fontSize: 12),
          //                         overflow: TextOverflow.ellipsis,
          //                       ),
          //                     ],
          //                   ),
          //                 ),
          //                 Text(
          //                   "event date",
          //                   style: TextStyle(fontSize: 12),
          //                 ),
          //               ],
          //             ),
          //           ),
          //         ),
          //       );
          //     },
          //   ),
          // )
        ],
      ),
    );
  }
}
