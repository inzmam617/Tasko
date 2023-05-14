import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tasko/screens/Menu.dart';
import 'package:tasko/screens/home.dart';
import '../screens/AddNotes.dart';
import '../screens/AddnewTasks.dart';
import '../screens/monthly.dart';

class BottomBarPage extends StatefulWidget {
  const BottomBarPage({Key? key}) : super(key: key);

  @override
  State<BottomBarPage> createState() => _BottomBarPageState();
}

class _BottomBarPageState extends State<BottomBarPage> {
  int _selectedIndex = 0;
  static const List<Widget> _widgetOptions = <Widget>[
    Home(),
    Menu(),
    Home(),
    MonthTab()
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color(0xFFfe7f75),
        onPressed: () {
            // showModalBottomSheet(
            //   backgroundColor: Color(0xff1e1e1e),
            //   shape: RoundedRectangleBorder(
            //     borderRadius: BorderRadius.vertical(
            //       top: Radius.circular(20.0),
            //     ),
            //   ),
            //   context: context,
            //   isScrollControlled: true,
            //   builder: (BuildContext context) {
            //     return SingleChildScrollView(
            //       padding: EdgeInsets.only(
            //         bottom: MediaQuery.of(context).viewInsets.bottom,
            //       ),
            //       child: Column(
            //         children: [
            //           Center(
            //             child: Padding(
            //               padding: const EdgeInsets.symmetric(horizontal: 10),
            //               child: TextField(
            //                 textAlign: TextAlign.center,
            //                 style: TextStyle(color: Colors.white70),
            //                 inputFormatters: [
            //                   LengthLimitingTextInputFormatter(15),
            //                 ],
            //                 cursorColor: CupertinoColors.activeOrange,
            //                 autofocus: true,
            //                 keyboardType: TextInputType.text,
            //                 decoration: InputDecoration(
            //
            //                   hintStyle: TextStyle(color: Colors.grey),
            //                   hintText: 'Enter text here',
            //                   border: InputBorder.none,
            //                 ),
            //                 onSubmitted: (value) {
            //                   // Handle text input here
            //                   Navigator.pop(context);
            //                 },
            //               ),
            //             ),
            //           ),
            //           Padding(
            //             padding: const EdgeInsets.symmetric(horizontal: 10),
            //             child: TextField(
            //
            //               style: TextStyle(color: Colors.white70),
            //
            //               cursorColor: CupertinoColors.activeOrange,
            //               autofocus: true,
            //               // keyboardType: TextInputType.url,
            //               decoration: InputDecoration(
            //
            //                 hintStyle: TextStyle(color: Colors.grey,fontSize: 13),
            //                 hintText: 'Description',
            //                 border: InputBorder.none,
            //               ),
            //               onSubmitted: (value) {
            //                 // Handle text input here
            //                 Navigator.pop(context);
            //               },
            //             ),
            //           ),
            //
            //         ],
            //       ),
            //     );
            //   },
            // );
            showDialog(
            context: context,
            builder: (BuildContext context) {
              return Dialog(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pop();

                          Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) {
                            return AddNewTask();
                          }));


                        },
                        child: Text("Add Task",style: TextStyle(color: Colors.black),),
                      ),
                      const Divider(),
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pop();

                          Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) {
                            return const AddNotes();
                          }));


                        },
                        child: const Text("Add Quick Note",style: TextStyle(color: Colors.black)),
                      ),

                    ],
                  ),
                ),
              );
            },
          );


        },
        child: const Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Color(0xff292E4E),
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(


            backgroundColor: const Color(0xff2a2e4d),

            icon: Icon(Icons.task_alt_rounded,size: 30,
            ),
            label: '',
            // backgroundColor: Colors.green
          ),
          BottomNavigationBarItem(
            backgroundColor: const Color(0xff2a2e4d),

            icon: Padding(
              padding: const EdgeInsets.only(right: 50),
              child: Icon(Icons.menu,size: 30,
              ),
            ),
            label: '',            // backgroundColor: Color(0xff2a2e4d),

          ),

          BottomNavigationBarItem(
            backgroundColor: const Color(0xff2a2e4d),

            icon: Padding(
              padding: const EdgeInsets.only(left: 50),
              child: Icon(Icons.table_view_sharp,size: 28,),
            ),
            label: '',            // backgroundColor: Color(0xff2a2e4d),

          ),
          BottomNavigationBarItem(
            backgroundColor: const Color(0xff2a2e4d),

            icon: Icon(Icons.person,size: 28,),
            label: ""
          )
        ],
        type: BottomNavigationBarType.fixed,
        currentIndex: _selectedIndex,

        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.grey,
        selectedIconTheme: const IconThemeData(color: Colors.white),

        onTap: _onItemTapped,

      ),
    );
  }
}
