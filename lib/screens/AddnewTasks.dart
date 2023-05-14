import 'dart:math';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:intl/intl.dart';

import '../BottomPage/BottomBarPage.dart';

class AddNewTask extends StatefulWidget {
  const AddNewTask({Key? key}) : super(key: key);

  @override
  State<AddNewTask> createState() => _AddNewTaskState();
}

List<String> list = [ "Today" , "Monthly"];

class _AddNewTaskState extends State<AddNewTask> {
  String getRandomMaterialColor() {
    final random = Random();
    MaterialColor color =
        Colors.primaries[random.nextInt(Colors.primaries.length)];
    int hexValue = color.value;
    String hex = hexValue.toRadixString(16).toUpperCase();
    return "0xFF$hex";
  }

  late String colorString;

  @override
  void initState() {
    super.initState();
    colorString = getRandomMaterialColor();
    print(colorString);
  }

  addtasks() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> tasks = prefs.getStringList("tasks") ?? [];
    String task = "Title: ${title.text}, Project Name: ${projectName.text}, Description: ${description.text}, Date: ${DateTime.now()}, ProjectColor: $colorString , DueDate : ${_selectedDate.toString().substring(0,10)} , DueTime : ${DateFormat.jm().format(DateTime(
      DateTime.now().year,
      DateTime.now().month,
      DateTime.now().day,
      _selectedTime.hour,
      _selectedTime.minute,
    ))}";
    tasks.add(task);
    prefs.setStringList("tasks", tasks);
    // ignore: use_build_context_synchronously
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (BuildContext context) {
      return const BottomBarPage();
    }));
    // ignore: use_build_context_synchronously
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
      content: Text('Successfully add task'),
      duration: Duration(seconds: 1),
    ));
    print(task);
  }

  String? validateEmpty(String? value) {
    if (value == null || value.isEmpty) {
      return 'This field is required.';
    }
    return null;
  }

