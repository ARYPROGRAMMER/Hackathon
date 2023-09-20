import 'dart:async';

import 'package:flutter/material.dart';

import 'package:moodify/bottom_bar_double_bullet/bottom_bar_double_bullet.dart';
import 'package:moodify/bottom_bar_item.dart';
import 'package:moodify/call_feature.dart';
import 'package:moodify/notification_center.dart';
import 'package:moodify/settings.dart';


import 'package:moodify/splash_screen.dart';
import 'package:moodify/splashing.dart';


void main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Moodify',
      theme: ThemeData(
          textTheme: TextTheme(
            displayLarge: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.w500,
                fontFamily: 'FontMain',
                color: Colors.lightBlue),
            displayMedium: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w300,
                fontFamily: 'FontMain',
                color: Colors.black),
            displaySmall: TextStyle(
                fontSize: 10,
                fontWeight: FontWeight.w100,
                fontFamily: 'FontMain',
                color: Colors.red),
          ),
          primarySwatch: Colors.lightBlue),
      home: Splashing(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key, key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var _width = 2.0;
  var _height = 2.0;

  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 1, milliseconds: 5), () {
      _width = 100.0;
      _height = 20.0;
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomBarDoubleBullet(
        items: [
          BottomBarItem(iconData: Icons.home),
          BottomBarItem(iconData: Icons.notifications),
          BottomBarItem(iconData: Icons.settings),
          BottomBarItem(iconData: Icons.emergency),
        ],
        onSelect: (index) {
          if (index == 0) {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => MyHomePage()));
          } else if (index == 1) {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => NotificationCenter()));
          } else if (index == 2) {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => Settings()));
          } else {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => MakeACall()));
          }
        },
      ),


      body: Container(
        color: const Color(0xffD8BFD8),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Stack(children: [
            const Positioned(
              left: 330,
              child: CircleAvatar(
                maxRadius: 130,
                backgroundColor: const Color(0xca703BE7),
              ),
            ),
            const Positioned(
              right: 200,
              child: CircleAvatar(
                maxRadius: 700,
                backgroundColor: const Color(0x449C79EF),
              ),
            ),
            const Positioned(
              left: 100,
              bottom: 1300,
              child: CircleAvatar(
                maxRadius: 200,
                backgroundColor: const Color(0xaa7E50EA),
              ),
            ),
            const Positioned(
              left: 300,
              bottom: 950,
              child: CircleAvatar(
                maxRadius: 150,
                backgroundColor: const Color(0x889C79EF),
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Align(
                  alignment: Alignment.topLeft,
                  child: Padding(
                      padding: const EdgeInsets.only(
                          top: 28.0, right: 28, bottom: 28, left: 15),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                              bottom: 8.0,
                              top: 15,
                            ),
                            child: Container(
                                width: 150,
                                height: 150,
                                child:
                                    Image.asset("assets/images/new_logo.png")),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Text(
                              "HELLO, ",
                              style: Theme.of(context)
                                  .textTheme
                                  .displayLarge!
                                  .copyWith(fontSize: 40, color: Colors.black),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 7, right: 52),
                            child: Text("USER",
                                style: Theme.of(context)
                                    .textTheme
                                    .displayLarge!
                                    .copyWith(fontSize: 35)),
                          ),
                        ],
                      )),
                ),
                Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding:
                          const EdgeInsets.only(left: 15, bottom: 10, top: 10),
                      child: Text(
                        "General",
                        style: Theme.of(context)
                            .textTheme
                            .displayLarge!
                            .copyWith(color: Colors.black),
                      ),
                    )),

                Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: const EdgeInsets.only(
                        top: 15.0, right: 15, bottom: 15, left: 15),
                    child: InkWell(
                      onTap: () {

                        Navigator.push(

                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    SplashScreen())); /////add a notepaddddddddddddddddddddddddddddddddddddddddd
                      },
                      child: Container(

                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              border: Border.all(width: 1, color: Colors.black),
                              color: const Color(0xffb0e0e6),
                              image:const DecorationImage(
                                image: AssetImage("assets/images/health7.png"),
                                fit: BoxFit.cover,
                              ),

                              boxShadow: [
                                BoxShadow(spreadRadius: 2, blurRadius: 6)
                              ]),
                          width: 170,
                          height: 170,
                          child: Container(
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  top: 140.0, left: 40, right: 40),
                              child: Text(
                                "Assesment",
                                style:
                                    Theme.of(context).textTheme.displayMedium!.copyWith(fontSize: 17,fontWeight: FontWeight.bold),
                              ),
                            ),
                          )),
                    ),
                  ),
                ),

                Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding:
                          const EdgeInsets.only(left: 15, bottom: 10, top: 20),
                      child: Text(
                        "Mood Wise",
                        style: Theme.of(context)
                            .textTheme
                            .displayLarge!
                            .copyWith(color: Colors.black),
                      ),
                    )),


                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        SplashScreen())); /////add a notepaddddddddddddddddddddddddddddddddddddddddd
                          },
                          child: Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  border:
                                      Border.all(width: 1, color: Colors.black),
                                  color: const Color(0xffcff0f5),
                                  image:const DecorationImage(
                                    image: AssetImage("assets/images/health4.png"),
                                    fit: BoxFit.cover,
                                  ),
                                  boxShadow: [
                                    BoxShadow(spreadRadius: 2, blurRadius: 6)
                                  ]),
                              width: 170,
                              height: 170,
                              child: Container(
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      top: 140.0, left: 60, right: 45),
                                  child: Text(
                                    "Anger",
                                    style: Theme.of(context)
                                        .textTheme
                                        .displayMedium!.copyWith(fontWeight: FontWeight.bold,fontSize: 17),
                                  ),
                                ),
                              )),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                border:
                                    Border.all(width: 1, color: Colors.black),
                                color: const Color(0xff76ff7a),
                                image:const DecorationImage(
                                  image: AssetImage("assets/images/health5.png"),
                                  fit: BoxFit.cover,
                                ),
                                boxShadow: [
                                  BoxShadow(spreadRadius: 2, blurRadius: 6)
                                ]),
                            width: 170,
                            height: 170,
                            child: Container(
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    top: 140.0, left: 70, right: 45),
                                child: Text(
                                  "Sad",
                                  style:
                                      Theme.of(context).textTheme.displayMedium!.copyWith(fontSize: 17,fontWeight: FontWeight.bold),
                                ),
                              ),
                            )),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              border: Border.all(width: 1, color: Colors.black),
                              color: const Color(0xff91B2C7),
                              image:const DecorationImage(
                                image: AssetImage("assets/images/health6.png"),
                                fit: BoxFit.cover,
                              ),
                              boxShadow: [
                                BoxShadow(spreadRadius: 2, blurRadius: 6)
                              ],
                            ),
                            width: 170,
                            height: 170,
                            child: Container(
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    top: 140.0, left: 50, right: 45),
                                child: Text(
                                  "Dilemma",
                                  style:
                                      Theme.of(context).textTheme.displayMedium!.copyWith(fontWeight: FontWeight.bold,fontSize: 17),
                                ),
                              ),
                            )),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              border: Border.all(width: 1, color: Colors.black),
                              color: const Color(0xffc9aa88),
                              image:const DecorationImage(
                                image: AssetImage("assets/images/health10.png"),
                                fit: BoxFit.cover,
                              ),
                              boxShadow: [
                                BoxShadow(spreadRadius: 2, blurRadius: 6)
                              ],
                            ),
                            width: 170,
                            height: 170,
                            child: Container(
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    top: 140.0, left: 33, right: 30),
                                child: Text(
                                  "Overthinking",
                                  style:
                                      Theme.of(context).textTheme.displayMedium!.copyWith(fontWeight: FontWeight.bold,fontSize: 17),
                                ),
                              ),
                            )),
                      )
                    ],
                  ),
                ),


                Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding:
                          const EdgeInsets.only(left: 15, bottom: 10, top: 20),
                      child: Text(
                        "Activities",
                        style: Theme.of(context)
                            .textTheme
                            .displayLarge!
                            .copyWith(color: Colors.black),
                      ),
                    )),


                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        SplashScreen())); /////add a notepaddddddddddddddddddddddddddddddddddddddddd
                          },
                          child: Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  border:
                                      Border.all(width: 1, color: Colors.black),
                                  color: const Color(0xffb0e0e6),
                                  image:const DecorationImage(
                                    image: AssetImage("assets/images/health8.png"),
                                    fit: BoxFit.cover,
                                  ),
                                  boxShadow: [
                                    BoxShadow(spreadRadius: 2, blurRadius: 6)
                                  ]),
                              width: 170,
                              height: 170,
                              child: Container(
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      top: 146.0, left: 63, right: 45),
                                  child: Text(
                                    "Yoga",
                                    style: Theme.of(context)
                                        .textTheme
                                        .displayMedium!.copyWith(fontSize: 17,fontWeight: FontWeight.bold),
                                  ),
                                ),
                              )),
                        ),
                      ),

                      // Padding(
                      //   padding: const EdgeInsets.all(15.0),
                      //   child:
                      //   Container(
                      //       decoration: BoxDecoration(
                      //           borderRadius: BorderRadius.circular(15),
                      //           border: Border.all(width: 1,color: Colors.black),
                      //           color: const Color(0xff89CFF0),
                      //           boxShadow: [BoxShadow(
                      //               spreadRadius: 2,
                      //               blurRadius: 6
                      //           )]
                      //
                      //       ),
                      //       width: 170,
                      //       height: 170,
                      //
                      //       child: Container(
                      //
                      //         child: Padding(
                      //           padding: const EdgeInsets.only(top: 128.0,left: 47,right:40 ),
                      //
                      //           child: Text(
                      //             "My Journal",
                      //             style: Theme.of(context).textTheme.displayMedium,
                      //           ),
                      //         ),
                      //       )),
                      //
                      // ),

                      Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                border:
                                    Border.all(width: 1, color: Colors.black),
                                color: const Color(0xffAFE1AF),
                                image:const DecorationImage(
                                  image: AssetImage("assets/images/health3.png"),
                                  fit: BoxFit.cover,
                                ),
                                boxShadow: [
                                  BoxShadow(spreadRadius: 2, blurRadius: 6)
                                ]),
                            width: 170,
                            height: 170,
                            child: Container(
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    top: 140.0, left: 45, right: 45),
                                child: Text(
                                  "My Journal",
                                  style:
                                      Theme.of(context).textTheme.displayMedium,
                                ),
                              ),
                            )),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                border:
                                    Border.all(width: 1, color: Colors.black),
                                color: const Color(0xffadd8e6),
                                image:const DecorationImage(
                                  image: AssetImage("assets/images/health3.png"),
                                  fit: BoxFit.cover,
                                ),
                                boxShadow: [
                                  BoxShadow(spreadRadius: 2, blurRadius: 6)
                                ]),
                            width: 170,
                            height: 170,
                            child: Container(
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    top: 140.0, left: 45, right: 45),
                                child: Text(
                                  "My Journal",
                                  style:
                                      Theme.of(context).textTheme.displayMedium,
                                ),
                              ),
                            )),
                      )
                    ],
                  ),
                ),


                Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding:
                          const EdgeInsets.only(left: 15, bottom: 10, top: 25),
                      child: Text(
                        "My Personal Space",
                        style: Theme.of(context)
                            .textTheme
                            .displayLarge!
                            .copyWith(color: Colors.black),
                      ),
                    )),


                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      // Padding(
                      //   padding: const EdgeInsets.all(15.0),
                      //   child: InkWell(
                      //     onTap: (){
                      //       Navigator.push(context, MaterialPageRoute(builder: (context)=>SplashScreen())); /////add a notepaddddddddddddddddddddddddddddddddddddddddd
                      //     },
                      //     child:
                      //     Container(
                      //         decoration: BoxDecoration(
                      //             borderRadius: BorderRadius.circular(15),
                      //             border: Border.all(width: 1,color: Colors.black),
                      //             color: const Color(0xffcff0f5),
                      //             boxShadow: [BoxShadow(
                      //                 spreadRadius: 2,
                      //                 blurRadius: 6
                      //             )]
                      //
                      //         ),
                      //         width: 170,
                      //         height: 170,
                      //
                      //         child:Container(
                      //
                      //           child: Padding(
                      //             padding: const EdgeInsets.only(top: 128.0,left: 47,right:40 ),
                      //
                      //             child: Text(
                      //               "My Journal",
                      //               style: Theme.of(context).textTheme.displayMedium,
                      //             ),
                      //           ),
                      //         )),
                      //
                      //   ),
                      // ),
                      // Padding(
                      //   padding: const EdgeInsets.all(15.0),
                      //   child:
                      //   Container(
                      //       decoration: BoxDecoration(
                      //           borderRadius: BorderRadius.circular(15),
                      //           border: Border.all(width: 1,color: Colors.black),
                      //           color: const Color(0xff76ff7a),
                      //           boxShadow: [BoxShadow(
                      //               spreadRadius: 2,
                      //               blurRadius: 6
                      //           )]
                      //
                      //       ),
                      //       width: 170,
                      //       height: 170,
                      //
                      //       child: Container(
                      //
                      //         child: Padding(
                      //           padding: const EdgeInsets.only(top: 128.0,left: 47,right:40 ),
                      //
                      //           child: Text(
                      //             "My Journal",
                      //             style: Theme.of(context).textTheme.displayMedium,
                      //           ),
                      //         ),
                      //       )),
                      //
                      // ),
                      Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              border: Border.all(width: 1, color: Colors.black),
                              color: const Color(0xff91B2C7),
                              image:const DecorationImage(
                                image: AssetImage("assets/images/health3.png"),
                                fit: BoxFit.cover,
                              ),
                              boxShadow: [
                                BoxShadow(spreadRadius: 2, blurRadius: 6)
                              ],
                            ),
                            width: 170,
                            height: 170,
                            child: InkWell(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            SplashScreen())); /////add a notepaddddddddddddddddddddddddddddddddddddddddd
                              },
                              child: Container(
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      top: 140.0, left: 40, right: 45),
                                  child: Text(
                                    "Self-Review",
                                    style:
                                        Theme.of(context).textTheme.displayMedium,
                                  ),
                                ),
                              ),
                            )),
                      ),

                      Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              border: Border.all(width: 1, color: Colors.black),
                              color: const Color(0xffc9aa88),
                              image:const DecorationImage(
                                image: AssetImage("assets/images/health3.png"),
                                fit: BoxFit.cover,
                              ),
                              boxShadow: [
                                BoxShadow(spreadRadius: 2, blurRadius: 6)
                              ],
                            ),
                            width: 170,
                            height: 170,
                            child: Container(
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    top: 140.0, left: 45, right: 45),
                                child: Text(
                                  "My Journal",
                                  style:
                                      Theme.of(context).textTheme.displayMedium,
                                ),
                              ),
                            )),
                      )
                    ],
                  ),
                ),


                Align(
                  alignment: Alignment.bottomRight,
                  child: AnimatedContainer(
                      width: _width,
                      height: _height,
                      duration: Duration(seconds: 2, milliseconds: 5),
                      child: Text(
                        "- PROTOTYPE BY HYDRA",
                        style: Theme.of(context)
                            .textTheme
                            .displaySmall!
                            .copyWith(
                                fontWeight: FontWeight.bold,
                                fontSize: 9,
                                fontFamily: "FontMain2",
                                color: Colors.lightBlueAccent),
                      )),
                ),
              ],
            ),
            const Positioned(
              left: 200,
              top: 600,
              child: CircleAvatar(
                maxRadius: 900,
                backgroundColor: const Color(0x559C79EF),
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
