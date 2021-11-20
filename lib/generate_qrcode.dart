import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:qr_flutter/qr_flutter.dart';

class GenerateQrCode extends StatefulWidget {
  @override
  _GenerateQrCodeState createState() => _GenerateQrCodeState();
}

class _GenerateQrCodeState extends State<GenerateQrCode> {

  TextEditingController _inputDataController;
  String inputData = "null";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _inputDataController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(
        "Generate QR Code",
      )),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Text(
                "Generate New QR Code",
                style: GoogleFonts.openSans(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 16),
              ),
              SizedBox(
                height: 12,
              ),
              Container(
                margin: EdgeInsets.all(12),
                padding: EdgeInsets.symmetric(vertical: 12),
                child: TextFormField(
                  cursorColor: Colors.black,
                  style: GoogleFonts.openSans(fontSize: 12),
                  keyboardType: TextInputType.text,
                  controller: _inputDataController,
                  decoration: new InputDecoration(
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(16)),
                      ),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(16)),
                          borderSide: BorderSide(
                              color: Color(0xFF000000).withOpacity(0.15))),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(16)),
                          borderSide: BorderSide(color: Color(0xFF1F3A93))),
                      filled: false,
                      contentPadding: EdgeInsets.only(left: 24.0, right: 24.0),
                      hintStyle: GoogleFonts.openSans(
                          fontSize: 12,
                          color: Color(0xFF000000).withOpacity(0.15)),
                      hintText: "Input Data",
                      errorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(16)),
                          borderSide: BorderSide(color: Colors.red)),
                      focusedErrorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(16)),
                          borderSide: BorderSide(color: Colors.red, width: 1)),
                      errorStyle: GoogleFonts.openSans(fontSize: 10)),
                  obscureText: false,
                  validator: (value) {
                    if (value.isEmpty) {
                      return "Field is required";
                    }
                    return null;
                  },
                  onSaved: (value) {},
                ),
              ),
              SizedBox(
                height: 12,
              ),
              RaisedButton(
                child: Text(
                  "Generate",
                ),
                onPressed: () {
                  setState(() {
                    inputData = _inputDataController.text;
                  });
                },
              ),
              SizedBox(
                height: 16,
              ),
              Container(
                margin: EdgeInsets.all(12),
                padding: EdgeInsets.all(4),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.black,
                    width: 2,
                  ),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: QrImage(
                  version: 5,
                  backgroundColor: Colors.white,
                  foregroundColor: Colors.black,
                  errorCorrectionLevel: QrErrorCorrectLevel.M,
                  padding: EdgeInsets.all(0),
                  size: 300,
                  data: inputData,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
