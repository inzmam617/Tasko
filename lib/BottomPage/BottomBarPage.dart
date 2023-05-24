import 'package:flutter/material.dart';
import 'package:tasko/screens/home.dart';
import '../screens/AddNotes.dart';
import '../screens/AddnewTasks.dart';
import '../screens/tabBarforprojectsAndNotes.dart';

class BottomBarPage extends StatefulWidget {
  const BottomBarPage({Key? key}) : super(key: key);

  @override
  State<BottomBarPage> createState() => _BottomBarPageState();
}

class _BottomBarPageState extends State<BottomBarPage> {
  int _selectedIndex = 0;
  static const List<Widget> _widgetOptions = <Widget>[
    Home(),
    TabBarPage(),

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
                            return const AddNewTask();
                          }));


                        },
                        child: const Text("Add Task",style: TextStyle(color: Colors.black),),
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
        backgroundColor: const Color(0xff292E4E),
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            backgroundColor:  Color(0xff2a2e4d),
            icon: Icon(Icons.task_alt_rounded,size: 30,
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            backgroundColor:  Color(0xff2a2e4d),
            icon: Icon(Icons.menu,size: 30,
            ),
            label: '',
          ),
          // BottomNavigationBarItem(
          //   backgroundColor:  Color(0xff2a2e4d),
          //
          //   icon: Padding(
          //     padding:  EdgeInsets.only(left: 50),
          //     child: Icon(Icons.table_view_sharp,size: 28,),
          //   ),
          //   label: '',            // backgroundColor: Color(0xff2a2e4d),
          // ),
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
