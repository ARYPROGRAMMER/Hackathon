import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:moodify/screens/home_screen.dart';
import 'package:moodify/splashing.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Settings extends StatelessWidget{


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff36454F),
        title: Text("Settings",style: Theme.of(context).textTheme.displayLarge!.copyWith(color: Colors.black),),
      ),

      body:
      Container(
        color: const Color(0xaf494F55),
        width: double.infinity,
        height: double.infinity,
        child: Column(

          children: [
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Container(
                  width: 300,
                  height: 300,
                  child:Image.asset("assets/images/set.png")),
            ),
            Padding(
              padding: const EdgeInsets.all(14.0),
              child: Container(child: Text("About Phone",style: Theme.of(context).textTheme.displayLarge!.copyWith(color: Colors.black,fontSize: 30,fontWeight: FontWeight.bold),)),
            ),

            Padding(
              padding: const EdgeInsets.all(14.0),
              child: Container(child: Text(" INFO",style: Theme.of(context).textTheme.displayLarge!.copyWith(color: Colors.black,fontSize: 20,fontWeight: FontWeight.bold),)),
            ),

            Padding(
              padding: const EdgeInsets.all(14.0),
              child: Container(child: Text("About App",style: Theme.of(context).textTheme.displayLarge!.copyWith(color: Colors.black,fontSize: 30,fontWeight: FontWeight.bold),)),
            ),






            Padding(
              padding: const EdgeInsets.all(14.0),
              child: Container(child: Text("App Info",style: Theme.of(context).textTheme.displayLarge!.copyWith(color: Colors.black,fontSize: 20,fontWeight: FontWeight.bold),)),
            ),




            Padding(
              padding: const EdgeInsets.all(14.0),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.purple),
                onPressed: () async{
                  var prefs = await SharedPreferences.getInstance();
                  prefs.setBool(SplashPageState.KEYLOGIN,false);
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>HomeScreen()));
                }, child: Text("Logout",style: Theme.of(context).textTheme.displayLarge!.copyWith(color: Colors.redAccent,fontSize: 30,fontWeight: FontWeight.bold),),
              ),
            ),


                   ],
        ),
      ),
    );
  }


}