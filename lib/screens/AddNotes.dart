import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../BottomPage/BottomBarPage.dart';

class AddNotes extends StatefulWidget {
  const AddNotes({Key? key}) : super(key: key);

  @override
  State<AddNotes> createState() => _AddNotesState();
}

class _AddNotesState extends State<AddNotes> {
  @override
  void initState(){

    super.initState();
    setState(() {

      selectedColor = Colors.red;
    });


  }
  //
  addNotes() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    // Get existing tasks list from SharedPreferences
    List<String> notes = prefs.getStringList("notes") ?? [];

    // Add new task to the list
    String note = "Description: ${desc.text}, Color: ${selectedColor.toString()}";
    notes.add(note);

    // Save updated list to SharedPreferences
    prefs.setStringList("notes", notes);
    Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) {
      return BottomBarPage();
    }));
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
      content: Text('Successfully add Note'),
      duration: Duration(seconds: 1),

    ));
  }
  Color? selectedColor;
  TextEditingController desc = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Add Notes',
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
          ),
        ),
        backgroundColor:const Color(0xFFF96060),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 40),
        child: Container(
          decoration: const BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.grey,
                blurRadius: 2.5
              )
            ],
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(20))
          ),
          height: 400,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
                child: Container(
                  decoration: const BoxDecoration(
                    boxShadow: [BoxShadow(color: Colors.grey, blurRadius: 3.5)],
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                    color: Color(0xffF4F4F4),
                  ),
                  child: TextFormField(

                    controller: desc,
                    maxLines: 5,
                    decoration: const InputDecoration(
                        contentPadding:
                        EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                        border: InputBorder.none,
                        hintText: "Description",
                        hintStyle: TextStyle(color: Colors.grey)),
                  ),
                ),
              ),
              SizedBox(height: 50,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedColor = Colors.red;
                        print(selectedColor.toString());
                      });
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey,
                            blurRadius: 3.5,
                          ),
                        ],
                        color: Colors.red,
                      ),
                      width: 40,
                      height: 40,
                      child: selectedColor == Colors.red ? Icon(Icons.check) : null,
                    ),
                  ),
                  SizedBox(width: 10),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedColor = Colors.orange;
                      });
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey,
                            blurRadius: 3.5,
                          ),
                        ],
                        color: Colors.orange,
                      ),
                      width: 40,
                      height: 40,
                      child: selectedColor == Colors.orange ? Icon(Icons.check) : null,
                    ),
                  ),
                  SizedBox(width: 10),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedColor = Colors.yellow;
                      });
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey,
                            blurRadius: 3.5,
                          ),
                        ],
                        color: Colors.yellow,
                      ),
                      width: 40,
                      height: 40,
                      child: selectedColor == Colors.yellow ? Icon(Icons.check) : null,
                    ),
                  ),
                  SizedBox(width: 10),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedColor = Colors.green;
                      });
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey,
                            blurRadius: 3.5,
                          ),
                        ],
                        color: Colors.green,
                      ),
                      width: 40,
                      height: 40,
                      child: selectedColor == Colors.green ? Icon(Icons.check) : null,
                    ),
                  ),
                  SizedBox(width: 10),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedColor = Colors.blue;
                      });
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey,
                            blurRadius: 3.5,
                          ),
                        ],
                        color: Colors.blue,
                      ),
                      width: 40,
                      height: 40,
                      child: selectedColor == Colors.blue ? Icon(Icons.check) : null,
                    ),
                  ),
                  SizedBox(width: 10),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedColor = Colors.purple;
                      });
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey,
                            blurRadius: 3.5,
                          ),
                        ],
                        color: Colors.purple,
                      ),
                      width: 40,
                      height: 40,
                      child: selectedColor == Colors.purple ? const Icon(Icons.check) : null,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 50,),




              SizedBox(
                width: 140,
                height: 30,
                child: ElevatedButton(
                  style: ButtonStyle(
                      shape: MaterialStateProperty.all(const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20))
                      )),
                      backgroundColor: MaterialStateProperty.all(const Color(0xFFF96060))),
                  onPressed: () =>addNotes(),
                  child: const Text("Add Notes",style: TextStyle(fontSize: 15),),
                ),
              ),


            ],
          ),
        ),
      ),
    );
  }
}
