import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:qlts/constant/asset.dart';

void showSuccessDialog({BuildContext context, String message}) {
  Dialog errorDialog = Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.0)),
      child: Container(
        height: 410,
        width: 335,
        child: Column(
          children: [
            Container(
                margin: const EdgeInsets.only(left: 265, top: 10),
                child: IconButton(
                    color: Colors.black,
                    icon: Icon(Icons.clear_rounded),
                    onPressed: (){
                        Navigator.pop(context);

                    })),
            SvgPicture.asset(IMAGE_SUCCESS),
            Container(
              margin: const EdgeInsets.only(right: 50, left: 50, top: 50),
              child: message == null ? Text('Thành công !',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
              ): Text(message,
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
              ),
            ),
          ],
        ),
      ));
  showDialog(context: context, builder: (BuildContext context) => errorDialog);
}
