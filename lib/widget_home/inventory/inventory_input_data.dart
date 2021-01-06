import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:qlts/constant/constant.dart';
import 'package:qlts/data_sources/data_source_inventory/inventory_detail_model.dart';
import 'package:qlts/data_sources/data_source_search/item_search_model.dart';
import 'package:qlts/data_sources/data_sqflite/database_provider.dart';
import 'package:qlts/provider/home_inventory/inventory_config_data_provider.dart';
import 'package:qlts/provider/home_inventory/inventory_fixed_provider.dart';
import 'package:qlts/provider/home_inventory/inventory_image_provider.dart';
import 'package:qlts/provider/home_inventory/inventory_provider.dart';
import 'package:qlts/provider/home_inventory/inventory_detail_provider.dart';
import 'package:qlts/repository/repository_database.dart';
import 'package:qlts/widget_dialog/dialog_error.dart';
import 'package:qlts/widget_home/button_widget.dart';
import 'package:qlts/widget_home/inventory/inventory_information_update.dart';
import 'package:qlts/repository/repository.dart';

class InventoryInputData extends StatefulWidget {
  final token;

  InventoryInputData({this.token});

  @override
  State<StatefulWidget> createState() => InventoryInputDataState();
}

class InventoryInputDataState extends State<InventoryInputData> {
  String _soThe = '';
  String _id = '';
  String _serial = '';
  bool error = false;

  ItemSearchModel itemSearchModel;
  Repository repository = Repository();
  RepositoryDatabase repositoryDatabase =
      RepositoryDatabase(DatabaseProvider.getInstance);

  InventoryDetailModel inventoryDetailModel;

  final picker = ImagePicker();

