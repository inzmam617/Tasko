import 'package:flutter/material.dart';

import '../BottomPage/BottomBarPage.dart';
import 'forgotpass.dart';

class Login extends StatelessWidget {
  const Login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(child:
      Column(
        // mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(height: 100,),
          SizedBox(height: 225,
          width: 270,
          child: Image.asset('assets/signin.jpeg'),),
          const SizedBox(
            height: 40,
          ),
          const SizedBox(
            height: 10,
          ),
          const Center(
            child: Text(
              "Sign In",
              style: TextStyle(color: Colors.black, fontSize: 18),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 35),
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Container(
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
                      hintText: 'Name',
                      hintStyle: TextStyle(fontSize: 12,color: Color(0xFFC6C6C6)),// set the hint text
                      border: InputBorder.none, // remove the border around the text field
                      contentPadding: EdgeInsets.only(left: 10,bottom: 20), // set the content padding
                    ),
                  ),
                ),
                const SizedBox(height: 12,),
                Container(
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
                      hintText: 'Email',
                      hintStyle: TextStyle(fontSize: 12,color: Color(0xFFC6C6C6)),// set the hint text
                      border: InputBorder.none, // remove the border around the text field
                      contentPadding: EdgeInsets.only(left: 10,bottom: 20), // set the content padding
                    ),
                  ),
                ),
                const SizedBox(height: 12,),
                Container(
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
                      hintText: 'Password',
                      hintStyle: TextStyle(fontSize: 12,color: Color(0xFFC6C6C6)),// set the hint text
                      border: InputBorder.none, // remove the border around the text field
                      contentPadding: EdgeInsets.only(left: 10,bottom: 20), // set the content padding
                    ),
                  ),
                ),
                const SizedBox(height: 12,),
                Container(
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
                      hintText: 'Phone number',
                      hintStyle: TextStyle(fontSize: 12,color: Color(0xFFC6C6C6)),// set the hint text
                      border: InputBorder.none, // remove the border around the text field
                      contentPadding: EdgeInsets.only(left: 10,bottom: 20), // set the content padding
                    ),
                  ),
                ),
                const SizedBox(height: 12,),
                TextButton(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) {
                        return const Forgotpass();
                      }));
                    },
                    child: const Text(
                      "Forgot Password",
                      style: TextStyle(color: Colors.grey, fontSize: 10),
                    )),
                const SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
          Center(
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
                      return const BottomBarPage();
                    }));
                  },
                  child: const Text(
                    "Log in",
                    style: TextStyle(
                        color: Colors.white, fontSize: 14),
                  )),
            ),
          ),
          const SizedBox(height: 20,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Text("Don't have an Account?",style: TextStyle(color: Colors.grey,fontSize: 12),),
              SizedBox(width: 5,),
              Text("Sign Up" ,style: TextStyle(color: Colors.redAccent,fontSize: 12),)
            ],
          )
        ],
      ),
    ));
  }
}
