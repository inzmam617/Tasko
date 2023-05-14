import 'package:flutter/material.dart';
import 'package:tasko/SignIn/Successful.dart';
import 'package:tasko/SignIn/forgotpass.dart';

class Resetpass extends StatefulWidget {
  const Resetpass({Key? key}) : super(key: key);

  @override
  State<Resetpass> createState() => _ResetpassState();
}

class _ResetpassState extends State<Resetpass> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Padding(padding: const EdgeInsets.symmetric(horizontal: 25),
        child: Column(
          children: <Widget>[
            Padding(padding: const EdgeInsets.only(top: 60),
                child:Align(alignment: Alignment.centerLeft,
                    child:  IconButton(icon: SizedBox(
                      height: 17,
                      width: 25,
                      child:Image.asset('assets/back.jpeg'), ), onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) {
                        return const Forgotpass();
                      }));
                    },)
                )),
            const Padding(padding: EdgeInsets.only(top: 80),
                child: Align(alignment: Alignment.centerLeft,
                    child: Text("Reset Password",style: TextStyle(fontSize: 24,color: Color(0xFF313131),))
                )),
            const Padding(padding: EdgeInsets.only(top: 12),
                child: Align(alignment: Alignment.centerLeft,
                    child: Text("Reset code was sent to your email. Please enter the code and creae ",style: TextStyle(fontSize: 10,color: Color(0xFFC6C6C6),))
                )),
            const Padding(padding: EdgeInsets.only(top: 1),
                child: Align(alignment: Alignment.centerLeft,
                    child: Text("new password",style: TextStyle(fontSize: 10,color: Color(0xFFC6C6C6),))
                )),
            Padding(padding: const EdgeInsets.only(top: 105),
                child: Container(
                  width: double.infinity, // set the width of the container
                  height: 25, // set the height of the container
                  decoration: BoxDecoration(
                    // set the border radius
                    border: Border.all(
                      color: const Color(0xFFEDEDED).withOpacity(0.3), // set the border color
                    ),
                  ),
                  child: const TextField(
                    decoration: InputDecoration(
                      hintText: 'Enter Code',
                      hintStyle: TextStyle(fontSize: 10,color: Color(0xFFC6C6C6)),// set the hint text
                      border: InputBorder.none, // remove the border around the text field
                      contentPadding: EdgeInsets.only(left: 10,bottom: 20), // set the content padding
                    ),
                  ),
                )
            ),
            Padding(padding: const EdgeInsets.only(top: 20),
                child: Container(
                  width: double.infinity, // set the width of the container
                  height: 25, // set the height of the container
                  decoration: BoxDecoration(
                    // set the border radius
                    border: Border.all(
                      color: const Color(0xFFEDEDED).withOpacity(0.3), // set the border color
                    ),
                  ),
                  child: const TextField(
                    decoration: InputDecoration(
                      hintText: 'Enter your new password',
                      hintStyle: TextStyle(fontSize: 10,color: Color(0xFFC6C6C6)),// set the hint text
                      border: InputBorder.none, // remove the border around the text field
                      contentPadding: EdgeInsets.only(left: 10,bottom: 20), // set the content padding
                    ),
                  ),
                )
            ),
            Padding(padding: const EdgeInsets.only(top: 20),
                child: Container(
                  width: double.infinity, // set the width of the container
                  height: 25, // set the height of the container
                  decoration: BoxDecoration(
                    // set the border radius
                    border: Border.all(
                      color: const Color(0xFFEDEDED).withOpacity(0.3), // set the border color
                    ),
                  ),
                  child: const TextField(
                    decoration: InputDecoration(
                      hintText: 'Confirm your new password',
                      hintStyle: TextStyle(fontSize: 10,color: Color(0xFFC6C6C6)),// set the hint text
                      border: InputBorder.none, // remove the border around the text field
                      contentPadding: EdgeInsets.only(left: 10,bottom: 20), // set the content padding
                    ),
                  ),
                )
            ),
            Padding(padding: const EdgeInsets.only(top: 30),
              child: Align(alignment: Alignment.center,
                child: SizedBox(
                  height: 35,
                  width: 150,
                  child: ElevatedButton(
                      style: ButtonStyle(
                          shape: MaterialStateProperty.all(const RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(Radius.circular(20)))),
                          backgroundColor:
                          MaterialStateProperty.all(Colors.redAccent)),
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) {
                          return const Successful();
                        }));
                      },
                      child: const Text(
                        "Change Password",
                        style: TextStyle(fontSize: 12,
                          color: Color(0xFFFFFFFF),),
                      )),
                ),),)

          ],
        ),),
      ),
    );
  }
}
