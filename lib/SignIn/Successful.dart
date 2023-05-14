import 'package:flutter/material.dart';

class Successful extends StatefulWidget {
  const Successful({Key? key}) : super(key: key);

  @override
  State<Successful> createState() => _SuccessfulState();
}

class _SuccessfulState extends State<Successful> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          child: Column(
            children: <Widget>[
              const SizedBox(height: 170,),
              SizedBox(
                height: 175,
                width: 160,
                child: Image.asset('assets/successful.jpeg'),),
              const SizedBox(height: 50,),
              const Text("Successful!",style: TextStyle(color: Color(0xFF313131),fontSize: 22),),
              const SizedBox(height: 10,),
              const Padding(padding: EdgeInsets.symmetric(horizontal: 20),
              child: Text("You have succesfully change password. Please use your new",style: TextStyle(color: Color(0xFF313131),fontSize: 10),),),
              const Padding(padding: EdgeInsets.only(left: 20,right: 20,top: 1),
                child: Text("passwords when logging in",style: TextStyle(color: Color(0xFF313131),fontSize: 10),),),
            ],
          )
        ),
      ),
    );
  }
}
