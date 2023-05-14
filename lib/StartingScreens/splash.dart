import 'dart:async';

import 'package:flutter/material.dart';

import '../BottomPage/BottomBarPage.dart';
import 'PageView.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3),
            ()=>
                Navigator.pushReplacement(context,
            MaterialPageRoute(builder:
                (context) =>
                    const BottomBarPage()
            )
        )
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
      Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 150,
            width: 150,
            child: Image.asset("assets/splash.jpeg"),),
            const SizedBox(height:20,),
            const Text("Tasko" ,style: TextStyle(color: Color(0xffde4949),fontWeight: FontWeight.bold,fontSize: 45),)
          ],
        ),
      ),
    );
  }
}
