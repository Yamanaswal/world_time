import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:worldtime/services/world_time.dart';

class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  void setUpWorldTime() async {
    WorldTime worldTime = new WorldTime(
        location: "Berlin", flag: "germany", url: "Europe/Berlin");
    await worldTime.getTime();
    print(worldTime.time);
    Navigator.pushReplacementNamed(context, '/home', arguments: {
      "location": worldTime.location,
      "time": worldTime.time,
      "flag": worldTime.flag,
      "isDayTime":worldTime.isDayTime
    });
  }

  @override
  void initState() {
    super.initState();
    setUpWorldTime();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        backgroundColor: Colors.greenAccent,
        body: Center(
          child: SpinKitHourGlass(color: Colors.lightBlueAccent, size: 50.0),
        ),
      ),
    );
  }
}
