import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:qlts/constant/asset.dart';
import 'package:qlts/constant/constant.dart';

Widget backgroundImage(BuildContext context) {
  return Image.asset(IMAGE_BACKGROUND,
      height: 279 * ws,
      width: MediaQuery.of(context).size.width,
      fit: BoxFit.fill);
}
