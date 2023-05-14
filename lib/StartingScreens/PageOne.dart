import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PageOne extends StatelessWidget {
  const PageOne({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
      Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(
            height: 100,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: SizedBox(
                height: 252,
                width: 305,
                child: Image.asset(
                  "assets/logo1.jpeg",
                ),
              )
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Column(
            children: const [
              Text("Welcome to Tasko",style: TextStyle(color: Colors.black,fontSize: 22),),
              SizedBox(height: 10,),
              Text("Whats going to happen tomorrow?",style: TextStyle(color: Colors.black54,fontSize: 16),),
            ],
          ),
          const SizedBox(height: 40,),

          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: SvgPicture.asset("assets/scroll1.svg"),
            ),
          ),

          Expanded(
            child: Align(
              alignment: Alignment.bottomCenter,
              child: SizedBox(
                height: MediaQuery.of(context).size.height / 2.8,
                child: Stack(
                  children: [
                    Container(
                      height: double.infinity,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          borderRadius: const BorderRadius.only(
                              topRight: Radius.circular(10),
                              topLeft: Radius.circular(100)),
                          color: Colors.redAccent.withOpacity(0.8),
                          boxShadow: const [
                            BoxShadow(color: Colors.grey, blurRadius: 3.5)
                          ]),
                      child: Center(child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 35),
                        child: Column(

                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              width: 150,
                              height: 35,
                              child: ElevatedButton(
                                style: ButtonStyle(
                                  shape: MaterialStateProperty.all(const RoundedRectangleBorder(
                                    borderRadius: BorderRadius.all(Radius.circular(20))
                                  )),
                                  backgroundColor: MaterialStateProperty.all(Colors.white)
                                ),
                                  onPressed: (){}, child: const Text("Get Started",style: TextStyle(color: Colors.black),)),
                            ),
                            const SizedBox(height: 50,),


                            const Text("Login" ,style: TextStyle(color: Colors.white,fontSize: 18),)
                          ],
                        ),
                      )),
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
