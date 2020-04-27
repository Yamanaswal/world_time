import 'dart:convert';

import 'package:http/http.dart';
import 'package:intl/intl.dart';

class WorldTime {
  String location; //Current Location
  String time; //Current Time
  String flag; //country Flag to asset icon
  String url; //Endpoints
  bool isDayTime; //check if day or not

  WorldTime({this.location, this.flag, this.url});

  Future<void> getTime() async {
    //make the request
    try {
      Response response = await get("http://worldtimeapi.org/api/timezone/$url");
      //get the data from World Api
      Map data = jsonDecode(response.body);

      //get data from properties
      String datetime = data["datetime"];
      String offset = data["utc_offset"].substring(1, 3);

      //create a DateTime Object form Api String
      DateTime now = DateTime.parse(datetime);
      now = now.add(Duration(hours: int.parse(offset)));
      print(now.toString());

      //set time property
      isDayTime =  now.hour > 6 && now.hour < 20 ? true : false;
      time = DateFormat.jm().format(now);

    } catch (e) {

    }
  }
}
