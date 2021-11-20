import 'package:flutter/material.dart';
import 'package:flutter_qrcode/generate_qrcode.dart';
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

class MainMenu extends StatelessWidget {
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
                onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => GenerateQrCode()));
                },
              )
            ],
          )
      ),
    );
  }
}