// Add task to list
//   tasks.add(task);
  TextEditingController projectName = TextEditingController();
  TextEditingController title = TextEditingController();
  TextEditingController description = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  // DateTime _selectedDate=DateTime.now();
  // String date='';
  // Future<void> _selectDate(BuildContext context) async {
  //   final DateTime? picked = await showDatePicker(
  //     context: context,
  //     initialDate: DateTime.now(),
  //     firstDate: DateTime.now(),
  //     lastDate: DateTime(DateTime.now().year, 12, 31),
  //   );
  //
  //
  //   if (picked != null && picked != _selectedDate) {
  //     setState(() {
  //       _selectedDate = picked;
  //       date = DateFormat('yyyy-MM-dd').format(_selectedDate);
  //       print(date);
  //       setState(() {
  //
  //       });
  //     });
  //   }
  // }
  DateTime _selectedDate = DateTime.now();
  TimeOfDay _selectedTime = TimeOfDay.now();

  Future<void> _selectDateTime(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(DateTime.now().year, 12, 31),
    );

    if (pickedDate != null && pickedDate != _selectedDate) {
      // ignore: use_build_context_synchronously
      final TimeOfDay? pickedTime = await showTimePicker(
        context: context,
        initialTime: _selectedTime,
      );

      if (pickedTime != null) {
        setState(() {
          _selectedDate = pickedDate;
          _selectedTime = pickedTime;
        });
        print(_selectedDate);
        print(_selectedTime);
      }
    }
  }
  bool visible = false;

  String dropdownValue = list.first;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 5,horizontal: 10),
          child: SizedBox(

            child: Material(
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(10))
              ),
              elevation: 5.0,
              color: const Color(0xFFF96060),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: DropdownButton<String>(

                  dropdownColor:  const Color(0xFFF96060),
                value: dropdownValue,
                icon: const Icon(Icons.arrow_downward,color: Colors.white,),
                elevation: 16,
                style: const TextStyle(color: Colors.deepPurple),
                underline: const SizedBox.shrink(),
                onChanged: (String? value) {
                  // This is called when the user selects an item.
                  setState(() {
                    dropdownValue = value!;
                    if(value == "Monthly"){
                      setState(() {
                        visible = true;
                      });

                          }
                      else{
                        visible = false;
                    }
                  });
                },
                items: list.map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value,style: const TextStyle(color: Colors.white,fontSize: 18),),
                  );
                }).toList(),
      ),
              ),
            ),
          ),
        )

        ],
        centerTitle: true,
        title: const Text(
          'Add New Task',
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
          ),
        ),
        backgroundColor: const Color(0xFFF96060),
      ),
      body: Form(
        key: _formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "In",
                        style: TextStyle(color: Colors.black87, fontSize: 20),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            height: 45,
                            decoration: const BoxDecoration(
                              boxShadow: [
                                BoxShadow(color: Colors.grey, blurRadius: 3.5)
                              ],
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15)),
                              color: Color(0xffF4F4F4),
                            ),
                            child: TextFormField(
                              validator: validateEmpty,
                              controller: projectName,
                              decoration: const InputDecoration(
                                  contentPadding:
                                      EdgeInsets.symmetric(horizontal: 20),
                                  border: InputBorder.none,
                                  hintText: "Enter Your Project",
                                  hintStyle: TextStyle(color: Colors.grey)),
                            ),
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Container(
                height: 45,
                decoration: const BoxDecoration(
                  boxShadow: [BoxShadow(color: Colors.grey, blurRadius: 3.5)],
                  borderRadius: BorderRadius.all(Radius.circular(15)),
                  color: Color(0xffF4F4F4),
                ),
                child: TextFormField(
                  validator: validateEmpty,
                  controller: title,
                  decoration: const InputDecoration(
                      contentPadding: EdgeInsets.symmetric(horizontal: 20),
                      border: InputBorder.none,
                      hintText: "Title",
                      hintStyle: TextStyle(color: Colors.grey)),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Container(
                decoration: const BoxDecoration(
                  boxShadow: [BoxShadow(color: Colors.grey, blurRadius: 3.5)],
                  borderRadius: BorderRadius.all(Radius.circular(15)),
                  color: Color(0xffF4F4F4),
                ),
                child: TextFormField(
                  validator: validateEmpty,
                  controller: description,
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
            const SizedBox(
              height: 10,
            ),
            Visibility(
              visible: visible,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Container(
                  height: 50,
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    boxShadow: [BoxShadow(color: Colors.grey, blurRadius: 3.5)],
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                    color: Color(0xffF4F4F4),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text("Due Date"),
                        const SizedBox(width: 10,),
                        ElevatedButton(onPressed: (){
                          _selectDateTime( context );
                        },
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(const Color(0xff6074F9))
                        ), child: const Text("Date / Time" ),),

                        const SizedBox(width: 10,),

                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                                _selectedDate == DateTime.now()
                                    ? ""
                                    :  DateFormat('yyyy-MM-dd').format(_selectedDate)
                            ),

                            Text(
                                _selectedTime ==  TimeOfDay.now()
                                    ? ""
                                    :  DateFormat.jm().format(DateTime(
                                  DateTime.now().year,
                                  DateTime.now().month,
                                  DateTime.now().day,
                                  _selectedTime.hour,
                                  _selectedTime.minute,
                                )),
                                // _selectedTime.toString().substring(10 ,15)
                            ),
                          ],
                        ),


                      ],
                    ),
                  ),
                ),
              ),
            ),

            SizedBox(height: 100,),
            SizedBox(
              width: 150,
              height: 45,
              child: ElevatedButton(
                style: ButtonStyle(
                    shape: MaterialStateProperty.all(RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20)))),
                    backgroundColor: MaterialStateProperty.all(
                      Color(0xFFF96060),
                    )),
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    // // if(date==''){
                    //   ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    //     content: const Text('Please pick due date'),
                    //     duration: const Duration(seconds: 1),
                    //   ));
                    //
                    // }
                    // else {
                      addtasks();
                    // }
                  }
                },
                child: Text("ADD TASK"),
              ),
            ),
            SizedBox(
              height: 100,
            ),
          ],
        ),
      ),
    );
  }
}
