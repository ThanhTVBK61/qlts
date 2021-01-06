import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qlts/constant/constant.dart';
import 'package:qlts/provider/home_inventory/inventory_image_provider.dart';

class ShowImage extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    var getInventoryImage = Provider.of<InventoryImageProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Container(
            padding: EdgeInsets.only(top: 10*ws),
            child: Text(
              'Ảnh hiện trường',
              style: TextStyle(color: Color(0xFFF2F2F9), fontSize: 20*fs),
            )),
        centerTitle: true,
        leading: Container(
          margin: EdgeInsets.only(left: 20*ws),
          child: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
      ),
      body: Center(
        child: getInventoryImage.imageBase64 == null
            ? Text('Empty')
            :Image.memory(base64.decode(getInventoryImage.imageBase64)),
      ),
    );
  }

}