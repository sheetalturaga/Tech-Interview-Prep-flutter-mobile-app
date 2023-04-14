import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';

class SampleCircularPage extends StatefulWidget {
  @override
  _SampleCircularPageState createState() => _SampleCircularPageState();
}

class _SampleCircularPageState extends State<SampleCircularPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("BlindSpot App"),
      ),
      body: Center(
        child: ListView(
          padding: EdgeInsets.all(20), //You can use EdgeInsets like above
          children: <Widget>[
            SizedBox(
              height: 30.0,
            ),
            Text(
              "Progress",
              style: TextStyle(
                color: Colors.blue,
                fontSize: 25.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 45.0,
            ),
            Text(
              "Completed Percentage",
              style: TextStyle(
                color: Colors.blue,
                fontSize: 20.0,
              ),
              textAlign: TextAlign.right,
            ),
            Divider(
              color: Colors.blue,
            ),
            SizedBox(
              height: 20.0,
            ),
            Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
              CircularPercentIndicator(
                radius: 60.0,
                lineWidth: 13.0,
                animation: true,
                animationDuration: 5000,
                percent: 0.2,
                animateFromLastPercent: true,
                center: Text(
                  "30.0%",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
                ),
                footer: Text(
                  "PYTHON",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17.0),
                ),
                circularStrokeCap: CircularStrokeCap.round,
                progressColor: Colors.orange,
              ),
              CircularPercentIndicator(
                radius: 60.0,
                lineWidth: 13.0,
                animation: true,
                animationDuration: 5000,
                percent: 0.6,
                animateFromLastPercent: true,
                center: Text(
                  "70.0%",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
                ),
                footer: Text(
                  "JAVA",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17.0),
                ),
                circularStrokeCap: CircularStrokeCap.round,
                progressColor: Color.fromARGB(255, 228, 145, 241),
              ),
              CircularPercentIndicator(
                radius: 60.0,
                lineWidth: 13.0,
                animation: true,
                animationDuration: 5000,
                percent: 0.5,
                animateFromLastPercent: true,
                center: Text(
                  "50.0%",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
                ),
                footer: Text(
                  "C++",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17.0),
                ),
                circularStrokeCap: CircularStrokeCap.round,
                progressColor: Color.fromARGB(255, 9, 224, 16),
              ),
            ]),
            SizedBox(
              height: 45.0,
            ),
            Text(
              "Completed Questions",
              style: TextStyle(
                color: Colors.blue,
                fontSize: 20.0,
              ),
              textAlign: TextAlign.right,
            ),
            Divider(
              color: Colors.blue,
            ),
            SizedBox(
              height: 20.0,
            ),
            Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
              CircularPercentIndicator(
                radius: 60.0,
                lineWidth: 13.0,
                animation: true,
                animationDuration: 5000,
                percent: 0.2,
                animateFromLastPercent: true,
                center: Text(
                  "10/50",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
                ),
                footer: Text(
                  "PYTHON",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17.0),
                ),
                circularStrokeCap: CircularStrokeCap.round,
                progressColor: Colors.orange,
              ),
              CircularPercentIndicator(
                radius: 60.0,
                lineWidth: 13.0,
                animation: true,
                animationDuration: 5000,
                percent: 0.6,
                animateFromLastPercent: true,
                center: Text(
                  "30/50",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
                ),
                footer: Text(
                  "JAVA",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17.0),
                ),
                circularStrokeCap: CircularStrokeCap.round,
                progressColor: Color.fromARGB(255, 228, 145, 241),
              ),
              CircularPercentIndicator(
                radius: 60.0,
                lineWidth: 13.0,
                animation: true,
                animationDuration: 5000,
                percent: 0.5,
                animateFromLastPercent: true,
                center: Text(
                  "25/50",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
                ),
                footer: Text(
                  "C++",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17.0),
                ),
                circularStrokeCap: CircularStrokeCap.round,
                progressColor: Color.fromARGB(255, 9, 224, 16),
              ),
            ]),
          ],
        ),
      ),
    );
  }
}
