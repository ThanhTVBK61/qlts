import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:qlts/constant/constant.dart';

class RaisedGradientButton extends StatelessWidget {
  final Widget child;
  // final Gradient gradient;

  final Function onPressed;

   RaisedGradientButton({
    Key key,
    @required this.child,
    // this.gradient,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 140*ws,
      height: 40*ws,
      margin: EdgeInsets.only(bottom: 20*ws),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          gradient: LinearGradient(
          colors: [
            Color(0xFF00A3FF),
            Color(0xFF0033E7),
            //add more colors for gradient
          ],
          begin: Alignment.topLeft, //begin of the gradient color
          end: Alignment.bottomRight, //end of the gradient color
          stops: [0, 0.4]
      ), boxShadow: [
        BoxShadow(
          color: Colors.grey[500],
          offset: Offset(0.0, 1.5),
          blurRadius: 1.5,
        ),
      ]),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
            onTap: onPressed,
            child: Center(
              child: child,
            )),
      ),
    );
  }
}