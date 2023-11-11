import 'package:flutter/material.dart';
import 'package:world_time_app/services/world_time.dart';
import 'package:http/http.dart';
import 'dart:convert';


class Loading extends StatefulWidget {
  const Loading({super.key});

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {


  String time = 'loading...';

  void setWorldTime() async{

    WorldTime instance = WorldTime(location: 'India', flag: 'india.png', url: 'Asia/Kolkata');
    await instance.getTime();
    
    Navigator.pushReplacementNamed(context, '/home', arguments: {
      'location': instance.location,
      'flag': instance.flag,
      'time': instance.time,
      
    });
  }



  @override
  void initState() {
    super.initState();
    setWorldTime();
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Text(time),
      )
    );
  }
}