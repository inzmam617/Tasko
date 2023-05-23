import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Today extends StatefulWidget {
  const Today({Key? key}) : super(key: key);

  @override
  State<Today> createState() => _TodayState();
}

class _TodayState extends State<Today> {
  @override
  void initState() {
    super.initState();
    initiliaze();
  }


  List<String>? tasks;

  initiliaze() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    tasks = prefs.getStringList("tasks");

  }
  late ScaffoldMessengerState scaffoldMessenger;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    scaffoldMessenger = ScaffoldMessenger.of(context);
  }
  String text = "";

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 10,
        ),
        Text(
          text.toString(),
          style: const TextStyle(color: Colors.grey),
          textAlign: TextAlign.start,
        ),
        const SizedBox(
          height: 8,
        ),
        Builder(
          builder: (context) {
            return Expanded(
              child: FutureBuilder(
                future: SharedPreferences.getInstance(),
                builder: (BuildContext context, AsyncSnapshot<SharedPreferences> snapshot) {
                  List<String> tasks = snapshot.data?.getStringList('tasks') ?? [];
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
                        String description = parts[2].substring("Description: ".length);
                        String date = parts[3].substring("Date: ".length);
                        DateTime dateTime = DateTime.parse(date);
                        String formattedDate = DateFormat('yyyy-MM-dd').format(dateTime);
                        String monthselected =
                        parts[7].substring("monthselected: ".length);
                        if (monthselected == 'false'){
                          return Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                            child: Slidable(
                              key: ValueKey(index),
                              endActionPane: ActionPane(
                                motion: const StretchMotion(),
                                dismissible: DismissiblePane(
                                  onDismissed: () async {
                                    setState(() {
                                      tasks.removeAt(index);
                                    });
                                    final SharedPreferences prefs = await SharedPreferences.getInstance();
                                    await prefs.setStringList('tasks', tasks);
                                    setState(() {});

                                    scaffoldMessenger.showSnackBar(const SnackBar(
                                      content: Text('Successfully deleted task'),
                                      duration: Duration(seconds: 1),
                                    ));
                                  },

                                ),
                                children: const [],
                              ),

                              child: Container(
                                height: 50,
                                width: double.infinity,
                                decoration: const BoxDecoration(
                                    borderRadius: BorderRadius.all(Radius.circular(10)),
                                    color: Colors.white,
                                    boxShadow: [
                                      BoxShadow(color: Colors.grey, blurRadius: 3.5),
                                    ]
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 15),
                                  child: Row(
                                    children: [
                                      const SizedBox(width: 20),
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            SizedBox(
                                              width: double.infinity,
                                              child: Text(
                                                title ?? "",
                                                overflow: TextOverflow.ellipsis,
                                              ),
                                            ),
                                            Text(
                                              description ?? "",
                                              style: const TextStyle(color: Colors.grey, fontSize: 12),
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                          ],
                                        ),
                                      ),
                                      Text(
                                        formattedDate,
                                        style: const TextStyle(fontSize: 12),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          );



                        }
                        else{
                          return const Center(child: Text("No Tasks for today"),);
                        }

                      },
                    );
                  } else {
                    return const Center(child: CircularProgressIndicator());
                  }
                },
              ),
            );
          }
        ),
      ],
    );
  }
}

