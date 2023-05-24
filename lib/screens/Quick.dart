import 'package:flutter/material.dart';
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
    initialize();
  }

  List<String>? notes;

  initialize() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    notes = prefs.getStringList("notes");

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
                    // ignore: use_build_context_synchronously
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      content: Text('Notes are empty'),
                      duration: Duration(seconds: 1),

                    ));



                  }, icon: const Icon(Icons.delete,color: Colors.grey,)),

                ],
              ),
            // Expanded(
            //   child: FutureBuilder(
            //     future: SharedPreferences.getInstance(),
            //     builder: (BuildContext context, AsyncSnapshot<SharedPreferences> snapshot) {
            //       List<String> notes = snapshot.data?.getStringList('notes') ?? [];
            //
            //       if(notes.isEmpty){
            //         return const Center(child: Text("No Notes Yet!!"),);
            //
            //       }
            //       if (snapshot.hasData) {
            //         return ListView.builder(
            //           physics: const ScrollPhysics(),
            //           itemCount:notes.length,
            //           itemBuilder: (BuildContext context, int index) {
            //             String note = notes[index];
            //             List<String> parts = note.split(", ");
            //             String desc = parts[0].substring("Description: ".length);
            //             String color = parts[1].substring("Color: ".length);
            //             return Padding(
            //                 padding: const EdgeInsets.all(20),
            //                 child: Container(
            //                   width: double.infinity,
            //                   decoration: const BoxDecoration(
            //                       color: Colors.white,
            //                       borderRadius: BorderRadius.all(Radius.circular(20)),
            //                       boxShadow: [
            //                         BoxShadow(
            //                             color: Colors.grey,
            //                             blurRadius: 3.5
            //                         )
            //                       ]
            //                   ),
            //                   child: Padding(
            //                     padding: const EdgeInsets.all(10),
            //                     child: Column(
            //                       children: [
            //                         Padding(
            //                           padding: const EdgeInsets.symmetric(horizontal: 20),
            //                           child: Container(
            //                             decoration: BoxDecoration(
            //
            //                               color: Color(int.parse(color) ),
            //                               borderRadius: const BorderRadius.all(Radius.circular(20))
            //                             ),
            //                             width: double.infinity,
            //                             height: 10,
            //                           ),
            //                         ),
            //                         const SizedBox(height: 20,),
            //                         Center(
            //                           child: Text(desc),
            //                         ),
            //                       ],
            //                     ),
            //                   ),
            //                 )
            //
            //             );
            //           },
            //         );
            //       } else {
            //         return const Center(child: CircularProgressIndicator());
            //       }
            //     },
            //   ),
            // ),
              Expanded(
                child: FutureBuilder(
                  future: SharedPreferences.getInstance(),
                  builder: (BuildContext context, AsyncSnapshot<SharedPreferences> snapshot) {
                    if (snapshot.hasData) {
                      List<String> notes = snapshot.data?.getStringList('notes') ?? [];

                      if (notes.isEmpty) {
                        return const Center(child: Text("No Notes Yet!!"));
                      }

                      return ListView.builder(
                        physics: const ScrollPhysics(),
                        itemCount: notes.length,
                        itemBuilder: (BuildContext context, int index) {
                          String note = notes[index];
                          List<String> parts = note.split(", ");
                          String desc = parts[0].substring("Description: ".length);
                          String colorString = parts[1].substring("Color: ".length);
                          int colorValue = int.tryParse(colorString) ?? Colors.grey.value;
                          Color color = Color(colorValue);

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
                                    blurRadius: 3.5,
                                  )
                                ],
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(10),
                                child: Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.symmetric(horizontal: 20),
                                      child: Container(
                                        decoration: BoxDecoration(
                                          color: color,
                                          borderRadius: const BorderRadius.all(Radius.circular(20)),
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



            ],
          ),
        ));
  }
}
