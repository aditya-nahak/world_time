import 'package:flutter/material.dart';
import 'package:worldtime/services/world_time.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class loading extends StatefulWidget {
  @override
  _loadingState createState() => _loadingState();
}

class _loadingState extends State<loading> {



void GetDateTime() async {
  WorldTime instance = WorldTime(location: 'India', url: 'Asia/Kolkata', flag: 'India.png');
  await instance.getTime();
  Navigator.pushReplacementNamed(context, '/home', arguments: {
    'location' : instance.location,
    'flag' : instance.flag,
    'time' : instance.time,
    'isDaytime' : instance.isDaytime
  });
}

  @override
  void initState() {
    super.initState();
    GetDateTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SpinKitFadingCircle(
          color: Colors.grey[500],
          size: 50.0,
        ),
      ),
    );
  }
}