import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Quick extends StatefulWidget {
  const Quick({Key? key}) : super(key: key);

  @override
  State<Quick> createState() => _QuickState();
}

class _QuickState extends State<Quick> {
  @override
  void initState() {
    super.initState();
    initiliaze();
  }

  List<String>? notes;

  initiliaze() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    notes = prefs.getStringList("notes");
    print(notes);
  }


  bool showButtons = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SizedBox(height: 50,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  IconButton(onPressed: () async {
                    final SharedPreferences prefs = await SharedPreferences.getInstance();

                    notes?.clear();
                    await prefs.setStringList("notes", notes!);
                    setState(() {

                    });
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: const Text('Notes are empty'),
                      duration: const Duration(seconds: 1),

                    ));



                  }, icon: Icon(Icons.delete,color: Colors.grey,)),

                ],
              ),
            Expanded(
              child: FutureBuilder(
                future: SharedPreferences.getInstance(),
                builder: (BuildContext context, AsyncSnapshot<SharedPreferences> snapshot) {
                  List<String> notes = snapshot.data?.getStringList('notes') ?? [];

                  if(notes.isEmpty){
                    return const Center(child: Text("No Notes Yet!!"),);

                  }
                  if (snapshot.hasData) {
                    return ListView.builder(
                      physics: const ScrollPhysics(),
                      itemCount:notes.length,
                      itemBuilder: (BuildContext context, int index) {
                        String note = notes[index];
                        List<String> parts = note.split(", ");
                        String desc = parts[0].substring("Description: ".length);
                        String color = parts[1].substring("Color: ".length);
                        return Padding(
                            padding: const EdgeInsets.all(20),
                            child: Container(
                              width: double.infinity,
                              decoration: const BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.all(Radius.circular(20)),
                                  boxShadow: [
                                    BoxShadow(
                                        color: Colors.grey,
                                        blurRadius: 3.5
                                    )
                                  ]
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(10),
                                child: Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.symmetric(horizontal: 20),
                                      child: Container(
                                        decoration: BoxDecoration(

                                          color: Color(int.parse(color.substring(35, 45)) ),
                                          borderRadius: const BorderRadius.all(Radius.circular(20))
                                        ),
                                        width: double.infinity,
                                        height: 10,
                                      ),
                                    ),
                                    const SizedBox(height: 20,),
                                    Center(
                                      child: Text(desc),
                                    ),
                                  ],
                                ),
                              ),
                            )

                        );
                      },
                    );
                  } else {
                    return const Center(child: CircularProgressIndicator());
                  }
                },
              ),
            ),

              // SizedBox(
              //   height: MediaQuery.of(context).size.height,
              //   child: ListView.builder(
              //     physics: const ScrollPhysics(),
              //     itemCount: 5,
              //     itemBuilder: (BuildContext context, int index) {
              //       return Padding(
              //         padding: const EdgeInsets.symmetric(
              //             horizontal: 10, vertical: 8),
              //         child: Container(
              //           height: 150,
              //           width: double.infinity,
              //           decoration: BoxDecoration(
              //             color: Colors.black,
              //             borderRadius: BorderRadius.all(Radius.circular(20)),
              //             boxShadow: [
              //               BoxShadow(
              //                 color: Colors.grey,
              //                 blurRadius: 3.5
              //               )
              //             ]
              //           ),
              //         )
              //
              //       );
              //     },
              //   ),
              // )
            ],
          ),
        ));
  }
}
