import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:qlts/constant.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:vibration/vibration.dart';

class QRCodeWidget extends StatefulWidget {
  final Function callback;

  const QRCodeWidget({
    this.callback,
    Key key,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() => _QRCodeWidgetState(this.callback);
}

class _QRCodeWidgetState extends State<QRCodeWidget> {
  var flashState = flashOff;
  var cameraState = frontCamera;
  QRViewController controller;
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  Function callback;

  bool pause = false;

  _QRCodeWidgetState(this.callback);

  @override
  void initState() {
    super.initState();
  }

  Color getFlashColor() {
    switch (flashState) {
      case flashOn:
        return Colors.blue;
        break;
      default:
        return Color(0xFF303030);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 4,
          child: QRView(
            key: qrKey,
            onQRViewCreated: _onQRViewCreated,
            overlay: QrScannerOverlayShape(
              borderColor: Colors.white,
              borderLength: 20,
              borderWidth: 5,
              cutOutSize: 200,
            ),
          ),
        ),
        Expanded(
            flex: 1,
            child: GestureDetector(
              onTap: () {
                setState(() {
                  if (pause) {
                    pause = false;
                    callback('',true);
                    controller?.resumeCamera();
                  }else
                    {
                      pause = true;
                      controller?.pauseCamera();
                    }
                });
              },
              child:
                  !pause ? Icon(Icons.pause) : Icon(Icons.play_arrow_rounded),
            ))
      ],
    );
  }

  bool _isFlashOn(String current) {
    return flashOn == current;
  }

  void _onQRViewCreated(QRViewController controller) {
    this.controller = controller;
    controller.scannedDataStream.listen((scanData) async {
      if (await Vibration.hasVibrator()) {
        Vibration.vibrate(duration: 500);
      }
      controller?.pauseCamera();
      setState(() {
        pause = true;
      });
      print("*****home_qrcode: data==>> $scanData");
      callback(scanData, false);
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}
