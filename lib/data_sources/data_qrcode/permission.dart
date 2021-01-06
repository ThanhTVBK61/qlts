import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:qlts/constant/asset.dart';
import 'package:qlts/data_sources/data_qrcode/qrcode.dart';


class PermissionWidget extends StatefulWidget {
  final permission;
  final callback;


  PermissionWidget({Key key, this.permission, this.callback}) : super(key: key);

  @override
  State<StatefulWidget> createState() =>
      PermissionState(this.permission, this.callback);
}

class PermissionState extends State<PermissionWidget> {
  final Permission _permission;
  PermissionStatus _permissionStatus = PermissionStatus.undetermined;
  bool _permanentlyDenied = false;
  Function callback;

  PermissionState(this._permission, this.callback);

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _listenForPermissionStatus();
  }

  void _listenForPermissionStatus() async {
    final status = await _permission.status;
    if(this.mounted){
      setState(() {
        if (status == PermissionStatus.permanentlyDenied ||
            status == PermissionStatus.restricted) {
          _permanentlyDenied = true;
        }
        _permissionStatus = status;
      });
    }
  }

  // Color getPermissionColor() {
  //   switch (_permissionStatus) {
  //     case PermissionStatus.granted:
  //       return Colors.green;
  //       break;
  //     case PermissionStatus.denied:
  //       return Colors.red;
  //       break;
  //     case PermissionStatus.restricted:
  //       return Colors.yellow;
  //       break;
  //     case PermissionStatus.permanentlyDenied:
  //       return Colors.black;
  //       break;
  //     default:
  //       return Colors.grey;
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: (_permissionStatus == PermissionStatus.granted)
            ? Container(height: 220, width: 300, child: QRCodeWidget(callback: (data, clear) {
                print("*****permission: data==>> $data");
                callback(data,clear);
              }))
            : GestureDetector(
                onTap: () {
                  requestPermission(_permission);
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      height: 28,
                      margin: const EdgeInsets.only(top: 20, bottom: 40),
                      child: Text(
                        'Truy cập camera',
                        style: TextStyle(
                            fontSize: 16,
                            color: Color(0xFF00A2E5),
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    SvgPicture.asset(IMAGE_CAMERA),
                  ],
                ),
              ),
      ),
    );
  }

  void requestPermission(Permission permission) async {
    final status = await permission.request();

    if ((status == PermissionStatus.restricted ||
            status == PermissionStatus.permanentlyDenied) &&
        _permanentlyDenied) {
      openAppSettings();
    }
    setState(() {
      if (status == PermissionStatus.permanentlyDenied ||
          status == PermissionStatus.restricted) {
        _permanentlyDenied = true;
      }
      _permissionStatus = status;
      print(_permissionStatus);
    });
  }
}
