import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Menu extends StatefulWidget {
  const Menu({Key? key}) : super(key: key);

  @override
  State<Menu> createState() => _MenuState();

}

class _MenuState extends State<Menu> {


  List listofprojects=[
    "Personal",
    "Teamworks",
    "Home",
    "Meet",
    "Gym",
    "Lhapre"
  ];
  List nooftasks=[10,20,30,40,60, 20];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body:
      Padding(padding: EdgeInsets.symmetric(horizontal: 16),
      child:
      Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(height: 50,),
          const Center(
            child: Text('Projects',style: TextStyle(fontSize: 20,color: Colors.black),),
          ),
          FutureBuilder(
            future: SharedPreferences.getInstance(),
            builder: (BuildContext context, AsyncSnapshot<SharedPreferences> snapshot) {
              List<String> tasks = snapshot.data?.getStringList('tasks') ?? [];

              if(tasks.isEmpty){
                return const Padding(
                  padding: EdgeInsets.only(top: 20),
                  child: Center(child: Text("No Projects Yet!!"),),
                );

              }
              if (snapshot.hasData) {
                return  Expanded(
                    child:
                    GridView.builder(
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,

                    ),itemCount:tasks.length,
                      itemBuilder: (BuildContext context, int index) {
                        String task = tasks[index];

                        List<String> parts = task.split(", ");

                        String projectName = parts[1].substring("Project Name: ".length);
                        String projectColor = parts[4].substring("ProjectColor: ".length);


                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  boxShadow: [
                                    BoxShadow(
                                        color: Colors.grey,
                                        blurRadius: 3.5
                                    )
                                  ]
                              ),
                              child: Padding(padding: EdgeInsets.only(left: 24,top: 24),
                                child: Align(alignment: Alignment.centerLeft,
                                  child:
                                  Column(
                                    children: [
                                      Container(
                                        width: 14,
                                        height: 14,
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: Color(int.parse(projectColor)),
                                          boxShadow: [
                                            BoxShadow(
                                              color: Colors.black.withOpacity(0.2),
                                              blurRadius: 5,
                                              offset: const Offset(0, 3),
                                            ),
                                          ],
                                        ),
                                      ),
                                      const SizedBox(height: 50,),
                                      Text(projectName,style: const TextStyle(fontSize: 18),),
                                      const SizedBox(height: 15,),
                                      Text('${tasks.length} Tasks',style: const TextStyle(fontSize: 14,color: Color(0xFF9A9A9A)),),
                                    ],
                                  ),
                                ),)
                            //         Container(
                            //   color: Colors.grey,
                            //   child: Center(
                            //     child: Text('Grid item ${index + 1}'),
                            //   ),
                            // ),
                          ),
                        );
                      },)
                )
              ;
              } else {
                return const Center(child: CircularProgressIndicator());
              }
            },
          ),



        ],
      ),
    ));
  }
  Color _generateRandomColor() {
    final random = Random();
    return Color.fromRGBO(
      random.nextInt(255),
      random.nextInt(255),
      random.nextInt(255),
      1,
    );
  }
}
