import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  Map data = {};
  @override
  Widget build(BuildContext context) {

    data = data.isNotEmpty ? data : ModalRoute.of(context).settings.arguments;
    String bgimg = data['isDaytime'] ? 'day.png' : 'night.png';
    Color bgcolor = data['isDaytime'] ? Colors.blue : Colors.indigo[700];
    print(data);

    return Scaffold(
      backgroundColor: bgcolor,
      body:SafeArea(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/$bgimg'),
                fit: BoxFit.cover,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0, 200.0, 0, 0),
            child: Column(
              children: <Widget>[
                Center(
                  child: FlatButton.icon(
                    onPressed: () async {
                    dynamic result = await Navigator.pushNamed(context, '/location');
                    setState(() {
                      data = {
                        'time' : result['time'],
                        'location': result['location'],
                        'isDaytime': result['isDaytime'],
                        'flag': result['flag']
                      };
                    });
                    },
                    icon: Icon(
                        Icons.edit_location,
                      color: Colors.grey[400],
                    ),
                    label: Text(
                        'Change Location',
                      style: TextStyle(
                        fontSize: 20.0,
                        color: Colors.grey[400]
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20.0,),
                Text(
                  data['location'],
                  style: TextStyle(
                    fontSize: 35.0,
                    letterSpacing: 2.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.white
                  ),
                ),
                SizedBox(height: 20.0,),
                Text(
                  data['time'],
                  style: TextStyle(
                      fontSize: 40.0,
                      letterSpacing: 2.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.white
                  ),
                ),
              ],
            ),
          ),
        ),
      )
    );
  }
}
