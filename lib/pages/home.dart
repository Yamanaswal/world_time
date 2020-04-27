import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Map data = {};

  @override
  Widget build(BuildContext context) {
    //data from Time
    data = data.isNotEmpty ? data : ModalRoute.of(context).settings.arguments;
    print(data);

    //set background image
    String bgImage = data["isDayTime"] ? "day_image.jpeg" : "night_image.jpeg";
    Color bgColor = data["isDayTime"] ? Colors.white : Colors.indigo;

    return Scaffold(
        backgroundColor: bgColor,
        body: SafeArea(
          child: Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/' + bgImage), fit: BoxFit.cover)),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(0, 100, 0, 0),
              child: Column(children: <Widget>[
                FlatButton.icon(
                    onPressed: () async {
                      dynamic result =
                          await Navigator.pushNamed(context, '/location');
                      //set Data from Choose Location Page
                      if (result != null) {
                        setState(() {
                          data = {
                            'time': result['time'],
                            'location': result['location'],
                            'isDayTime': result['isDayTime'],
                            'flag': result['flag']
                          };
                        });
                      }
                    },
                    icon: Icon(Icons.edit_location),
                    label: Text("Edit Location")),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      data["location"],
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.red),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                Text(data["time"],
                    style: TextStyle(
                        fontSize: 35,
                        fontWeight: FontWeight.bold,
                        color: Colors.deepOrange)),
              ]),
            ),
          ),
        ));
  }
}
