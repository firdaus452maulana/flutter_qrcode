import 'package:flutter/material.dart';
import 'package:flutter_qrcode/generate_qrcode.dart';
import 'package:flutter_qrcode/result_scan.dart';
import 'package:flutter_qrcode/scan_barcode.dart';
import 'package:flutter_qrcode/scan_qrcode.dart';
import 'package:qr_flutter/qr_flutter.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MainMenu()
    );
  }
}

class MainMenu extends StatefulWidget {
  @override
  _MainMenuState createState() => _MainMenuState();
}

class _MainMenuState extends State<MainMenu> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
            "Main Menu"
        ),
      ),
      body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              RaisedButton(
                child: Text(
                    "Generate"
                ),
                onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context){
                    return GenerateQrCode();
                  }));
                },
              ),
              SizedBox(height: 12,),

              RaisedButton(
                child: Text(
                    "Scan"
                ),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => ScanQrCode()));
                },
              ),
            ],
          )
      ),
    );
  }
}





