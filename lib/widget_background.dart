
import 'package:flutter/material.dart';

Widget backgroundImage(BuildContext context){
  return Image.asset(
    'assets/images/background.png',
    height: 279,
    width: MediaQuery.of(context).size.width,
    fit: BoxFit.fill,
  );
}

