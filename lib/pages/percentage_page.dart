import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class PercentagePage extends StatefulWidget {
  const PercentagePage({super.key});

  @override
  State<PercentagePage> createState() => _PercentagePageState();
}

class _PercentagePageState extends State<PercentagePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(child:
    Scaffold(
      appBar: AppBar(title: const Text("PERCENTAGE"),),
      body: Center(
        child: Column(

          children: [
            CircularPercentIndicator(
              radius: 60.0,
              lineWidth: 5.0,
              percent: 1.0,
              center: const Text("100%"),
              progressColor: Colors.green,
            ),
            CircularPercentIndicator(
              radius: 120.0,
              lineWidth: 13.0,
              animation: true,
              percent: 0.7,
              center: const Text(
                "70.0%",
                style:
                 TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
              ),
              footer: const Text(
                "Sales this week",
                style:
                 TextStyle(fontWeight: FontWeight.bold, fontSize: 17.0),
              ),
              circularStrokeCap: CircularStrokeCap.round,
              progressColor: Colors.purple,
            ),
        Expanded(
          child: ListView(
            scrollDirection: Axis.horizontal,
           // mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              CircularPercentIndicator(
                radius: 45.0,
                lineWidth: 4.0,
                percent: 0.10,
                center: const Text("10%"),
                progressColor: Colors.red,
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.0),
              ),
              CircularPercentIndicator(
                radius: 45.0,
                lineWidth: 4.0,
                percent: 0.30,
                center: const Text("30%"),
                progressColor: Colors.orange,
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.0),
              ),
              CircularPercentIndicator(
                radius: 45.0,
                lineWidth: 4.0,
                percent: 0.60,
                center: const Text("60%"),
                progressColor: Colors.yellow,
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.0),
              ),
              CircularPercentIndicator(
                radius: 45.0,
                lineWidth: 4.0,
                percent: 0.90,
                center: const Text("90%"),
                progressColor: Colors.green,
              ),
              CircularPercentIndicator(
                radius: 45.0,
                lineWidth: 4.0,
                percent: 0.90,
                center: const Text("12%"),
                progressColor: Colors.black,
              )
            ],
          ),
        )
          ],
        ),
      ),
    )
    );
  }
}
