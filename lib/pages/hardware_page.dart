import 'dart:async';
import 'dart:io';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:device_info_plus/device_info_plus.dart';


class HardwarePage extends StatefulWidget {
  const HardwarePage({super.key});

  @override
  State<HardwarePage> createState() => _HardwarePageState();
}

class _HardwarePageState extends State<HardwarePage> {

  String appName = "";
  String packageName = "";
  String version = "";
  String buildNumber = "";
  String deviceName = "";
  String tipoConexao = "";

  late StreamSubscription subscription;

  @override
  void initState() {
   _carregar();
   subscription = Connectivity().onConnectivityChanged.listen((ConnectivityResult result) {
     // Got a new connectivity status!
     print(result);
   });
    super.initState();
  }
  _carregar() async {
  PackageInfo packageInfo = await PackageInfo.fromPlatform();

   appName = packageInfo.appName;
   packageName = packageInfo.packageName;
   version = packageInfo.version;
   buildNumber = packageInfo.buildNumber;

   ///DEVICE INFOS

  DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
  if(Platform.isAndroid) {
    AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
    deviceName = androidInfo.model; // e.g. "Moto G (4)"
  }else if(Platform.isIOS) {
    IosDeviceInfo iosInfo = await deviceInfo.iosInfo;
    deviceName = iosInfo.utsname.machine!; // e.g. "iPod7,1"
  }else{
    WebBrowserInfo webBrowserInfo = await deviceInfo.webBrowserInfo;
    deviceName = webBrowserInfo.userAgent!;
  }
  ///CONECAO INFOS

  final connectivityResult = await (Connectivity().checkConnectivity());
  if (connectivityResult == ConnectivityResult.mobile) {
    // I am connected to a mobile network.
    tipoConexao = "Mobile";
  } else if (connectivityResult == ConnectivityResult.wifi) {
    // I am connected to a wifi network.
    tipoConexao = "Wi-fi";
  } else if (connectivityResult == ConnectivityResult.ethernet) {
    // I am connected to a ethernet network.
    tipoConexao = "Ethernet";
  } else if (connectivityResult == ConnectivityResult.vpn) {
    tipoConexao = "Vpn";
    // I am connected to a vpn network.
    // Note for iOS and macOS:
    // There is no separate network interface type for [vpn].
    // It returns [other] on any device (also simulator)
  } else if (connectivityResult == ConnectivityResult.bluetooth) {
    tipoConexao = "bluetooth";
    // I am connected to a bluetooth.
  } else if (connectivityResult == ConnectivityResult.other) {
    // I am connected to a network which is not in the above mentioned networks.
  } else if (connectivityResult == ConnectivityResult.none) {
    // I am not connected to any network.
  }

  setState(() {

   });

}
// Be sure to cancel subscription after you are done
  @override
  dispose() {
    subscription.cancel();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      appBar: AppBar(title: Text("HARDWARE"),),
      body: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: ListView(

          children: [
            Text("App Name: $appName"),
            const SizedBox(height: 25,),
            Text("PackageName: $packageName"),
            const SizedBox(height: 25,),
            Text("Versão App: $version"),
            const SizedBox(height: 25,),
            Text("Build Number: $buildNumber"),
            const SizedBox(height: 25,),
            Text("S.O.: ${Platform.operatingSystem} "),
            const SizedBox(height: 25,),
            Text("DEVICE: $deviceName "),
            const SizedBox(height: 25,),
            Text("TIPO CONEXÃO: $tipoConexao "),


          ],
        ),
      )
      ),
    );
  }
}
