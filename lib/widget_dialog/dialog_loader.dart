import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

// void showLoaderDialog(BuildContext context){
//   AlertDialog alert=AlertDialog(
//     contentPadding: const EdgeInsets.all(10),
//     content: Container(
//       height: 40,
//       width: 60,
//       child: new Row(
//         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//         children: [
//           SpinKitDualRing(
//             lineWidth: 4,
//             size: 30,
//             color: Colors.blue,
//           ),
//           Container(margin: EdgeInsets.only(left: 7),child:Text("Loading ..." )),
//         ],),
//     ),
//   );
//   showDialog(barrierDismissible: false,
//     context: context,
//     builder: (context) => Center(
//       child: alert
//     ),
//   );
// }
//
void showLoaderDialog(BuildContext context){
  showDialog(
    context: context,
    builder: (context) => Center(
      child: Container(
        width: 60.0,
        height: 60.0,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(4.0),
        ),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: CupertinoActivityIndicator(),
        ),
      ),
    ),
  );
}


