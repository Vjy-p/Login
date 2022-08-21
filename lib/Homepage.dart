import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class Homepage extends StatelessWidget{
  Homepage({Key? key}):super(key: key);

  @override
  Widget build(BuildContext context){
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text(" Example"),
        leading: Icon(Icons.menu,size: 4.h,),),
        body: Center(
          child: Text("welcome",style: TextStyle(fontSize: 16.sp,fontWeight: FontWeight.w300,color: Colors.cyanAccent),),
        ),
      ),
    );
  }
}