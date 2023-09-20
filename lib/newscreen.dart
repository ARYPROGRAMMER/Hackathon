

import 'dart:io';

import 'package:flutter/material.dart';

class NewScreen extends StatelessWidget{


  const NewScreen({super.key});
  static String id = 'new_screen';


  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body:


            Center(
              child: Container(
              width: 500,
                height: 500,
                color: const Color(0xffD8BFD8),
                child: ElevatedButton(
                  onPressed: (){
                    exit(0);
                  }, child: Text("PLEASE RESTART THE APP BY CLICKING HERE.",style: Theme.of(context).textTheme.displayLarge!.copyWith(fontSize:40,fontWeight:FontWeight.bold,color: const Color(0xffb0e0e6)),),
                ),
              ),
            ),



    );
  }


}