  @override
  Widget build(BuildContext context) {
    var inventoryData = Provider.of<InventoryData>(context);
    var getInventoryDetailData = Provider.of<InventoryDetailData>(context);
    var getInventoryImage = Provider.of<InventoryImageProvider>(context);

    ///Get Inventory Fixed
    var getInventoryFixedData =
        Provider.of<InventoryFixedDataProvider>(context);

    ///Get Config
    var getInventoryConfigData = Provider.of<InventoryConfigData>(context);

    return SingleChildScrollView(
      // child: ConstrainedBox(
      //   constraints:
      //       // BoxConstraints(maxHeight: getInventoryDetailData.listInventoryDetail.length == 0 ? (MediaQuery.of(context).w.height*1.25 - 300):MediaQuery.of(context).w.height*1.4),
      //       // BoxConstraints(maxHeight: getInventoryDetailData.listInventoryDetail.length == 0 ? 620.0*hs: 970.0*ws),
      //       BoxConstraints(maxHeight: getInventoryDetailData.listInventoryDetail.length == 0 ? 2350.h: 970.0*ws),
      child: Column(
        children: [
          Card(
            margin: EdgeInsets.only(
                bottom: 20 * ws, right: 20 * ws, left: 20 * ws, top: 20 * ws),
            shadowColor: Colors.white70,
            elevation: 10.0,
            color: Colors.white.withOpacity(1),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16 * ws),
            ),
            child: Container(
              height: 280 * ws,
              child: Container(
                padding: EdgeInsets.only(
                    bottom: 10 * ws,
                    top: 20 * ws,
                    right: 20 * ws,
                    left: 20 * ws),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    ///So the va ID
                    Expanded(
                      flex: 1,
                      child: Row(
                        children: [
                          ///So the
                          Expanded(
                              flex: 10,
                              child: Container(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    RichText(
                                      text: TextSpan(
                                          style: TextStyle(
                                              color: Color(0xFF050505),
                                              fontSize: 13 * fs),
                                        children: [
                                          TextSpan(text: 'Số thẻ '),
                                          TextSpan(text: '(*)', style: TextStyle(color: Colors.red))
                                        ])),
                                    TextField(
                                      onChanged: (data) {
                                        setState(() {
                                          _soThe = data;
                                        });
                                      },
                                      style: TextStyle(
                                        fontSize: 16 * fs,
                                        color: Color(0xFF050505),
                                        fontWeight: FontWeight.bold,
                                      ),
                                      decoration: InputDecoration(
                                          hintText: 'Nhập số thẻ',
                                          hintStyle: TextStyle(
                                              color: Color(0xFF9E9E9E))),
                                    ),
                                  ],
                                ),
                              )),
                          Spacer(flex: 1),

                          /// Id
                          Expanded(
                              flex: 10,
                              child: Container(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    RichText(
                                        text: TextSpan(
                                            style: TextStyle(
                                                color: Color(0xFF050505),
                                                fontSize: 13 * fs),
                                            children: [
                                              TextSpan(text: 'Số thẻ '),
                                              TextSpan(text: '(*)', style: TextStyle(color: Colors.red))
                                            ])),
                                    TextField(
                                      onChanged: (data) {
                                        setState(() {
                                          _id = data;
                                        });
                                      },
                                      style: TextStyle(
                                        fontSize: 16 * fs,
                                        color: Color(0xFF050505),
                                        fontWeight: FontWeight.bold,
                                      ),
                                      decoration: InputDecoration(
                                          hintText: 'Nhập mã số',
                                          hintStyle: TextStyle(
                                              color: Color(0xFF9E9E9E))),
                                    ),
                                  ],
                                ),
                              )),
                        ],
                      ),
                    ),

                    ///Serial
                    Expanded(
                        flex: 1,
                        child: Container(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                  margin: EdgeInsets.only(top: 5 * ws),
                                  child: Text(
                                    'Serial',
                                    style: TextStyle(
                                        color: Color(0xFF050505),
                                        fontSize: 13 * fs),
                                    overflow: TextOverflow.ellipsis,
                                  )),
                              TextField(
                                onChanged: (data) {
                                  setState(() {
                                    _serial = data;
                                  });
                                },
                                style: TextStyle(
                                  fontSize: 16 * fs,
                                  color: Color(0xFF050505),
                                  fontWeight: FontWeight.bold,
                                ),
                                decoration: InputDecoration(
                                    hintText: 'Nhập số serial number',
                                    hintStyle:
                                        TextStyle(color: Color(0xFF9E9E9E))),
                              ),
                            ],
                          ),
                        )),

                    ///Click inventory
                    Row(
                      mainAxisAlignment: inventoryData.online ? MainAxisAlignment.spaceEvenly : MainAxisAlignment.center,
                      children: [
                        Visibility(
                          visible: inventoryData.online,
                          child: RaisedGradientButton(
                              onPressed: () async {
                                // final picker = ImagePicker();
                                final pickedFile = await picker.getImage(
                                    source: ImageSource.camera);

                                setState(() {
                                  if (pickedFile != null) {
                                    getInventoryImage.update(base64.encode(
                                        File(pickedFile.path).readAsBytesSync()));
                                  } else {
                                    print('No image selected.');
                                  }
                                });
                              },
                              child: Text(
                                'Chụp ảnh',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w700,
                                    fontSize: 14 * fs),
                              )),
                        ),
                        RaisedGradientButton(
                            onPressed: () async {
                              setState(() {
                                error = _validate() ? false : true;
                              });

                              FocusScope.of(context).requestFocus(FocusNode());
                              ///Clear old data
                              getInventoryDetailData.clear();

                              if (inventoryData.online) {
                                getInventoryImage.clear();
                                if (_validate()) {
                                  print(
                                      '****inventory_input_data*** token: ${widget.token},inventoryId: ${inventoryData.currentId.toString()},soThe: $_soThe, assetCodeNumber: $_id,');
                                  inventoryDetailModel = await repository
                                      .fetchInventoryDetailInput(
                                          token: widget.token,
                                          inventoryId: inventoryData.currentId
                                              .toString(),
                                          soThe: _soThe.trim(),
                                          assetCodeNumber: _id.trim(),
                                          serial: '_serial');

                                  if (inventoryDetailModel.errorCode !=
                                      SUCCESS) {
                                    if (inventoryDetailModel.errorCode ==
                                        TIME_OUT) {
                                      inventoryData.clear();
                                      getInventoryFixedData.clear();
                                      getInventoryDetailData.clear();
                                      getInventoryImage.clear();
                                      getInventoryConfigData.clear();
                                    }

                                    ///Show error code
                                    showErrorDialog(
                                        context: this.context,
                                        errorCode:
                                            inventoryDetailModel.errorCode,
                                        errorDesc:
                                            inventoryDetailModel.errorDesc);
                                  } else {
                                    getInventoryDetailData
                                        .update(inventoryDetailModel);
                                  }
                                }
                              } else {
                                if (inventoryData.emptySqflite) {
                                  showErrorDialog(context: context, errorDesc: EMPTY_SQFLITE);
                                } else {
                                  dynamic inventoryOffline =
                                      await repositoryDatabase
                                          .databaseRepositoryOffline
                                          .getDataById(
                                              _soThe,
                                              _id,
                                              getInventoryConfigData
                                                  .listDataVariantConfig);
                                  print('---------inventoryOffline-----------');
                                  print(inventoryOffline);
                                  if(inventoryOffline != null){
                                    print(getInventoryConfigData
                                        .listDataVariantConfig[0].code);
                                    print('-----Then--Update-----------');
                                    getInventoryDetailData
                                        .updateInventoryOffline(
                                            inventoryOffline);
                                  }else{
                                    showErrorDialog(context: context, errorDesc: ERROR_NOT_FOUND);
                                  }
                                }
                              }
                            },
                            child: Text(
                              'Tra cứu',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w700,
                                  fontSize: 14 * fs),
                            ))
                      ],
                    ),

                    Visibility(
                      visible: error,
                      child: Text(
                        '*Vui lòng nhập đầy đủ thông tin',
                        style: TextStyle(color: Colors.red),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          InventoryInformationUpdate(token: widget.token)
        ],
      ),
      // ),
    );
  }

  bool _validate() {
    if (_soThe != '' && _id != '' && _serial != '') return true;
    return false;
  }
}
