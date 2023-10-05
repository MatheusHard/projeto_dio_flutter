import 'package:battery_plus/battery_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class BateriaPage extends StatefulWidget {
  const BateriaPage({super.key});

  @override
  State<BateriaPage> createState() => _BateriaPageState();
}

class _BateriaPageState extends State<BateriaPage> {

  late Battery battery;
  late int statusBateria = 0;
  @override
  void initState() {
    battery = Battery();
    _carregarBateria();
    battery.onBatteryStateChanged.listen((event) {
      print(event);
    });
    super.initState();
  }

  _carregarBateria() async{
    statusBateria = await battery.batteryLevel;
    setState(() {

    });
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      appBar: AppBar(title: Text("Bateria"),),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,

          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              alignment: Alignment.center,
              child: CircularPercentIndicator(
                radius: 45.0,
                lineWidth: 4.0,
                percent: statusBateria / 100,
                center: Text("$statusBateria.0%"),
                progressColor: Colors.black,
              ),
            )

          ],
        )
    ));
  }
}
